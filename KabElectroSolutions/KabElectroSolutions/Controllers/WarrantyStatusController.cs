using KabElectroSolutions.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WarrantyStatusController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<WarrantyStatusController> _logger;

        public WarrantyStatusController(ILogger<WarrantyStatusController> logger, KabElectroSolutionsDbContext context)
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