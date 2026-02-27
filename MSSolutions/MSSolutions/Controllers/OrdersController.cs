using DocumentFormat.OpenXml.Drawing.Charts;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using System;

namespace KabEleMSSolutionsctroSolutions.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<OrdersController> _logger;

        public OrdersController(ILogger<OrdersController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("Orders")]
        public async Task<IActionResult> GetOrders()
        {
            var data = await _context.MsOrders
                .Include(o => o.OrderDetails)
                .Include(o => o.BillingAddress)
                 .Include(o => o.ShippingAddress)
                .Select(o => new OrderDTO
                {
                    Id = o.Id,
                    OrderCode = o.OrderCode,
                    UserName = _context.MsUsers.Where(c => c.Id == o.UserId).Select(c => c.Firstname).FirstOrDefault(),
                    UserId = o.UserId,
                    SubTotal = o.SubTotal,
                    TaxAmount = o.TaxAmount,
                    DiscountAmount = o.DiscountAmount,
                    GrandTotal = o.GrandTotal,
                    CouponAmount = o.CouponAmount,
                    ReceiveAmount = o.ReceiveAmount,
                    PaymentStatus = o.PaymentStatus,
                    OrderStatus = o.OrderStatus,
                    CouponCode = o.CouponCode,
                    OrderDate = o.OrderDate,
                    PaymentDate = o.PaymentDate,
                    RazorpayOrderId = o.RazorpayOrderId,
                    RazorpayPaymentId = o.RazorpayPaymentId,
                    RazorpaySignature =o.RazorpaySignature,
                    OrderDetails = o.OrderDetails.Select(d => new OrderDetailDTO
                    {
                        Id = d.Id,
                        ProductId = d.ProductId,
                        ProductName = d.ProductName,
                        BrandName=d.BrandName,
                        CategoryName = d.CategoryName,
                        UnitPrice = d.UnitPrice,
                        Quantity = d.Quantity,
                        Discount = d.Discount,
                        TotalAmount = d.TotalAmount
                    }).ToList(),

                    BillingAddress = o.BillingAddress == null ? null : new BillingAddressDTO
                    {
                        FullName = o.BillingAddress.FullName,
                        Phone = o.BillingAddress.Phone,
                        AddressLine = o.BillingAddress.AddressLine,
                        City = o.BillingAddress.City,
                        State = o.BillingAddress.State,
                        Pincode = o.BillingAddress.Pincode
                    },

                    ShippingAddress = o.ShippingAddress == null ? null : new ShippingAddressDTO
                    {
                        FullName = o.ShippingAddress.FullName,
                        Phone = o.ShippingAddress.Phone,
                        AddressLine = o.ShippingAddress.AddressLine,
                        City = o.ShippingAddress.City,
                        State = o.ShippingAddress.State,
                        Pincode = o.ShippingAddress.Pincode,
                        Country = o.ShippingAddress.Country
                    }
                })
                .ToListAsync();

            var result = new OrderResponseDTO
            {
                Status = 200,
                Message = "success, Orders",
                Data = data
            };

            return Ok(result);
        }

        
        [HttpGet("userOrders")]
        public async Task<IActionResult> GetuserOrders()
        {
            var performerEmail = User?.Identity?.Name;

            if (string.IsNullOrEmpty(performerEmail))
            {
                return Unauthorized(new { message = "User not authenticated" });
            }

            var currentUser = await _context.MsUsers
                .FirstOrDefaultAsync(u => u.Email == performerEmail);

            if (currentUser == null)
            {
                return NotFound(new { message = "User does not exist" });
            }
            var data = await _context.MsOrders
                .Where(o => o.UserId == currentUser.Id)
                .Include(o => o.OrderDetails)
                .Include(o => o.BillingAddress)
                 .Include(o => o.ShippingAddress)
                .Select(o => new OrderDTO
                {
                    Id = o.Id,
                    OrderCode = o.OrderCode,
                    UserName = _context.MsUsers.Where(c => c.Id == o.UserId).Select(c => c.Firstname).FirstOrDefault(),
                    UserId = o.UserId,
                    SubTotal = o.SubTotal,
                    TaxAmount = o.TaxAmount,
                    DiscountAmount = o.DiscountAmount,
                    GrandTotal = o.GrandTotal,
                    CouponAmount = o.CouponAmount,
                    ReceiveAmount = o.ReceiveAmount,
                    PaymentStatus = o.PaymentStatus,
                    OrderStatus = o.OrderStatus,
                    CouponCode = o.CouponCode,
                    OrderDate = o.OrderDate,
                    PaymentDate = o.PaymentDate,
                    RazorpayOrderId = o.RazorpayOrderId,
                    RazorpayPaymentId = o.RazorpayPaymentId,
                    RazorpaySignature = o.RazorpaySignature,
                    OrderDetails = o.OrderDetails.Select(d => new OrderDetailDTO
                    {
                        Id = d.Id,
                        ProductId = d.ProductId,
                        ProductName = d.ProductName,
                        BrandName = d.BrandName,
                        CategoryName = d.CategoryName,
                        UnitPrice = d.UnitPrice,
                        Quantity = d.Quantity,
                        Discount = d.Discount,
                        TotalAmount = d.TotalAmount
                    }).ToList(),

                    BillingAddress = o.BillingAddress == null ? null : new BillingAddressDTO
                    {
                        FullName = o.BillingAddress.FullName,
                        Phone = o.BillingAddress.Phone,
                        AddressLine = o.BillingAddress.AddressLine,
                        City = o.BillingAddress.City,
                        State = o.BillingAddress.State,
                        Pincode = o.BillingAddress.Pincode
                    },

                    ShippingAddress = o.ShippingAddress == null ? null : new ShippingAddressDTO
                    {
                        FullName = o.ShippingAddress.FullName,
                        Phone = o.ShippingAddress.Phone,
                        AddressLine = o.ShippingAddress.AddressLine,
                        City = o.ShippingAddress.City,
                        State = o.ShippingAddress.State,
                        Pincode = o.ShippingAddress.Pincode,
                        Country = o.ShippingAddress.Country
                    }
                })
                .ToListAsync();

            var result = new OrderResponseDTO
            {
                Status = 200,
                Message = "success, Orders",
                Data = data
            };

            return Ok(result);
        }
        // ---------------- CREATE ORDER ----------------
       
        [HttpPost]
        public async Task<IActionResult> CreateOrder([FromBody] MsOrders order)
        {
            if (order == null)
                return BadRequest("Invalid order data");

            try
            {
                _context.MsOrders.Add(order);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetOrders),
                    new { id = order.Id }, order);
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(500, "An error occurred while saving the order.");
            }
        }


        [HttpGet("topSellingProducts")]
        public async Task<IActionResult> GetTopSellingProducts()
        {
            var data = await _context.MsOrderDetails
                .GroupBy(d => new
                {
                    d.ProductId,
                    d.ProductName,
                    d.BrandName,
                    d.CategoryName
                })
                .Select(g => new TopSellingProductDTO
                {
                    ProductId = g.Key.ProductId,
                    ProductName = g.Key.ProductName,
                    BrandName = g.Key.BrandName,
                    CategoryName = g.Key.CategoryName,

                    // ✅ number of orders per product
                    OrderCount = g
                        .Select(x => x.OrderId)
                        .Distinct()
                        .Count(),

                    // ✅ total quantity sold
                    TotalQuantity = g.Sum(x => x.Quantity),

                    // ✅ total revenue
                    TotalAmount = g.Sum(x => x.TotalAmount)
                })
                .OrderByDescending(x => x.OrderCount) // 🔥 top selling first
                .Take(10) // optional: top 10 products
                .ToListAsync();

            return Ok(new
            {
                Status = 200,
                Message = "Top selling products",
                Data = data
            });
        }
    }
}