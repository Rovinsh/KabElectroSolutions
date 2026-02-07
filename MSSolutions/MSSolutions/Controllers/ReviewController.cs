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
    public class ReviewController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<ReviewController> _logger;

        public ReviewController(ILogger<ReviewController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("review")]
        public async Task<IActionResult> GetReview()
        {
            var data = await _context.MsReview
         .Select(c => new ReviewDTO
         {
             Id = c.Id,
             Rating = c.Rating,
             UserName = _context.MsUsers.Where(U => U.Id == c.UserId).Select(U => U.Firstname).FirstOrDefault(),
             Comment= c.Comment,
             CurrentDate = c.CurrentDate,
         })
         .ToListAsync();

            var result = new ReviewResponseDTO
            {
                Status = 200,
                Message = "success, review",
                Data = data
            };
            return Ok(result);
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateReview([FromBody] MsReview review)
        {
            if (review == null)
                return BadRequest("Invalid review data");

            try
            {
                var performerEmail = User?.Identity?.Name;
                var user = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail && !u.IsPartner);

                review.UserId = user.Id;
                review.CurrentDate = DateOnly.FromDateTime(DateTime.Now);
                _context.MsReview.Add(review);
                await _context.SaveChangesAsync();
                return CreatedAtAction(nameof(GetReview),
                    new { id = review.Id }, review);
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(500, "An error occurred while saving the review.");
            }
        }
    }
}