using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Helper;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportsController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<ReportsController> _logger;

        public ReportsController(ILogger<ReportsController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("Reports")]
        public async Task<IActionResult> GetReports()
        {
            var data = await _context.Reports
            .Select(r => new ReportsDTO
            {
                Id = r.Id,
                FileName = r.FileName,
                TimeStamp = r.TimeStamp,
                DateRange = r.DateRange,
                Status = r.Status
            })
            .ToListAsync();
            var result = new ReportsResponseDTO
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

        //[HttpPost]
        //public async Task<IActionResult> CreateReports([FromBody] ReportsFilter report)
        //{
        //    if (report == null)
        //        return BadRequest("Invalid report data");

        //    var start = DateOnly.FromDateTime(report.StartDate);
        //    var end = DateOnly.FromDateTime(report.EndDate);

        //    var reportData = new Reports
        //    {
        //        CreatedDate = DateOnly.FromDateTime(DateTime.UtcNow),
        //        StartDate = start,
        //        EndDate = end,
        //        Status = "Uploaded",
        //        DateRange = $"{report.StartDate:yyyy-MM-dd} - {report.EndDate:yyyy-MM-dd}",
        //        FileName = $"crm_report_{report.StartDate:yyyy-MM-dd}_{report.EndDate:yyyy-MM-dd}.csv",
        //        TimeStamp = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss")
        //    };
        //    var claims = await _context.Claims
        //          .Where(c => c.CreatedDate >= start && c.CreatedDate <= end)
        //          .ToListAsync();
        //    object response;
        //    if (report.ReportName == "generateLink")
        //    {
        //        _context.Reports.Add(reportData);
        //        await _context.SaveChangesAsync();
        //        response = new
        //        {
        //            Status = 201,
        //            Message = "Report created successfully",

        //            Report = new ReportsDTO
        //            {
        //                Id = reportData.Id,
        //                FileName = reportData.FileName,
        //                TimeStamp = reportData.TimeStamp,
        //                DateRange = reportData.DateRange,
        //                Status = reportData.Status
        //            },

        //            Claims = new
        //            {
        //                Count = claims.Count,
        //                Results = claims
        //            }
        //        };
        //    }
        //    else {
        //         response = new
        //        {
        //            Status = 201,
        //            Message = "Report download successfully",

        //            Report = new ReportsDTO
        //            {
        //                Id = 0,
        //                FileName = "",
        //                TimeStamp = "",
        //                DateRange = "",
        //                Status = ""
        //            },

        //            Claims = new
        //            {
        //                Count = claims.Count,
        //                Results = claims
        //            }
        //        };
        //    }
        //        return Ok(response);
        //}
        [HttpPost]
        public async Task<IActionResult> CreateReports([FromBody] ReportsFilter report)
        {
            if (report == null)
                return BadRequest("Invalid report data");

            var start = DateOnly.FromDateTime(report.StartDate);
            var end = DateOnly.FromDateTime(report.EndDate);

            var fileName = $"crm_report_{report.StartDate:yyyy-MM-dd}_{report.EndDate:yyyy-MM-dd}.csv";

            var claims = await _context.Claims
                  .Where(c => c.CreatedDate >= start && c.CreatedDate <= end)
                  .ToListAsync();

            // 🔥 CREATE /wwwroot/Reports FOLDER IF NOT EXISTS
            string folderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Reports");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            // 🔥 SAVE CSV FILE
            string filePath = Path.Combine(folderPath, fileName);
            using (var writer = new StreamWriter(filePath))
            {
                var props = typeof(Claim).GetProperties();

                // Write header
                writer.WriteLine(string.Join(",", props.Select(p => p.Name)));

                // Write rows
                foreach (var c in claims)
                {
                    var values = props.Select(p => p.GetValue(c)?.ToString()?.Replace(",", " "));
                    writer.WriteLine(string.Join(",", values));
                }
            }

            // 🔥 URL RETURNED TO ANGULAR
            string fileUrl = $"/Reports/{fileName}";

            object response;

            if (report.ReportName == "generateLink")
            {
                var reportData = new Reports
                {
                    CreatedDate = DateOnly.FromDateTime(DateTime.UtcNow),
                    StartDate = start,
                    EndDate = end,
                    Status = "Uploaded",
                    DateRange = $"{report.StartDate:yyyy-MM-dd} - {report.EndDate:yyyy-MM-dd}",
                    FileName = fileName,
                    TimeStamp = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss")
                };

                _context.Reports.Add(reportData);
                await _context.SaveChangesAsync();

                response = new
                {
                    status = 201,
                    message = "Report created",
                    fileUrl = fileUrl,    // 🔥 IMPORTANT
                    report = new
                    {
                        reportData.Id,
                        reportData.FileName,
                        reportData.TimeStamp,
                        reportData.DateRange,
                        reportData.Status,
                        link = fileUrl      // 🔥 IMPORTANT
                    },
                    claims = new { Count = claims.Count, Results = claims }
                };
            }
            else
            {
                // download only → do not save in DB
                response = new
                {
                    status = 200,
                    message = "Report downloaded",
                    fileUrl = fileUrl, 
                    claims = new { Count = claims.Count, Results = claims }
                };
            }

            return Ok(response);
        }
    }
}