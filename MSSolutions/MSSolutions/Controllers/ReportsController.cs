using ClosedXML.Excel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using System.Security.Claims;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ReportsController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<ReportsController> _logger;

        public ReportsController(ILogger<ReportsController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        // GET: All stored reports
       
        [HttpGet("Reports")]
        public async Task<IActionResult> GetReports()
        { var performerEmail = User?.Identity?.Name;
            var user = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail);
            var data = new List<ReportsDTO>();
            if(user.BusinessroleName == "Super Admin" || user.BusinessroleName == "Sub Admin Executive")
                {
                data = await _context.MsReports
                .Select(r => new ReportsDTO
                {
                    Id = r.Id,
                    FileName = r.FileName,
                    TimeStamp = r.TimeStamp,
                    DateRange = r.DateRange,
                    Status = r.Status
                })
                .ToListAsync();
            }
                return Ok(new
            {
                Status = 200,
                Message = "success",
                Data = data
            });
        }

        [HttpPost]
        public async Task<IActionResult> CreateReports([FromBody] MsReportsFilter report)
        {
            if (report == null)
                return BadRequest("Invalid report data");
            var performerEmail = User?.Identity?.Name;
            var user = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail);
            var start = DateOnly.FromDateTime(report.StartDate);
            var end = DateOnly.FromDateTime(report.EndDate);

            string fileName = $"crm_report_{report.StartDate:yyyy-MM-dd}_{report.EndDate:yyyy-MM-dd}.xlsx";
            var orders = new List<Models.MsOrders>();
            if (user.BusinessroleName == "Super Admin" || user.BusinessroleName == "Sub Admin Executive")
            {
                var from = start.ToDateTime(TimeOnly.MinValue); // 00:00:00
                var to = end.ToDateTime(TimeOnly.MaxValue);   // 23:59:59.999
                orders = await _context.MsOrders
                .Where(c => c.CreatedAt >= from && c.CreatedAt <= to)
                .ToListAsync();
            }
            string fileUrl = $"/Reports/{fileName}";
            if (report.ReportName == "generateLink")
            {
                var reportData = new MsReports
                {
                    CreatedDate = DateOnly.FromDateTime(DateTime.Now),
                    StartDate = start,
                    CreatedById = user.Id,
                    CreatedByName = user.Businessname,
                    EndDate = end,
                    Status = "Uploaded",
                    DateRange = $"{report.StartDate:yyyy-MM-dd} - {report.EndDate:yyyy-MM-dd}",
                    FileName = fileName,
                    TimeStamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                };

                _context.MsReports.Add(reportData);
                await _context.SaveChangesAsync();

                return Ok(new
                {
                    status = 201,
                    message = "Report link generated",
                    fileUrl,
                    report = reportData,
                    orders = new { Count = orders.Count },
                });
            }
            return Ok(new
            {
                status = 200,
                message = "Report downloaded",
                fileUrl,
                orders = new { Count = orders.Count, ordersData= orders }
            });
        }

        [HttpGet("GetReportOnLinkClick/{dateRange}")]
        public async Task<IActionResult> GetReportOnLinkClick(string dateRange)
        {
            if (dateRange == null)
                return BadRequest("Invalid report data");
            var performerEmail = User?.Identity?.Name;
            var user = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail);
            var parts = dateRange.Split(" - ", StringSplitOptions.TrimEntries);
            var orders = new List<Models.MsOrders>();
            if (parts.Length == 2 &&
                DateOnly.TryParse(parts[0], out var fromDate) &&
                DateOnly.TryParse(parts[1], out var toDate))
            {
                if (user.BusinessroleName == "Super Admin" || user.BusinessroleName == "Sub Admin Executive")
                {
                    var from = fromDate.ToDateTime(TimeOnly.MinValue); // 00:00:00
                    var to = toDate.ToDateTime(TimeOnly.MaxValue);   // 23:59:59.999
                    orders = await _context.MsOrders
                    .Where(c => c.CreatedAt >= from && c.CreatedAt <= to)
                    .ToListAsync();
                }
            }
                return Ok(new
                {
                    status = 200,
                    message = "Report downloaded",
                    orders = new { Count = orders.Count, ordersData = orders }

                });            
        }
    }
}
