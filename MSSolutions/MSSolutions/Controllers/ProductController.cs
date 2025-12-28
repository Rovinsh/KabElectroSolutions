using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<ProductController> _logger;

        public ProductController(ILogger<ProductController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        // GET: api/Product
        [HttpGet("products")]
        public async Task<IActionResult> GetProducts()
        {
            var data = await _context.MsProducts
                .Select(p => new ProductDTO
                {
                    Id = p.Id,
                    ProductName = p.ProductName,
                    SKU = p.SKU,

                    CategoryId = p.CategoryId,
                    CategoryName = _context.MsCategories
                        .Where(c => c.Id == p.CategoryId)
                        .Select(c => c.CatName)
                        .FirstOrDefault(),

                    BrandId = p.BrandId,
                    BrandName = _context.MsBrands
                        .Where(b => b.Id == p.BrandId)
                        .Select(b => b.BrandName)
                        .FirstOrDefault(),

                    BaseAmount = p.BaseAmount,
                    Description = p.Description ?? "",
                    ShortDescription = p.ShortDescription ?? "",
                    DiscountPrice = p.DiscountPrice ?? 0,
                    GstId = p.GstId,
                    GstPercentage = p.GstPercentage,
                    GstAmount = p.GstAmount,
                    WithGstAmount = p.WithGstAmount,
                    StockQty = p.StockQty,
                    IsActive = p.IsActive
                })
                .ToListAsync();

            return Ok(new ProductResponseDTO
            {
                Status = 200,
                Message = "Success",
                Data = data
            });
        }

        // POST: api/Product
        [HttpPost]
        public async Task<IActionResult> CreateProduct([FromBody] MsProducts dto)
        {
            if (dto == null) return BadRequest("Invalid product data");

            bool exists = await _context.MsProducts
                .AnyAsync(p => p.SKU == dto.SKU);

            if (exists)
                return Conflict("Product with same SKU already exists.");

            var gstAmount = dto.BaseAmount * dto.GstPercentage / 100;
            var withGstAmount = dto.BaseAmount + gstAmount;

            var product = new MsProducts
            {
                ProductName = dto.ProductName,
                SKU = dto.SKU,
                CategoryId = dto.CategoryId,
                BrandId = dto.BrandId,
                BaseAmount = dto.BaseAmount,
                GstId = dto.GstId,
                GstPercentage = dto.GstPercentage,
                DiscountPrice= dto.DiscountPrice,
                Description= dto.Description,
                ShortDescription= dto.ShortDescription,
                GstAmount = gstAmount,
                WithGstAmount = withGstAmount,
                StockQty = dto.StockQty,
                IsActive = dto.IsActive,
                CreatedAt = DateTime.UtcNow
            };

            _context.MsProducts.Add(product);
            await _context.SaveChangesAsync();

            return Ok(product);
        }

        // PUT: api/Product/{id}
        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateProduct(int id, [FromBody] MsProducts dto)
        {
            var product = await _context.MsProducts.FindAsync(id);
            if (product == null) return NotFound("Product not found");

            bool duplicateSku = await _context.MsProducts
                .AnyAsync(p => p.Id != id && p.SKU == dto.SKU);

            if (duplicateSku)
                return Conflict("Another product with same SKU exists.");

            var gstAmount = dto.BaseAmount * dto.GstPercentage / 100;
            var withGstAmount = dto.BaseAmount + gstAmount;

            product.ProductName = dto.ProductName;
            product.SKU = dto.SKU;
            product.CategoryId = dto.CategoryId;
            product.BrandId = dto.BrandId;
            product.BaseAmount = dto.BaseAmount;
            product.GstId = dto.GstId;
            product.GstPercentage = dto.GstPercentage;
            product.DiscountPrice = dto.DiscountPrice;
            product.ShortDescription = dto.ShortDescription;
            product.Description = dto.Description;
            product.GstAmount = gstAmount;
            product.WithGstAmount = withGstAmount;
            product.StockQty = dto.StockQty;
            product.IsActive = dto.IsActive;
            await _context.SaveChangesAsync();
            return Ok(product);
        }

        [HttpPost("AddImages")]
        public async Task<IActionResult> AddImages([FromForm] ProductImageDto dto)
        {
            try
            {
                if (dto.Images != null && dto.Images.Count > 0)
                {
                    foreach (var file in dto.Images)
                    {
                        using var ms = new MemoryStream();
                        await file.CopyToAsync(ms);

                        var imageRequest = new MsProductImage
                        {
                            ProductId = dto.ProductId,
                            FileName = file.FileName,
                            Image = ms.ToArray(),
                            CreatedAt = DateTime.UtcNow
                        };

                        _context.MsProductImage.Add(imageRequest);
                    }

                    await _context.SaveChangesAsync();
                }

                return Ok(new { Message = "Images added successfully." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("GetImages/{productId}")]
        public async Task<IActionResult> GetImages(int productId)
        {
            var imagesList = await _context.MsProductImage
                .Where(n => n.ProductId == productId)
                .Select(n => new ProductImagesDto
                {
                    Id = n.Id,
                    ProductId = n.ProductId,
                    FileName = n.FileName,
                    ImageBase64 = Convert.ToBase64String(n.Image)
                })
                .ToListAsync();

            return Ok(new
            {
                status = 200,
                message = "Success",
                data = imagesList
            });
        }

        [HttpDelete("DeleteImage/{id}")]
        public async Task<IActionResult> DeleteImage(int id)
        {
            var image = await _context.MsProductImage.FindAsync(id);
            if (image == null) return NotFound();

            _context.MsProductImage.Remove(image);
            await _context.SaveChangesAsync();

            return Ok(new { status = 200, message = "Deleted" });
        }

    }
}
