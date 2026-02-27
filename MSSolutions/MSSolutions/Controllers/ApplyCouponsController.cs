using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace MSSolutions.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class ApplyCouponsController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<ApplyCouponsController> _logger;

        public ApplyCouponsController(ILogger<ApplyCouponsController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }
		
		[HttpPost("apply")]
		public IActionResult ApplyCoupon([FromBody] ApplyCoupon request)
		{
			var coupon = _context.MsCoupons.FirstOrDefault(x =>
				x.CouponCode == request.CouponCode &&
				x.IsDisable == true);

			if (coupon == null)
				return BadRequest("Invalid coupon");

			var now = DateTime.UtcNow;

			if (now < coupon.CouponStartDate || now > coupon.CouponEndDate)
				return BadRequest("Coupon expired");
			
			//var performerEmail = User?.Identity?.Name;
			//var currentUser = _context.MsUsers.FirstOrDefault(u => u.Email == performerEmail);
			//int userId = currentUser.Id;

			//if (coupon.IsFirstOrder)
			//{
			//	bool hasPreviousOrder = _context.MsOrders
			//		.Any(o => o.UserId == userId && o.OrderStatus == "Completed");

			//	if (hasPreviousOrder)
			//		return BadRequest("Coupon valid for first order only");
			//}

			/* ================= ALL PRODUCTS CHECK ================= */

			//if (!coupon.IsAllProducts)
			//{
			//	// Coupon does NOT apply to all products
			//	// Since no mapping exists, block it
			//	return BadRequest("Coupon not applicable for selected products");
			//}

			/* ================= DISCOUNT CALCULATION ================= */

			decimal discount;

			if (coupon.DiscountType.ToLower() == "percentage")
			{
				discount = request.CartTotal * coupon.CouponAmount / 100;
			}
			else
			{
				discount = coupon.CouponAmount;
			}

			if (discount > request.CartTotal)
				discount = request.CartTotal;

			var response = new CouponResponses
            {
				CouponId = coupon.Id,
				CouponCode = coupon.CouponCode,
				DiscountAmount = discount,
				FinalAmount = request.CartTotal - discount,
				DiscountType = coupon.DiscountType
			};
            var result = new CouponResponsesDataDTO
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = response
            };

            return Ok(result);
		}

		}
      }
