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
                    ItemSerialNumber = w.ItemSerialNumber,
                    WarrantyType = _context.WarrantyTypes.Where(wt => wt.Id == w.WarrantyTypeId).Select(c => c.Name).FirstOrDefault(),
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
                    ProductName = _context.Plans.Where(pl => pl.Id == w.ProductId).Select(c => c.PlanName).FirstOrDefault(),
                    ProductId = w.ProductId,
                    CustomerName = w.CustomerName,
                    CustomerMobileNo = w.CustomerMobileNo,
                    CustomerEmail = w.CustomerEmail,
                    CustomerAddress = w.CustomerAddress,
                    CityId = w.CityId,
                    CustomerCityName = _context.Cities.Where(c => c.Id == w.CityId).Select(ct => ct.Name).FirstOrDefault(),
                    StateId = w.StateId,
                    CustomerStateName = _context.Locations.Where(s => s.Id == w.StateId).Select(c => c.Name).FirstOrDefault(),
                    PinCodeId = w.PinCodeId,
                    CustomerPinCode= _context.Pincodes.Where(pin=>pin.Id == w.PinCodeId).Select(pn=>pn.PincodeValue).FirstOrDefault(),
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

        [HttpGet("byParameter")]
        public async Task<IActionResult> GetWarrantiesByParameter([FromQuery] string? phone, [FromQuery] string? email)
        {
            if (string.IsNullOrWhiteSpace(phone) && string.IsNullOrWhiteSpace(email))
                return BadRequest("At least one of phone or email must be provided.");

            var warranties = await (
              from w in _context.Warranties
              join p in _context.Plans on w.ProductId equals p.Id
              join c in _context.Categories on p.CatId equals c.Id into categoryGroup
              from cat in categoryGroup.DefaultIfEmpty()
              join b in _context.Brands on p.BrandId equals b.Id into brandGroup
              from brand in brandGroup.DefaultIfEmpty() 
              where
              w.IsDisable == true &&                                     
                  (
                  (!string.IsNullOrEmpty(phone) && w.CustomerMobileNo == phone) ||
                  (!string.IsNullOrEmpty(email) && w.CustomerEmail == email))
              select new WarrantiesDTO
              {
                  Id = w.Id,
                  SerialNumber = w.SerialNumber,
                  ItemSerialNumber = w.ItemSerialNumber,
                  ProductId = w.ProductId,
                  ProductName = p.PlanName,
                  CatgoryName = cat.CatName,
                  BrandName = brand.BrandName,
                  WarrantyTypeId = w.WarrantyTypeId,
                 WarrantyType = _context.WarrantyTypes.Where(wt => wt.Id == w.WarrantyTypeId).Select(c => c.Name).FirstOrDefault(),
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
                 CustomerName = w.CustomerName,
                 CustomerMobileNo = w.CustomerMobileNo,
                 CustomerEmail = w.CustomerEmail,
                 CustomerAddress = w.CustomerAddress,
                 CityId = w.CityId,
                 CustomerCityName = _context.Cities.Where(c => c.Id == w.CityId).Select(ct => ct.Name).FirstOrDefault(),
                 StateId = w.StateId,
                 CustomerStateName = _context.Locations.Where(s => s.Id == w.StateId).Select(c => c.Name).FirstOrDefault(),
                 PinCodeId = w.PinCodeId,
                 CustomerPinCode = _context.Pincodes.Where(pin => pin.Id == w.PinCodeId).Select(pn => pn.PincodeValue).FirstOrDefault(),
                 IsDisable = w.IsDisable
             })
             .ToListAsync();

                    if (!warranties.Any())
                        return NotFound("No warranty found for the provided criteria.");

                    return Ok(new
                    {
                        status = 200,
                        message = "Warranty details fetched successfully.",
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

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdatWarranties(int id, [FromBody] Warranties warranties)
        {
            if (warranties == null)
                return BadRequest("Invalid warranty data");

            var existingWarranty = await _context.Warranties.FindAsync(id);
            if (existingWarranty == null)
                return NotFound("Warranty not found");

            existingWarranty.SerialNumber = warranties.SerialNumber;
            existingWarranty.ItemSerialNumber = warranties.ItemSerialNumber;
            existingWarranty.WarrantyTypeId = warranties.WarrantyTypeId;
            existingWarranty.WarrantyDisplayName = warranties.WarrantyDisplayName;
            existingWarranty.WarrantyCode = warranties.WarrantyCode;
            existingWarranty.WarrantyPrice = warranties.WarrantyPrice;
            existingWarranty.WarrantyDuration = warranties.WarrantyDuration;
            existingWarranty.WarrantyStartDate = warranties.WarrantyStartDate;
            existingWarranty.WarrantyEndDate = warranties.WarrantyEndDate;
            existingWarranty.WarrantyInvoiceNo = warranties.WarrantyInvoiceNo;
            existingWarranty.WarrantyPurchaseDate = warranties.WarrantyPurchaseDate;
            existingWarranty.WarrantySeller = warranties.WarrantySeller;
            existingWarranty.WarrantyCouponCode = warranties.WarrantyCouponCode;
            existingWarranty.WarrantyScratchCode = warranties.WarrantyScratchCode;
            existingWarranty.WarrantyExtraInfo = warranties.WarrantyExtraInfo;
            existingWarranty.WarrantyDescription = warranties.WarrantyDescription;
            existingWarranty.WarrantyCreatedBy = warranties.WarrantyCreatedBy;
            existingWarranty.ProductId = warranties.ProductId;
            existingWarranty.CustomerName = warranties.CustomerName;
            existingWarranty.CustomerMobileNo = warranties.CustomerMobileNo;
            existingWarranty.CustomerEmail = warranties.CustomerEmail;
            existingWarranty.CustomerAddress = warranties.CustomerAddress;
            existingWarranty.CityId = warranties.CityId;
            existingWarranty.StateId = warranties.StateId;
            existingWarranty.PinCodeId = warranties.PinCodeId;
            existingWarranty.IsDisable = warranties.IsDisable;

            _context.Warranties.Update(existingWarranty);
            await _context.SaveChangesAsync();

            return Ok(existingWarranty);
        }

    }
}
