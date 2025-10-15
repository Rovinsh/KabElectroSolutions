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
    public class CategoriesController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<CategoriesController> _logger;

        public CategoriesController(ILogger<CategoriesController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("categories")]
        public async Task<IActionResult> GetCategories()
        {
            var data = await _context.Categories
         .Select(c => new CategoriesDTO
         {
             Id = c.Id,
             CatName = c.CatName,
             Description = c.Description,
             IsDisable = c.IsDisable,
         })
         .ToListAsync();

            var result = new CategoriesResponseDTO
            {
                Status = 200,
                Message = "success, categories",
                Data = data
            };

            return Ok(result);
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateCategories([FromBody] Categories categories)
        {
            if (categories == null)
                return BadRequest("Invalid categories data");

            _context.Categories.Add(categories);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetCategories), new { id = categories.Id }, categories);
        }

    }
}