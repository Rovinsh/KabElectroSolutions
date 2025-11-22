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

        [HttpPost]
        public async Task<IActionResult> CreateReports([FromBody] ReportsFilter report)
        {
            if (report == null)
                return BadRequest("Invalid report data");

            var start = DateOnly.FromDateTime(report.StartDate);
            var end = DateOnly.FromDateTime(report.EndDate);

            var reportData = new Reports
            {
                CreatedDate = DateOnly.FromDateTime(DateTime.UtcNow),
                StartDate = start,
                EndDate = end,
                Status = "Uploaded",
                DateRange = $"{report.StartDate:yyyy-MM-dd} - {report.EndDate:yyyy-MM-dd}",
                FileName = $"crm_report_{report.StartDate:yyyy-MM-dd}_{report.EndDate:yyyy-MM-dd}.csv",
                TimeStamp = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss")
            };
            var claims = await _context.Claims
                  .Where(c => c.CreatedDate >= start && c.CreatedDate <= end)
                  .ToListAsync();
            object response;
            if (report.ReportName == "generateLink")
            {
                _context.Reports.Add(reportData);
                await _context.SaveChangesAsync();
                response = new
                {
                    Status = 201,
                    Message = "Report created successfully",

                    Report = new ReportsDTO
                    {
                        Id = reportData.Id,
                        FileName = reportData.FileName,
                        TimeStamp = reportData.TimeStamp,
                        DateRange = reportData.DateRange,
                        Status = reportData.Status
                    },

                    Claims = new
                    {
                        Count = claims.Count,
                        Results = claims
                    }
                };
            }
            else {
                 response = new
                {
                    Status = 201,
                    Message = "Report download successfully",

                    Report = new ReportsDTO
                    {
                        Id = 0,
                        FileName = "",
                        TimeStamp = "",
                        DateRange = "",
                        Status = ""
                    },

                    Claims = new
                    {
                        Count = claims.Count,
                        Results = claims
                    }
                };
            }
                return Ok(response);
        }
    }
    }