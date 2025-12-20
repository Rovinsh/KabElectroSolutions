namespace KabElectroSolutions.DTOs
{
    public class CreateClaimRepairDto
    {
        public int ClaimId { get; set; }
        public string RepairedAt { get; set; } = string.Empty;
        public string? Reason { get; set; }
        public string? Remarks { get; set; }
        public DateOnly ClosureDate { get; set; }
    }
}
