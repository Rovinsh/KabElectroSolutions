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
    public class BrandsController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<BrandsController> _logger;

        public BrandsController(ILogger<BrandsController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("brands")]
        public async Task<IActionResult> GetBrands()
        {
            var data = await _context.MsBrands
         .Select(b => new BrandsDTO
         {
             Id = b.Id,
             CategoryId = b.CategoryId,
             CategoryName = _context.MsCategories.Where(c => c.Id == b.CategoryId).Select(c => c.CatName).FirstOrDefault(),
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
        public async Task<IActionResult> CreateBrands([FromBody] MsBrands brands)
        {
            if (brands == null)
                return BadRequest("Invalid brand data");

            bool exists = await _context.MsBrands.AnyAsync(b => b.CategoryId == brands.CategoryId
                    && b.BrandName == brands.BrandName);

            if (exists)
                return Conflict("A brand with the same name already exists in this category.");
            try
            {
                _context.MsBrands.Add(brands);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetBrands), new { id = brands.Id }, brands);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Brands_Category_BrandName") == true)
                    return Conflict("Brand already exists for this category.");
                throw; 
            }
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateBrand(int id, [FromBody] MsBrands updatedBrand)
        {
            if (updatedBrand == null)
                return BadRequest("Invalid brand data");

            var existingBrand = await _context.MsBrands.FindAsync(id);
            if (existingBrand == null)
                return NotFound("Brand not found");

            bool duplicateExists = await _context.MsBrands.AnyAsync(b => b.Id != id &&
                      b.CategoryId == updatedBrand.CategoryId &&
                      b.BrandName == updatedBrand.BrandName);

            if (duplicateExists)
                return Conflict("A brand with the same name already exists in this category.");

            existingBrand.CategoryId = updatedBrand.CategoryId;
            existingBrand.BrandName = updatedBrand.BrandName;
            existingBrand.Description = updatedBrand.Description;
            existingBrand.IsDisable = updatedBrand.IsDisable;

            try
            {
                _context.MsBrands.Update(existingBrand);
                await _context.SaveChangesAsync();
                return Ok(existingBrand);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Brands_Category_BrandName") == true)
                    return Conflict("Brand already exists for this category.");
                throw; 
            }
        }
    }
}