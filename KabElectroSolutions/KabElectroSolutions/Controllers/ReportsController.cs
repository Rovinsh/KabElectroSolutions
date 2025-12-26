using ClosedXML.Excel;
using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Helper;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ReportsController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<ReportsController> _logger;

        public ReportsController(ILogger<ReportsController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        // GET: All stored reports
       
        [HttpGet("Reports")]
        public async Task<IActionResult> GetReports()
        { var performerEmail = User?.Identity?.Name;
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
            var data = await _context.Reports.Where(r=>r.CreatedById == user.Id)
                .Select(r => new ReportsDTO
                {
                    Id = r.Id,
                    FileName = r.FileName,
                    TimeStamp = r.TimeStamp,
                    DateRange = r.DateRange,
                    Status = r.Status
                })
                .ToListAsync();

            return Ok(new
            {
                Status = 200,
                Message = "success",
                Data = data
            });
        }

        [HttpPost]
        public async Task<IActionResult> CreateReports([FromBody] ReportsFilter report)
        {
            if (report == null)
                return BadRequest("Invalid report data");
            var performerEmail = User?.Identity?.Name;
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
            var start = DateOnly.FromDateTime(report.StartDate);
            var end = DateOnly.FromDateTime(report.EndDate);

            string fileName = $"crm_report_{report.StartDate:yyyy-MM-dd}_{report.EndDate:yyyy-MM-dd}.xlsx";

            var claims = await _context.Claims
                .Where(c => c.CreatedDate >= start && c.CreatedDate <= end)
                .ToListAsync();

            //string folderPath = Path.Combine(Directory.GetCurrentDirectory(), "Reports");
            //if (!Directory.Exists(folderPath))
            //    Directory.CreateDirectory(folderPath);

            //string filePath = Path.Combine(folderPath, fileName);

            //using (var workbook = new XLWorkbook())
            //{
            //    var ws = workbook.Worksheets.Add("Report");

            //    var props = typeof(Claim).GetProperties();

            //    for (int i = 0; i < props.Length; i++)
            //        ws.Cell(1, i + 1).Value = props[i].Name;

            //    for (int row = 0; row < claims.Count; row++)
            //    {
            //        for (int col = 0; col < props.Length; col++)
            //        {
            //            var value = props[col].GetValue(claims[row]);
            //            ws.Cell(row + 2, col + 1).Value = value?.ToString() ?? "";
            //        }
            //    }
            //    workbook.SaveAs(filePath);
            //}
            string fileUrl = $"/Reports/{fileName}";
            if (report.ReportName == "generateLink")
            {
                var reportData = new Reports
                {
                    CreatedDate = DateOnly.FromDateTime(DateTime.UtcNow),
                    StartDate = start,
                    CreatedById = user.Id,
                    CreatedByName = user.Businessname,
                    EndDate = end,
                    Status = "Uploaded",
                    DateRange = $"{report.StartDate:yyyy-MM-dd} - {report.EndDate:yyyy-MM-dd}",
                    FileName = fileName,
                    TimeStamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                };

                _context.Reports.Add(reportData);
                await _context.SaveChangesAsync();

                return Ok(new
                {
                    status = 201,
                    message = "Report link generated",
                    fileUrl,
                    report = reportData,
                    claims = new { Count = claims.Count },
                });
            }
            return Ok(new
            {
                status = 200,
                message = "Report downloaded",
                fileUrl,
                claims = new { Count = claims.Count, claimsData= claims }
            });
        }

        [HttpGet("GetReportOnLinkClick/{dateRange}")]
        public async Task<IActionResult> GetReportOnLinkClick(string dateRange)
        {
            if (dateRange == null)
                return BadRequest("Invalid report data");
            var performerEmail = User?.Identity?.Name;
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
            var parts = dateRange.Split(" - ", StringSplitOptions.TrimEntries);
            var claims = new List<Claim>();
            if (parts.Length == 2 &&
                DateOnly.TryParse(parts[0], out var fromDate) &&
                DateOnly.TryParse(parts[1], out var toDate))
            {

              claims = await _context.Claims
                    .Where(c => c.CreatedDate >= fromDate && c.CreatedDate <= toDate)
                    .ToListAsync();
            }
                return Ok(new
                {
                    status = 200,
                    message = "Report downloaded",
                    claims = new { Count = claims.Count, claimsData = claims }

                });            
        }
    }
}
