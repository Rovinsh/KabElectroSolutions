using KabElectroSolutions.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StatusController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<StatusController> _logger;

        public StatusController(ILogger<StatusController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("status")]
        public async Task<IActionResult> GetStatuses()
        {
            var statuses = await _context.Statuses
                .Include(cs => cs.Substatus)
                .ToListAsync();

            var response = new
            {
                message = "List of call status",
                data = statuses.ToDictionary(
                    s => s.Id.ToString(),
                    s => new
                    {
                        name = s.Name,
                        active = s.Active ? 1 : 0,
                        substatus = s.Substatus.Select(ss => new
                        {
                            substatusid = ss.SubStatusId,
                            name = ss.Name,
                            active = ss.Active ? 1 : 0
                        }).ToList()
                    }),
                status = 200
            };

            return Ok(response);
        }
    }
}