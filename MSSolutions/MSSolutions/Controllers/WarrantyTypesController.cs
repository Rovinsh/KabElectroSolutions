using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MSSolutions.Data;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class WarrantyTypesController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<WarrantyTypesController> _logger;

        public WarrantyTypesController(ILogger<WarrantyTypesController> logger, MSSolutionsDbContext context)
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
