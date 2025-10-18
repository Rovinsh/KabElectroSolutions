using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class WarrantiesController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<WarrantiesController> _logger;

        public WarrantiesController(ILogger<WarrantiesController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }
        [HttpGet("warranties")]
        public async Task<IActionResult> GetWarranties()
        {
            var warranties = await _context.Warranties
                .Select(w => new WarrantiesDTO
                {
                    Id = w.Id,
                    SerialNumber = w.SerialNumber,
                    WarrantyType = w.WarrantyType,
                    WarrantyTypeId = w.WarrantyTypeId,
                    WarrantyDisplayName = w.WarrantyDisplayName,      
                    WarrantyCode = w.WarrantyCode,         
                    WarrantyPrice = w.WarrantyPrice,                
                    WarrantyDuration = w.WarrantyDuration,           
                    WarrantyStartDate = w.WarrantyStartDate,        
                    WarrantyEndDate = w.WarrantyEndDate,             
                    WarrantyInvoiceNo = w.WarrantyInvoiceNo, 
                    WarrantyPurchaseDate = w.WarrantyPurchaseDate,   
                    WarrantySeller = w.WarrantySeller,               
                    WarrantyCouponCode = w.WarrantyCouponCode,       
                    WarrantyScratchCode = w.WarrantyScratchCode,     
                    WarrantyExtraInfo = w.WarrantyExtraInfo,         
                    WarrantyDescription = w.WarrantyDescription, 
                    WarrantyCreatedBy = w.WarrantyCreatedBy,
                    ProductName = w.ProductName,
                    ProductId = w.ProductId,
                    CustomerName = w.CustomerName,
                    CustomerMobileNo = w.CustomerMobileNo,
                    CustomerEmail = w.CustomerEmail,
                    CustomerAddress = w.CustomerAddress,
                    CustomerCityId = w.CustomerCityId,
                    CustomerCityName = w.CustomerCityName,
                    CustomerStateId = w.CustomerStateId,
                    CustomerStateName = w.CustomerStateName,
                    CustomerPinCode = w.CustomerPinCode,
                    IsDisable = w.IsDisable
                })
                .ToListAsync();
            return Ok(new
            {
                status = 200,
                message = "Warranty Statuses",
                data = warranties
            });
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateWarranty([FromBody] Warranties warranties)
        {
            if (warranties == null)
                return BadRequest("Invalid warranty data");

            _context.Warranties.Add(warranties);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetWarranties), new { id = warranties.Id }, warranties);
        }

    }
}
