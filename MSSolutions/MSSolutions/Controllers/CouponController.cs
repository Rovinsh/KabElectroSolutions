using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MSSolutions.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class CouponController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<CouponController> _logger;

        public CouponController(ILogger<CouponController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("coupons")]
        public async Task<IActionResult> GetCoupons()
        {
            var data = await _context.MsCoupons
                .Select(c => new CouponDto
                {
                    Id = c.Id,
                    CouponTitle = c.CouponTitle,
                    CouponCode = c.CouponCode,
                    DiscountType = c.DiscountType,
                    CouponAmount = c.CouponAmount,
                    CouponStartDate = c.CouponStartDate,
                    CouponEndDate = c.CouponEndDate,
                    Description = c.Description,
                    Remark = c.Remark,
                    IsExpired = c.IsExpired,
                    IsFirstOrder = c.IsFirstOrder,
                    IsAllProducts = c.IsAllProducts,
                    IsDisable = c.IsDisable
                })
                .ToListAsync();

            return Ok(new CouponResponse
            {
                Status = 200,
                Message = "Success",
                Data = data
            });
        }

        [HttpPost]
        public async Task<IActionResult> CreateCoupons([FromBody] MsCoupons coupon)
        {
            if (coupon == null)
                return BadRequest("Invalid coupon data");

            bool exists = await _context.MsCoupons.AnyAsync(c => c.CouponCode == coupon.CouponCode);

            if (exists)
                return Conflict("Coupon with this code already exists.");

            _context.MsCoupons.Add(coupon);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetCoupons), new { id = coupon.Id }, coupon);
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateCoupon(int id, [FromBody] MsCoupons updatedCoupon)
        {
            if (updatedCoupon == null)
                return BadRequest("Invalid coupon data");

            var existing = await _context.MsCoupons.FindAsync(id);
            if (existing == null)
                return NotFound("Coupon not found");

            bool duplicate = await _context.MsCoupons.AnyAsync(c => c.Id != id && c.CouponCode == updatedCoupon.CouponCode);
            if (duplicate)
                return Conflict("Another coupon with the same code already exists.");

            existing.CouponTitle = updatedCoupon.CouponTitle;
            existing.CouponCode = updatedCoupon.CouponCode;
            existing.DiscountType = updatedCoupon.DiscountType;
            existing.CouponAmount = updatedCoupon.CouponAmount;
            existing.CouponStartDate = updatedCoupon.CouponStartDate;
            existing.CouponEndDate = updatedCoupon.CouponEndDate;
            existing.Description = updatedCoupon.Description;
            existing.Remark = updatedCoupon.Remark;
            existing.IsExpired = updatedCoupon.IsExpired;
            existing.IsFirstOrder = updatedCoupon.IsFirstOrder;
            existing.IsAllProducts = updatedCoupon.IsAllProducts;
            existing.IsDisable = updatedCoupon.IsDisable;

            _context.MsCoupons.Update(existing);
            await _context.SaveChangesAsync();

            return Ok(existing);
        }
   
    }
}
