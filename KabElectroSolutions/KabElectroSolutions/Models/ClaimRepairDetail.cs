namespace KabElectroSolutions.Models
{
    public class ClaimRepairDetail
    {
        public int RepairId { get; set; }

        public int ClaimId { get; set; }

        public string RepairedAt { get; set; } = string.Empty;

        public string? Reason { get; set; }

        public string? Remarks { get; set; }

        public DateOnly ClosureDate { get; set; }

        public int RepairedByUserId { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }
}
