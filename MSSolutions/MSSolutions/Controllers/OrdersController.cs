using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace KabEleMSSolutionsctroSolutions.Controllers
{
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
                    ShippingAmount = o.ShippingAmount,
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
    
}
}