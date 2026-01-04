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
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<CategoriesController> _logger;

        public CategoriesController(ILogger<CategoriesController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("categories")]
        public async Task<IActionResult> GetCategories()
        {
            var data = await _context.MsCategories
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
        public async Task<IActionResult> CreateCategories([FromBody] MsCategories categories)
        {
            if (categories == null)
                return BadRequest("Invalid categories data");

            try
            {
                _context.MsCategories.Add(categories);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetCategories),
                    new { id = categories.Id }, categories);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Categories_CatName") == true)
                {
                    return Conflict("Category name already exists.");
                }

                return StatusCode(500, "An error occurred while saving the category.");
            }
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateCategory(int id, [FromBody] MsCategories updatedCategory)
        {
            if (updatedCategory == null)
                return BadRequest("Invalid category data");

            var existingCategory = await _context.MsCategories.FindAsync(id);
            if (existingCategory == null)
                return NotFound("Category not found");
            try
            {
                existingCategory.CatName = updatedCategory.CatName;
                existingCategory.Description = updatedCategory.Description;
                existingCategory.IsDisable = updatedCategory.IsDisable;

                _context.MsCategories.Update(existingCategory);
                await _context.SaveChangesAsync();

                return Ok(existingCategory);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Categories_CatName") == true)
                {
                    return Conflict("Category name already exists.");
                }

                return StatusCode(500, "An error occurred while saving the category.");
            }
        }

    }
}