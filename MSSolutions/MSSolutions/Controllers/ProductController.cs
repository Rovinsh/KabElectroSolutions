using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Models;
using System.Security.Claims;

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
                    WhentoPurchase = p.WhentoPurchase ?? "",
                    ProductCovered = p.ProductCovered ?? "",
                    NoOfDevicesCovered = p.NoOfDevicesCovered ?? "",
                    ServicesPeriod = p.ServicesPeriod ?? "",
                    ServicesCoverFeature = p.ServicesCoverFeature ?? "",
                    ServicesAvilableFrom = p.ServicesAvilableFrom ?? "",
                    ProductUrl = p.ProductUrl ?? "",
                    CashlessService = p.CashlessService ?? "",
                    AuthorizedServiceCentreRepairs = p.AuthorizedServiceCentreRepairs ?? "",
                    ClaimType = p.ClaimType ?? "",
                    ServiceCancellationRefundPeriod = p.ServiceCancellationRefundPeriod ?? "",
                    ExtendedHoursSupport = p.ExtendedHoursSupport ?? "",
                    SupportCentreContactDetails = p.SupportCentreContactDetails ?? "",
                    HowtoClaim = p.HowtoClaim ?? "",
                    ServiceType = p.ServiceType ?? "",
                    InstallationDemo = p.InstallationDemo ?? "",
                    CustomerSupportEmail = p.CustomerSupportEmail ?? "",
                    RepairCostCovered = p.RepairCostCovered ?? "",
                    ServiceExcludes = p.ServiceExcludes ?? "",
                    ServiceIncludes = p.ServiceIncludes ?? "",
                    MarketerNameAddress = p.MarketerNameAddress ?? "",
                    DocumentsRequired = p.DocumentsRequired ?? "",
                    CostCovered = p.CostCovered ?? "",
                    DiscountPrice = p.DiscountPrice ?? 0,
                    GstId = p.GstId,
                    GstPercentage = p.GstPercentage,
                    GstAmount = p.GstAmount,
                    WithGstAmount = p.WithGstAmount,
                    StockQty = p.StockQty,
                    IsActive = p.IsActive,
                    Images = _context.MsProductImage
                .Where(i => i.ProductId == p.Id)
                .Select(i => new ProductImagesDto
                {
                    Id = i.Id,
                    ProductId = i.ProductId,
                    FileName = i.FileName,
                    ImageBase64 = Convert.ToBase64String(i.Image)
                })
                .ToList()
                })
                .ToListAsync();

            return Ok(new ProductResponseDTO
            {
                Status = 200,
                Message = "Success",
                Data = data
            });
        }


        [HttpGet("homeproducts")]
        public async Task<IActionResult> GetHomeProducts()
        {
            // 1️⃣ Get Categories
            var categories = await _context.MsCategories
                  .AsNoTracking()
                .Where(c => c.IsDisable)
                .Select(c => new CategoriesDTO
                {
                    Id = c.Id,
                    CatName = c.CatName,
                    Description = c.Description,
                    CatUrl = c.CatUrl,
                    IsDisable = c.IsDisable
                })
                .ToListAsync();

            // 2️⃣ Get Air Conditioner CategoryId
            var airCategoryId = categories
                .Where(c => c.CatName == "Air Conditioner")
                .Select(c => c.Id)
                .FirstOrDefault();

            // 4️⃣ Get Products (Top 4)
            var productsRaw = await _context.MsProducts
                   .AsNoTracking()
                .Where(p => p.CategoryId == airCategoryId && p.IsActive)
                .Take(4)
                .ToListAsync();

            var productIds = productsRaw.Select(p => p.Id).ToList();

            var images = await _context.MsProductImage
    .AsNoTracking()
    .Where(i => productIds.Contains(i.ProductId))
    .GroupBy(i => i.ProductId)
    .Select(g => g
        .OrderBy(i => i.Id) // define which is first (can change to CreatedDate if needed)
        .Select(i => new
        {
            i.Id,
            i.ProductId,
            i.FileName,
            i.Image
        })
        .FirstOrDefault()
    )
    .ToListAsync();

            // Convert to dictionary (still List<ProductImagesDto>)
            var imageLookup = images
                .Where(i => i != null)
                .ToDictionary(
                    i => i.ProductId,
                    i => new List<ProductImagesDto>
                    {
            new ProductImagesDto
            {
                Id = i.Id,
                ProductId = i.ProductId,
                FileName = i.FileName,
                ImageBase64 = Convert.ToBase64String(i.Image)
            }
                    }
                );

            // 6️⃣ Map to ProductDTO
            var products = productsRaw.Select(p => new ProductDTO
            {
                Id = p.Id,
                ProductName = p.ProductName,
                SKU = p.SKU,

                CategoryId = p.CategoryId,
                //CategoryName = categoryDict.ContainsKey(p.CategoryId)
                //                ? categoryDict[p.CategoryId]
                //                : "",

                BrandId = p.BrandId,
                //BrandName = brandDict.ContainsKey(p.BrandId)
                //                ? brandDict[p.BrandId]
                //                : "",

                BaseAmount = p.BaseAmount,
                Description = p.Description ?? "",
                ShortDescription = p.ShortDescription ?? "",
                WhentoPurchase = p.WhentoPurchase ?? "",
                ProductCovered = p.ProductCovered ?? "",
                NoOfDevicesCovered = p.NoOfDevicesCovered ?? "",
                ServicesPeriod = p.ServicesPeriod ?? "",
                ServicesCoverFeature = p.ServicesCoverFeature ?? "",
                ServicesAvilableFrom = p.ServicesAvilableFrom ?? "",
                ProductUrl = p.ProductUrl ?? "",
                CashlessService = p.CashlessService ?? "",
                AuthorizedServiceCentreRepairs = p.AuthorizedServiceCentreRepairs ?? "",
                ClaimType = p.ClaimType ?? "",
                ServiceCancellationRefundPeriod = p.ServiceCancellationRefundPeriod ?? "",
                ExtendedHoursSupport = p.ExtendedHoursSupport ?? "",
                SupportCentreContactDetails = p.SupportCentreContactDetails ?? "",
                HowtoClaim = p.HowtoClaim ?? "",
                ServiceType = p.ServiceType ?? "",
                InstallationDemo = p.InstallationDemo ?? "",
                CustomerSupportEmail = p.CustomerSupportEmail ?? "",
                RepairCostCovered = p.RepairCostCovered ?? "",
                ServiceExcludes = p.ServiceExcludes ?? "",
                ServiceIncludes = p.ServiceIncludes ?? "",
                MarketerNameAddress = p.MarketerNameAddress ?? "",
                DocumentsRequired = p.DocumentsRequired ?? "",
                CostCovered = p.CostCovered ?? "",
                DiscountPrice = p.DiscountPrice ?? 0,
                GstId = p.GstId,
                GstPercentage = p.GstPercentage,
                GstAmount = p.GstAmount,
                WithGstAmount = p.WithGstAmount,
                StockQty = p.StockQty,
                IsActive = p.IsActive,
                Images = imageLookup.ContainsKey(p.Id)
    ? imageLookup[p.Id]
    : new List<ProductImagesDto>()
            }).ToList();

            var result = new HomeInitResponseDTO
            {
                Status = 200,
                Message = "Success",
                Data = new HomeInitDTO
                {
                    Categories = categories,
                    HomeProducts = products
                }
            };

            return Ok(result);
        }

        [HttpGet("productList")]
        public async Task<IActionResult> GetproductList()
        {
            // 1️⃣ Categories
            var categories = await _context.MsCategories
                 .AsNoTracking()
               .Where(c => c.IsDisable)
               .Select(c => new CategoriesDTO
               {
                   Id = c.Id,
                   CatName = c.CatName,
                   Description = c.Description,
                   CatUrl = c.CatUrl,
                   IsDisable = c.IsDisable
               })
               .ToListAsync();

            // 2️⃣ Brands
            var brands = await (
     from b in _context.MsBrands.AsNoTracking()
     join c in _context.MsCategories.AsNoTracking()
         on b.CategoryId equals c.Id
     where b.IsDisable
     select new BrandsDTO
     {
         Id = b.Id,
         CategoryId = b.CategoryId,
         CategoryName = c.CatName,
         BrandName = b.BrandName,
         Description = b.Description,
         IsDisable = b.IsDisable
     }
 ).ToListAsync();


            // 4️⃣ Get Products (Top 4)
            var productsRaw = await _context.MsProducts
                   .AsNoTracking()
                .Where(p => p.IsActive)
                .Take(4)
                .ToListAsync();

            var productIds = productsRaw.Select(p => p.Id).ToList();

            var images = await _context.MsProductImage
    .AsNoTracking()
    .Where(i => productIds.Contains(i.ProductId))
    .GroupBy(i => i.ProductId)
    .Select(g => g
        .OrderBy(i => i.Id) // define which is first (can change to CreatedDate if needed)
        .Select(i => new
        {
            i.Id,
            i.ProductId,
            i.FileName,
            i.Image
        })
        .FirstOrDefault()
    )
    .ToListAsync();

            // Convert to dictionary (still List<ProductImagesDto>)
            var imageLookup = images
                .Where(i => i != null)
                .ToDictionary(
                    i => i.ProductId,
                    i => new List<ProductImagesDto>
                    {
            new ProductImagesDto
            {
                Id = i.Id,
                ProductId = i.ProductId,
                FileName = i.FileName,
                ImageBase64 = Convert.ToBase64String(i.Image)
            }
                    }
                );

            // 6️⃣ Map to ProductDTO
            var products = productsRaw.Select(p => new ProductDTO
            {
                Id = p.Id,
                ProductName = p.ProductName,
                SKU = p.SKU,

                CategoryId = p.CategoryId,
                //CategoryName = categoryDict.ContainsKey(p.CategoryId)
                //                ? categoryDict[p.CategoryId]
                //                : "",

                BrandId = p.BrandId,
                //BrandName = brandDict.ContainsKey(p.BrandId)
                //                ? brandDict[p.BrandId]
                //                : "",

                BaseAmount = p.BaseAmount,
                Description = p.Description ?? "",
                ShortDescription = p.ShortDescription ?? "",
                WhentoPurchase = p.WhentoPurchase ?? "",
                ProductCovered = p.ProductCovered ?? "",
                NoOfDevicesCovered = p.NoOfDevicesCovered ?? "",
                ServicesPeriod = p.ServicesPeriod ?? "",
                ServicesCoverFeature = p.ServicesCoverFeature ?? "",
                ServicesAvilableFrom = p.ServicesAvilableFrom ?? "",
                ProductUrl = p.ProductUrl ?? "",
                CashlessService = p.CashlessService ?? "",
                AuthorizedServiceCentreRepairs = p.AuthorizedServiceCentreRepairs ?? "",
                ClaimType = p.ClaimType ?? "",
                ServiceCancellationRefundPeriod = p.ServiceCancellationRefundPeriod ?? "",
                ExtendedHoursSupport = p.ExtendedHoursSupport ?? "",
                SupportCentreContactDetails = p.SupportCentreContactDetails ?? "",
                HowtoClaim = p.HowtoClaim ?? "",
                ServiceType = p.ServiceType ?? "",
                InstallationDemo = p.InstallationDemo ?? "",
                CustomerSupportEmail = p.CustomerSupportEmail ?? "",
                RepairCostCovered = p.RepairCostCovered ?? "",
                ServiceExcludes = p.ServiceExcludes ?? "",
                ServiceIncludes = p.ServiceIncludes ?? "",
                MarketerNameAddress = p.MarketerNameAddress ?? "",
                DocumentsRequired = p.DocumentsRequired ?? "",
                CostCovered = p.CostCovered ?? "",
                DiscountPrice = p.DiscountPrice ?? 0,
                GstId = p.GstId,
                GstPercentage = p.GstPercentage,
                GstAmount = p.GstAmount,
                WithGstAmount = p.WithGstAmount,
                StockQty = p.StockQty,
                IsActive = p.IsActive,
                Images = imageLookup.ContainsKey(p.Id)
    ? imageLookup[p.Id]
    : new List<ProductImagesDto>()
            }).ToList();
            var result = new ProductListsInitResponseDTO
            {
                Status = 200,
                Message = "Success",
                Data = new ProductListInitResponseDTO
                {
                    Categories = categories,
                    HomeProducts = products,
                    Brands = brands
                }
            };

            return Ok(result);
        }

        [HttpGet("productsByUrl")]
        public async Task<IActionResult> GetProductsByUrl(string productUrl)
        {
            // 1️⃣ Get Products with Category & Brand
            var productsRaw = await (
                from p in _context.MsProducts.AsNoTracking()
                join c in _context.MsCategories.AsNoTracking()
                    on p.CategoryId equals c.Id
                join b in _context.MsBrands.AsNoTracking()
                    on p.BrandId equals b.Id
                where p.IsActive && p.ProductUrl == productUrl
                select new
                {
                    Product = p,
                    CategoryName = c.CatName,
                    BrandName = b.BrandName
                }
            ).ToListAsync();

            if (!productsRaw.Any())
            {
                return Ok(new ProductResponseDTO
                {
                    Status = 200,
                    Message = "No Products Found",
                    Data = new List<ProductDTO>()
                });
            }

            var productIds = productsRaw.Select(x => x.Product.Id).ToList();

            // 2️⃣ Load Images
            var images = await _context.MsProductImage
                .AsNoTracking()
                .Where(i => productIds.Contains(i.ProductId))
                .Select(i => new
                {
                    i.Id,
                    i.ProductId,
                    i.FileName,
                    i.Image
                })
                .ToListAsync();

            // 3️⃣ Group Images
            var imageLookup = images
                .GroupBy(i => i.ProductId)
                .ToDictionary(
                    g => g.Key,
                    g => g.Select(img => new ProductImagesDto
                    {
                        Id = img.Id,
                        ProductId = img.ProductId,
                        FileName = img.FileName,
                        ImageBase64 = Convert.ToBase64String(img.Image)
                    }).ToList()
                );

            // 4️⃣ Map to DTO
            var products = productsRaw.Select(x =>
            {
                var p = x.Product;

                return new ProductDTO
                {
                    Id = p.Id,
                    ProductName = p.ProductName,
                    SKU = p.SKU,

                    CategoryId = p.CategoryId,
                    CategoryName = x.CategoryName,   // ✅ From Join

                    BrandId = p.BrandId,
                    BrandName = x.BrandName,         // ✅ From Join

                    BaseAmount = p.BaseAmount,
                    Description = p.Description ?? "",
                    ShortDescription = p.ShortDescription ?? "",
                    WhentoPurchase = p.WhentoPurchase ?? "",
                    ProductCovered = p.ProductCovered ?? "",
                    NoOfDevicesCovered = p.NoOfDevicesCovered ?? "",
                    ServicesPeriod = p.ServicesPeriod ?? "",
                    ServicesCoverFeature = p.ServicesCoverFeature ?? "",
                    ServicesAvilableFrom = p.ServicesAvilableFrom ?? "",
                    ProductUrl = p.ProductUrl ?? "",
                    CashlessService = p.CashlessService ?? "",
                    AuthorizedServiceCentreRepairs = p.AuthorizedServiceCentreRepairs ?? "",
                    ClaimType = p.ClaimType ?? "",
                    ServiceCancellationRefundPeriod = p.ServiceCancellationRefundPeriod ?? "",
                    ExtendedHoursSupport = p.ExtendedHoursSupport ?? "",
                    SupportCentreContactDetails = p.SupportCentreContactDetails ?? "",
                    HowtoClaim = p.HowtoClaim ?? "",
                    ServiceType = p.ServiceType ?? "",
                    InstallationDemo = p.InstallationDemo ?? "",
                    CustomerSupportEmail = p.CustomerSupportEmail ?? "",
                    RepairCostCovered = p.RepairCostCovered ?? "",
                    ServiceExcludes = p.ServiceExcludes ?? "",
                    ServiceIncludes = p.ServiceIncludes ?? "",
                    MarketerNameAddress = p.MarketerNameAddress ?? "",
                    DocumentsRequired = p.DocumentsRequired ?? "",
                    CostCovered = p.CostCovered ?? "",
                    DiscountPrice = p.DiscountPrice ?? 0,
                    GstId = p.GstId,
                    GstPercentage = p.GstPercentage,
                    GstAmount = p.GstAmount,
                    WithGstAmount = p.WithGstAmount,
                    StockQty = p.StockQty,
                    IsActive = p.IsActive,

                    Images = imageLookup.ContainsKey(p.Id)
                        ? imageLookup[p.Id]
                        : new List<ProductImagesDto>()
                };
            }).ToList();

            return Ok(new ProductResponseDTO
            {
                Status = 200,
                Message = "Success",
                Data = products
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
            var discount = dto.DiscountPrice ?? 0m;
            var taxableAmount = Math.Max(dto.BaseAmount - discount, 0);

            var gstAmount = Math.Round(taxableAmount * dto.GstPercentage / 100, 2);

            var withGstAmount = Math.Round(taxableAmount + gstAmount, 2);

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
                WhentoPurchase = dto.WhentoPurchase,
                ProductCovered = dto.ProductCovered,
                ServicesCoverFeature = dto.ServicesCoverFeature,
                NoOfDevicesCovered = dto.NoOfDevicesCovered,
                ServicesAvilableFrom = dto.ServicesAvilableFrom,
                CashlessService = dto.CashlessService,
                AuthorizedServiceCentreRepairs = dto.AuthorizedServiceCentreRepairs,
                ClaimType = dto.ClaimType,
                ServiceCancellationRefundPeriod = dto.ServiceCancellationRefundPeriod,
                ExtendedHoursSupport = dto.ExtendedHoursSupport,
                SupportCentreContactDetails = dto.SupportCentreContactDetails,
                HowtoClaim = dto.HowtoClaim,
                ServiceType = dto.ServiceType,
                InstallationDemo = dto.InstallationDemo,
                CustomerSupportEmail = dto.CustomerSupportEmail,
                RepairCostCovered = dto.RepairCostCovered,
                ServiceExcludes = dto.ServiceExcludes,
                ServiceIncludes = dto.ServiceIncludes,
                MarketerNameAddress = dto.MarketerNameAddress,
                DocumentsRequired = dto.DocumentsRequired,
                CostCovered = dto.CostCovered,
                ServicesPeriod = dto.ServicesPeriod,
                ProductUrl = GenerateSlug(dto.ProductName),
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
        private string GenerateSlug(string name)
        {
            return name
                .ToLowerInvariant()
                .Trim()
                .Replace(" ", "-")          // spaces to dash
                .Replace("&", "and")        // optional cleanup
                .Replace("--", "-");        // avoid double dash
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

            var discount = dto.DiscountPrice ?? 0m;
            var taxableAmount = Math.Max(dto.BaseAmount - discount, 0);

            var gstAmount = Math.Round(taxableAmount * dto.GstPercentage / 100, 2);

            var withGstAmount = Math.Round(taxableAmount + gstAmount, 2);

            product.ProductName = dto.ProductName;
            product.SKU = dto.SKU;
            product.CategoryId = dto.CategoryId;
            product.BrandId = dto.BrandId;
            product.BaseAmount = dto.BaseAmount;
            product.GstId = dto.GstId;
            product.GstPercentage = dto.GstPercentage;
            product.DiscountPrice = dto.DiscountPrice;
            product.ShortDescription = dto.ShortDescription;
            product.WhentoPurchase = dto.WhentoPurchase;
            product.NoOfDevicesCovered = dto.NoOfDevicesCovered;
            product.ServicesCoverFeature = dto.ServicesCoverFeature;
            product.ServicesAvilableFrom = dto.ServicesAvilableFrom;   
            product.ServicesPeriod = dto.ServicesPeriod;
            product.CashlessService = dto.CashlessService;
            product.AuthorizedServiceCentreRepairs = dto.AuthorizedServiceCentreRepairs;
            product.CashlessService = dto.CashlessService;
            product.ServiceCancellationRefundPeriod = dto.ServiceCancellationRefundPeriod;
            product.ExtendedHoursSupport = dto.ExtendedHoursSupport;
            product.SupportCentreContactDetails = dto.SupportCentreContactDetails;
            product.HowtoClaim = dto.HowtoClaim;
            product.ServiceType = dto.ServiceType;
            product.ClaimType = dto.ClaimType;
            product.InstallationDemo = dto.InstallationDemo;
            product.CustomerSupportEmail = dto.CustomerSupportEmail;
            product.RepairCostCovered = dto.RepairCostCovered;
            product.ServiceExcludes = dto.ServiceExcludes;
            product.ServiceIncludes = dto.ServiceIncludes;
            product.MarketerNameAddress = dto.MarketerNameAddress;
            product.DocumentsRequired = dto.DocumentsRequired;
            product.CostCovered = dto.CostCovered;
            product.ProductUrl = GenerateSlug(dto.ProductName);
            product.ProductCovered = dto.ProductCovered;
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

        [HttpGet("DeleteImage/{id}")]
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
