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
    [Authorize]
    [ApiController]
    public class PlansController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<PlansController> _logger;

        public PlansController(ILogger<PlansController> logger, KabElectroSolutionsDbContext context)
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
             PlanName = p.PlanName,
             Description= p.Description,
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

            _context.Plans.Add(plans);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetPlans), new { id = plans.Id }, plans);
        }
    }
}