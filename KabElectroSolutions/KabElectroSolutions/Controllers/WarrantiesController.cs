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
            var warranty = await _context.Warranties.Select(w => new Warranties
            {
                Id = w.Id,
                IsZappEnable = w.IsZappEnable,
                Status = w.Status,
                SerialNumber = w.SerialNumber,
                RegionId = w.RegionId,
                DisplayName = w.DisplayName,
                PolicyId = w.PolicyId,
                RmId = w.RmId,
                ActivationCode = w.ActivationCode,
                Price = w.Price,
                ExtraInfo = w.ExtraInfo,
                Duration = w.Duration,
                ProductExtraImage = w.ProductExtraImage,
                DiscrepancyReason = w.DiscrepancyReason,
                StoreAssignedAt = w.StoreAssignedAt,
                Active = w.Active,
                Verified = w.Verified,
                DistributorAssignedAt = w.DistributorAssignedAt,
                WarrantyInvoiceNo = w.WarrantyInvoiceNo,
                StartDate = w.StartDate,
                EndDate = w.EndDate,
                ProductId = w.ProductId,
                Discrepants = w.Discrepants,
                PurchaseDate = w.PurchaseDate,
                EndorsementNo = w.EndorsementNo,
                Seller = w.Seller,
                CouponCode = w.CouponCode,
                CancellationAt = w.CancellationAt,
                CancellationDoneBy = w.CancellationDoneBy,
                ScratchCode = w.ScratchCode,
                KitCoverage = w.KitCoverage,
                OemId = w.OemId,
                BrandWarrantyDuration = w.BrandWarrantyDuration,
                CancellationReason = w.CancellationReason,
                Type = w.Type,
                Insured = w.Insured,
                CancellationRole = w.CancellationRole
            }).ToListAsync();

            return Ok(new
            {
                status = 200,
                message = "Warranty Statuses",
                data = warranty
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
