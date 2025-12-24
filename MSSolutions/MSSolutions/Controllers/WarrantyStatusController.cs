using MSSolutions.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class WarrantyStatusController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<WarrantyStatusController> _logger;

        public WarrantyStatusController(ILogger<WarrantyStatusController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("status")]

        public async Task<IActionResult> GetWarrantyStatuses()
        {
            var statuses = await _context.WarrantyStatuses.ToListAsync();

            var data = statuses.ToDictionary(
                s => s.Id.ToString(),
                s => s.Name
            );

            return Ok(new
            {
                status = 200,
                message = "List of warranty status",
                data = data
            });
        }
    }

}