using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class PlansController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<PlansController> _logger;

        public PlansController(ILogger<PlansController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("plans")]
        public async Task<IActionResult> GetPlans()
        {
            var data = await _context.Plans
         .Select(p => new PlansDTO
         {
             Id = p.Id,
             CatId = p.CatId,
             BrandId = p.BrandId,
             CategoryName = _context.Categories.Where(c => c.Id == p.CatId).Select(c => c.CatName).FirstOrDefault(),
             BrandName = _context.Brands.Where(b => b.Id == p.BrandId).Select(c => c.BrandName).FirstOrDefault(),
             PlanName = p.PlanName,
             Description = p.Description,
             Remark = p.Remark,
             IsDisable = p.IsDisable,
         })
         .ToListAsync();

            var result = new PlansResponseDTO
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> CreatePlans([FromBody] Plans plans)
        {
            if (plans == null)
                return BadRequest("Invalid plan data");
            bool exists = await _context.Plans.AnyAsync(p => p.CatId == plans.CatId && p.BrandId == plans.BrandId &&
                       p.PlanName == plans.PlanName);

            if (exists)
                return Conflict("A plan with the same name already exists in this category and brand.");
            try
            {
                _context.Plans.Add(plans);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetPlans), new { id = plans.Id }, plans);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Plans_Cat_Brand_PlanName") == true)
                    return Conflict("Plan already exists for this category and brand.");
                throw;
            }
        }
        
        [HttpPost("{id}")]
        public async Task<IActionResult> UpdatePlan(int id, [FromBody] Plans updatedPlan)
        {
            if (updatedPlan == null)
                return BadRequest("Invalid plan data");

            var existingPlan = await _context.Plans.FindAsync(id);
            if (existingPlan == null)
                return NotFound("Plan not found");

            bool duplicateExists = await _context.Plans.AnyAsync(p => p.Id != id && p.BrandId == updatedPlan.BrandId &&
                               p.CatId == updatedPlan.CatId &&
                               p.PlanName == updatedPlan.PlanName);


            if (duplicateExists)
                return Conflict("A plan with the same name already exists for this category and brand.");

            existingPlan.CatId = updatedPlan.CatId;
            existingPlan.BrandId = updatedPlan.BrandId;
            existingPlan.PlanName = updatedPlan.PlanName;
            existingPlan.Description = updatedPlan.Description;
            existingPlan.Remark = updatedPlan.Remark;
            existingPlan.IsDisable = updatedPlan.IsDisable;

            try
            {
                _context.Plans.Update(existingPlan);
                await _context.SaveChangesAsync();
                return Ok(existingPlan);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Plans_Cat_PlanName") == true)
                    return Conflict("Plan already exists for this category.");
                throw;
            }
        }
    }
}