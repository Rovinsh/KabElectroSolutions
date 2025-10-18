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
    public class BrandsController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<BrandsController> _logger;

        public BrandsController(ILogger<BrandsController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("brands")]
        public async Task<IActionResult> GetBrands()
        {
            var data = await _context.Brands
         .Select(b => new BrandsDTO
         {
             Id = b.Id,
             CategoryId = b.CategoryId,
             CategoryName = _context.Categories.Where(c => c.Id == b.CategoryId).Select(c => c.CatName).FirstOrDefault(),
             BrandName = b.BrandName,
             Description = b.Description,
             IsDisable = b.IsDisable,
         })
         .ToListAsync();

            var result = new BrandsResponseDTO
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> CreateBrands([FromBody] Brands brands)
        {
            if (brands == null)
                return BadRequest("Invalid brand data");

            _context.Brands.Add(brands);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetBrands), new { id = brands.Id }, brands);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBrand(int id, [FromBody] Brands updatedBrand)
        {
            if (updatedBrand == null)
                return BadRequest("Invalid brand data");

            var existingBrand = await _context.Brands.FindAsync(id);
            if (existingBrand == null)
                return NotFound("Brand not found");

            existingBrand.CategoryId = updatedBrand.CategoryId;
            existingBrand.BrandName = updatedBrand.BrandName;
            existingBrand.Description = updatedBrand.Description;
            existingBrand.IsDisable = updatedBrand.IsDisable;

            _context.Brands.Update(existingBrand);
            await _context.SaveChangesAsync();

            return Ok(existingBrand);
        }
    }
}