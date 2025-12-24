using MSSolutions.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class StatusController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<StatusController> _logger;

        public StatusController(ILogger<StatusController> logger, MSSolutionsDbContext context)
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