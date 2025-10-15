using System.ComponentModel.DataAnnotations;

namespace KabElectroSolutions.Models
{
    public class Warranties
    {
        public int Id { get; set; }
        public bool IsZappEnable { get; set; } = false;
        public int Status { get; set; }
        public long SerialNumber { get; set; }
        public int RegionId { get; set; }
        public string? DisplayName { get; set; }
        public int PolicyId { get; set; }
        public int RmId { get; set; }
        public string? ActivationCode { get; set; }
        public decimal Price { get; set; }
        public string? ExtraInfo { get; set; }
        public int Duration { get; set; }
        public string? ProductExtraImage { get; set; }
        public string? DiscrepancyReason { get; set; }
        public DateTime? StoreAssignedAt { get; set; }
        public bool Active { get; set; } = true;
        public bool Verified { get; set; } = true;
        public DateTime? DistributorAssignedAt { get; set; }
        public string? WarrantyInvoiceNo { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int ProductId { get; set; }
        public string? Discrepants { get; set; }
        public DateTime? PurchaseDate { get; set; }
        public string? EndorsementNo { get; set; }
        public string? Seller { get; set; }
        public string? CouponCode { get; set; }
        public DateTime? CancellationAt { get; set; }
        public string? CancellationDoneBy { get; set; }
        public string? ScratchCode { get; set; }
        public string? KitCoverage { get; set; }
        public int OemId { get; set; }
        public int BrandWarrantyDuration { get; set; }
        public string? CancellationReason { get; set; }

        [Required]
        public int Type { get; set; }

        public string? Insured { get; set; }
        public string? CancellationRole { get; set; }

    }
}