using KabElectroSolutions.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AuditLogsController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;

        public AuditLogsController(KabElectroSolutionsDbContext context)
        {
            _context = context;
        }

        [HttpGet("{entityName}/{entityRecordId}")]
        public async Task<IActionResult> GetAuditLogs(
            string entityName, int entityRecordId)
        {
            var logs = await _context.AuditLogs
                .Where(x => x.EntityName == entityName && x.EntityRecordId == entityRecordId)
                .OrderBy(x => x.Timestamp)
                .ToListAsync();

            return Ok(logs);
        }
    }
}
