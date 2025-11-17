using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
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
            DateRange= r.DateRange,
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
        
        //[HttpGet("Reports")]
        //public async Task<IActionResult> GetReports([FromQuery] string reportType, [FromQuery] DateTime? startDate, [FromQuery] DateTime? endDate)
        //{
        //    IQueryable<Reports> query = _context.Reports.AsQueryable();
        //    if (!string.IsNullOrEmpty(reportType))
        //        query = query.Where(r => r.ReportType == reportType);

        //    if (startDate.HasValue)
        //        query = query.Where(r => r.CreatedDate >= DateOnly.FromDateTime(startDate.Value));

        //    if (endDate.HasValue)
        //        query = query.Where(r => r.CreatedDate <= DateOnly.FromDateTime(endDate.Value));

        //    var data = await query
        //    .Select(r => new ReportsDTO
        //    {
        //        Id = r.Id,
        //        FileName = r.FileName,
        //        ReportType = r.ReportType,
        //        CreatedDate = r.CreatedDate,
        //        Link = r.Link,
        //        TimeStamp = r.TimeStamp,
        //        DateRange = r.DateRange,
        //        Status = r.Status
        //    })
        //    .ToListAsync();
        //    var result = new ReportsResponseDTO
        //    {
        //        Status = 200,
        //        Message = "success, is_redis = True",
        //        Data = data
        //    };

        //    return Ok(result);
        //}

    }
}