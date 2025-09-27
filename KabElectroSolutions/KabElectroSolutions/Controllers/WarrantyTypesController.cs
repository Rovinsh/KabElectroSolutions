using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WarrantyTypesController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<WarrantyTypesController> _logger;

        public WarrantyTypesController(ILogger<WarrantyTypesController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }
        [HttpGet("warrantytypes")]
        public async Task<IActionResult> GetKitStatuses()
        {
            var warrantyTypes = await _context.WarrantyTypes.Select(l => new WarrantyType
            {
                Id = l.Id,
                Name = l.Name
            }).ToListAsync();

            //var data = warrantyTypes.ToDictionary(
            //    wt => wt.Id.ToString(),
            //    wt => new { name = wt.Name }
            //);

            return Ok(new
            {
                status = 200,
                message = "Kit Statuses",
                data = warrantyTypes
            });
        }
    }
}
