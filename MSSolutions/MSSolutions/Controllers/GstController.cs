using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace KabEleMSSolutionsctroSolutions.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class GstController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<GstController> _logger;

        public GstController(ILogger<GstController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("gst")]
        public async Task<IActionResult> GetGst()
        {
            var data = await _context.MsGst
         .Select(c => new GstDTO
         {
             Id = c.Id,
             GstValue = c.GstValue,
             Description = c.Description,
             IsDisable = c.IsDisable,
         })
         .ToListAsync();

            var result = new GstResponseDTO
            {
                Status = 200,
                Message = "success, GST",
                Data = data
            };

            return Ok(result);
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateGst([FromBody] MsGst gstdata)
        {
            if (gstdata == null)
                return BadRequest("Invalid GST data");

            try
            {
                _context.MsGst.Add(gstdata);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetGst),
                    new { id = gstdata.Id }, gstdata);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_MsGst_GstValue") == true)
                {
                    return Conflict("GST Value already exists.");
                }

                return StatusCode(500, "An error occurred while saving the GST.");
            }
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateGst(int id, [FromBody] MsGst updatedGst)
        {
            if (updatedGst == null)
                return BadRequest("Invalid Gst data");

            var existingGst = await _context.MsGst.FindAsync(id);
            if (existingGst == null)
                return NotFound("Gst not found");
            try
            {
                existingGst.GstValue = updatedGst.GstValue;
                existingGst.Description = updatedGst.Description;
                existingGst.IsDisable = updatedGst.IsDisable;

                _context.MsGst.Update(existingGst);
                await _context.SaveChangesAsync();

                return Ok(existingGst);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_MsGst_GstValue") == true)
                {
                    return Conflict("gst name already exists.");
                }

                return StatusCode(500, "An error occurred while saving the gst.");
            }
        }

    }
}