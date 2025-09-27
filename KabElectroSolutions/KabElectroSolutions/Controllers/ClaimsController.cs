using KabElectroSolutions.Data;
using Microsoft.AspNetCore.Mvc;
using KabElectroSolutions.DTOs;
using Microsoft.EntityFrameworkCore;
using KabElectroSolutions.Models;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClaimsController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<ClaimsController> _logger;
        public ClaimsController(ILogger<ClaimsController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }


        [HttpGet("claims")]
        public async Task<IActionResult> GetClaims([FromQuery] int? statusId)
        {
            List<Claim> claims;
            if (statusId != null && statusId > 0)
                claims = await _context.Claims.Where(claim => claim.Status == statusId).ToListAsync();
            else
                claims = await _context.Claims.ToListAsync();

            var response = new ClaimsResponseDto
            {
                Status = 200,
                Message = "List of calls",
                Data = new ClaimsDataDto
                {
                    Count = claims.Count,
                    Results = claims
                }
            };

            return Ok(response);
        }

        [HttpGet("claim")]
        public async Task<IActionResult> GetClaim([FromQuery] int? claimId)
        {
            if (claimId == null)
            {
                return BadRequest(new
                {
                    Status = 400,
                    Message = "Missing query parameter: claimId"
                });
            }

            var claims = await _context.Claims.Where(c => c.Id == claimId).ToListAsync();
            if (claims == null || claims.Count == 0)
            {
                return NotFound(new
                {
                    Status = 404,
                    Message = $"Claim with ID {claimId} not found"
                });
            }

            var response = new ClaimsResponseDto
            {
                Status = 200,
                Message = "List of calls",
                Data = new ClaimsDataDto
                {
                    Count = claims.Count,
                    Results = claims
                }
            };

            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> CreateClaim([FromBody] Claim claim)
        {
            if (claim == null)
                return BadRequest("Invalid claim data");

            _context.Claims.Add(claim);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetClaim), new { id = claim.Id }, claim);
        }
    }
}
