using DocumentFormat.OpenXml.Drawing.Charts;
using DocumentFormat.OpenXml.Office2016.Drawing.ChartDrawing;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Wordprocessing;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Security.Cryptography;
using System.Text;
using System.Text;
using static Azure.Core.HttpHeader;

namespace KabEleMSSolutionsctroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CreatePhonePePaymentController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<CreatePhonePePaymentController> _logger;
        private readonly IConfiguration _phonePe;

        public CreatePhonePePaymentController(ILogger<CreatePhonePePaymentController> logger, MSSolutionsDbContext context, IConfiguration phonePe)
        {
            _logger = logger;
            _context = context;
            _phonePe = phonePe;

        }
        private string PhonePeeSha256(string rawData)
        {
            using var sha256 = SHA256.Create();
            var bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
            return BitConverter.ToString(bytes).Replace("-", "").ToLower();
        }
    

     
        [HttpPost]
        public async Task<IActionResult> CreateCreatePhonePePayment(
         [FromBody] CreatePaymentDto dto)
        {
            if (dto == null || dto.CartItems.Count == 0)
                return BadRequest("Cart is empty");

            var shippingAddress = await _context.MsAddresses
                .FirstOrDefaultAsync(x => x.Id == dto.ShippingAddressId);

            if (shippingAddress == null)
                return BadRequest("Invalid shipping address");
            var performerEmail = User?.Identity?.Name;
            var currentUser = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail);
            if (currentUser == null)
                return Unauthorized();

            var merchantId = _phonePe["PhonePe:MerchantId"];
            var saltKey = _phonePe["PhonePe:SaltKey"]; 
            var saltIndex = _phonePe["PhonePe:SaltIndex"];
            // ===============================
            // 1️ LOAD PRODUCTS
            // ===============================
            var productIds = dto.CartItems.Select(x => x.ProductId).ToList();

            var products = await _context.MsProducts
                .Where(p => productIds.Contains(p.Id))
                .ToDictionaryAsync(p => p.Id);

            decimal subtotal = 0;

            var itemCalculations = new List<dynamic>();

            // ===============================
            // 2️ CALCULATE SUBTOTAL (NO GST, NO COUPON)
            // ===============================
            foreach (var item in dto.CartItems)
            {
                if (!products.TryGetValue(item.ProductId, out var product))
                    return BadRequest($"Product not found: {item.ProductId}");

                decimal basePrice = product.BaseAmount;
                decimal discountPrice = product.DiscountPrice ?? 0;
                decimal price = Math.Max(basePrice - discountPrice, 0);

                decimal itemTotal = price * item.Quantity;
                subtotal += itemTotal;

                itemCalculations.Add(new
                {
                    Product = product,
                    Price = price,
                    Quantity = item.Quantity,
                    ItemTotal = itemTotal
                });
            }

            // ===============================
            // 3️ APPLY COUPON
            // ===============================
            decimal couponDiscount = 0;

            if (!string.IsNullOrEmpty(dto.CouponCode))
            {
                var coupon = await _context.MsCoupons
                    .FirstOrDefaultAsync(x =>
                        x.CouponCode == dto.CouponCode &&
                        x.IsDisable && !x.IsExpired);

                if (coupon != null)
                    couponDiscount = coupon.CouponAmount;
            }

            // ===============================
            // 4️ ITEM-WISE GST (AFTER COUPON)
            // ===============================
            decimal totalGst = 0;
            decimal grandTotal = 0;

            foreach (var item in itemCalculations)
            {
                decimal couponShare =
                    subtotal > 0
                        ? (item.ItemTotal / subtotal) * couponDiscount
                        : 0;

                decimal discountedUnitPrice =
                    item.Price - (couponShare / item.Quantity);

                decimal gstPercent = item.Product.GstPercentage;
                decimal gstAmount =
                    discountedUnitPrice * gstPercent / 100;

                decimal finalUnitPrice =
                    discountedUnitPrice + gstAmount;

                totalGst += gstAmount * item.Quantity;
                grandTotal += finalUnitPrice * item.Quantity;
            }
            grandTotal = Math.Round(grandTotal, 2, MidpointRounding.AwayFromZero);
            if (grandTotal < 0)
            return BadRequest("Invalid payment amount");
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                // ===============================
                // 5️ CREATE ORDER
                // ===============================
                var order = new MsOrders
                {
                    OrderCode = await GenerateOrderNumber(),
                    UserId = currentUser.Id,
                    SubTotal = subtotal,
                    TaxAmount = totalGst,
                    DiscountAmount = couponDiscount,
                    GrandTotal = grandTotal,
                    ReceiveAmount = 0,
                    PaymentStatus = "Pending",
                    OrderStatus = "Pending",
                    CouponCode = dto.CouponCode,
                    CouponAmount = couponDiscount,
                    OrderDate = DateTime.UtcNow,
                    CreatedAt = DateTime.UtcNow,
                    ShippingAddressId = dto.ShippingAddressId,
                    BillingAddressId = dto.ShippingAddressId,
                };

                _context.MsOrders.Add(order);
                await _context.SaveChangesAsync();

                //=====================================
                //6 create order detail
                //=================================
                var orderDetails = new List<MsOrderDetails>();
                var categoryIds = itemCalculations
    .Select(i => i.Product.CategoryId)
    .Distinct()
    .ToList();

                var brandIds = itemCalculations
                    .Select(i => i.Product.BrandId)
                    .Distinct()
                    .ToList();

                var categories = await _context.MsCategories
                    .Where(c => categoryIds.Contains(c.Id))
                    .ToDictionaryAsync(c => c.Id, c => c.CatName);

                var brands = await _context.MsBrands
                    .Where(b => brandIds.Contains(b.Id))
                    .ToDictionaryAsync(b => b.Id, b => b.BrandName);
                foreach (var item in itemCalculations)
                {
                    var product = item.Product;

                    orderDetails.Add(new MsOrderDetails
                    {
                        OrderId = order.Id,
                        ProductId = product.Id,
                        Quantity = item.Quantity,
                        UnitPrice = item.Price,
                        Discount = product.DiscountPrice ?? 0,
                        TotalAmount = item.Price * item.Quantity,
                        CategoryId = product.CategoryId,
                        CategoryName = categories.ContainsKey(product.CategoryId)
            ? categories[product.CategoryId]
            : null,
                        BrandId = product.BrandId,
                        BrandName = brands.ContainsKey(product.BrandId)
            ? brands[product.BrandId]
            : null,
                        ProductName = product.ProductName
                    });
                }

                _context.MsOrderDetails.AddRange(orderDetails);
                await _context.SaveChangesAsync();
                //=====================================
                //7 create shipping detail
                //=================================
                var shipping = new MsOrderShippingAddress
                {
                    OrderId = order.Id,
                    FullName = shippingAddress.FullName,
                    Phone = shippingAddress.Phone,
                    AddressLine = shippingAddress.AddressLine,
                    City = shippingAddress.City,
                    State = shippingAddress.State,
                    Pincode = shippingAddress.Pincode.ToString(),
                    Country = "India"
                };

                _context.MsOrderShippingAddress.Add(shipping);
                await _context.SaveChangesAsync();
                //=====================================
                //7 create billing detail
                //=================================
                var billing = new MsOrderBillingAddress
                {
                    OrderId = order.Id,
                    FullName = shippingAddress.FullName,
                    Phone = shippingAddress.Phone,
                    AddressLine = shippingAddress.AddressLine,
                    City = shippingAddress.City,
                    State = shippingAddress.State,
                    Pincode = shippingAddress.Pincode.ToString()
                };

                _context.MsOrderBillingAddress.Add(billing);
                await _context.SaveChangesAsync();
                //payment gateway
                int amountInPaise = (int)(grandTotal * 100);
                string merchantTxnId = $"TXN_{order.Id}_{DateTime.UtcNow.Ticks}";
                order.MerchantTransactionId = merchantTxnId;
                await _context.SaveChangesAsync();

                var payload = new
                {
                    merchantId,
                    merchantTransactionId = merchantTxnId,
                    merchantUserId = currentUser.Id,
                    amount = amountInPaise,
                    redirectUrl = $"{_phonePe["PhonePe:FrontendUrl"]}/payment-success",
                    redirectMode = "POST",
                    callbackUrl = $"{_phonePe["PhonePe:ApiUrl"]}/api/payment/phonepe-callback",
                    paymentInstrument = new { type = "PAY_PAGE" }
                };

                var json = JsonConvert.SerializeObject(payload);
                var base64Payload = Convert.ToBase64String(Encoding.UTF8.GetBytes(json));
                var checksum = PhonePeeSha256(base64Payload + "/pg/v1/pay" + saltKey) + "###" + saltIndex;

                // ===============================
                // 6️ RESPONSE
                // ===============================
                await transaction.CommitAsync();
                return Ok(new
                {
                    request = base64Payload,
                    checksum,
                    merchantId,
                    apiUrl = $"{_phonePe["PhonePe:GatewayUrl"]}/pg/v1/pay"
                });
            }
            catch (Exception ex)
            {
                // Rollback if anything fails
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("phonepe-callback")]
        public async Task<IActionResult> PhonePeCallback()
        {
            // 1️⃣ Read raw body
            using var reader = new StreamReader(Request.Body);
            var rawBody = await reader.ReadToEndAsync();

            // 2️⃣ Get X-VERIFY header
            if (!Request.Headers.TryGetValue("X-VERIFY", out var receivedChecksum))
                return BadRequest("Missing checksum");

            // 3️⃣ Generate checksum
            var saltKey = _phonePe["PhonePe:SaltKey"];
            var saltIndex = _phonePe["PhonePe:SaltIndex"];

            var calculatedChecksum =
                PhonePeeSha256(rawBody + saltKey) + "###" + saltIndex;

            if (receivedChecksum != calculatedChecksum)
                return Unauthorized("Invalid checksum");

            // 4️⃣ Parse JSON safely
            var json = JObject.Parse(rawBody);
            var responseBase64 = json["response"]?.ToString();

            if (string.IsNullOrEmpty(responseBase64))
                return BadRequest("Invalid payload");

            var decodedJson =
                Encoding.UTF8.GetString(Convert.FromBase64String(responseBase64));

            var paymentData = JObject.Parse(decodedJson);

            string txnId = paymentData["data"]?["merchantTransactionId"]?.ToString();
            string status = paymentData["code"]?.ToString();

            if (string.IsNullOrEmpty(txnId))
                return Ok();

            // 5️⃣ Fetch order
            var order = await _context.MsOrders
                .FirstOrDefaultAsync(x => x.MerchantTransactionId == txnId);

            if (order == null)
                return Ok();

            // 6️⃣ Update order status
            if (status == "PAYMENT_SUCCESS")
            {
                order.PaymentStatus = "Success";
                order.OrderStatus = "Confirmed";
                order.PaymentDate = DateTime.UtcNow;
                order.ReceiveAmount = order.GrandTotal;
            }
            else
            {
                order.PaymentStatus = "Failed";
                order.OrderStatus = "Payment Failed";
            }

            await _context.SaveChangesAsync();

            return Ok();
        }

        private async Task<string> GenerateOrderNumber()
        {
            var today = DateTime.UtcNow.Date;
            string datePart = today.ToString("yyyyMMdd");

            // Get last order for today
            var lastOrderToday = await _context.MsOrders
                .Where(o => o.CreatedAt.Date == today)
                .OrderByDescending(o => o.Id)
                .Select(o => o.OrderCode)
                .FirstOrDefaultAsync();

            int nextSequence = 1;

            if (!string.IsNullOrEmpty(lastOrderToday))
            {
                // ORD-20251228-000123
                var parts = lastOrderToday.Split('-');
                if (parts.Length == 3 && int.TryParse(parts[2], out int lastSeq))
                {
                    nextSequence = lastSeq + 1;
                }
            }

            return $"ORD-{datePart}-{nextSequence:D6}";
        }


    }
}