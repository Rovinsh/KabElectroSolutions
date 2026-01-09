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
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class WishlistController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<WishlistController> _logger;

        public WishlistController(ILogger<WishlistController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("wishlist")]
        public async Task<IActionResult> GetWishlist()
        {
            var performerEmail = User?.Identity?.Name;
            var user = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail && !u.IsPartner);

            var data = await _context.MsWishlists
                .Where(n => n.UserId == user.Id)
         .Select(b => new AddWishlistRequest
         {
             ProductId = b.ProductId,
         })
         .ToListAsync();

            var result = new WishlistListsResponseDto
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

        [HttpPost("AddWishlist")]
        public async Task<IActionResult> AddWishlist([FromBody] AddWishlistRequest dto)
        {
            if (dto.ProductId <= 0)
                return BadRequest("Invalid product.");

            var performerEmail = User?.Identity?.Name;
            var user = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail && !u.IsPartner);

            bool exists = await _context.MsWishlists
                .AnyAsync(x => x.UserId == user.Id && x.ProductId == dto.ProductId);

            if (exists)
                return Conflict("Already in wishlist.");

            var wishlist = new MsWishlist
            {
                UserId = user.Id,
                ProductId = dto.ProductId
            };

            _context.MsWishlists.Add(wishlist);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Added to wishlist" });
        }
           }
}