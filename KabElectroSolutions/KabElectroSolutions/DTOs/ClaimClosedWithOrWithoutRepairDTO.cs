namespace KabElectroSolutions.DTOs
{
    public class ClaimClosedWithOrWithoutRepairDTO
    {
        public int Id { get; set; }
        public int ClaimId { get; set; }
        public string ClaimType { get; set; } = string.Empty;
        public string Remarks { get; set; } = string.Empty;

        public string JobSheetFileName { get; set; } = string.Empty;
        public string? JobSheetImageBase64 { get; set; } = string.Empty;

        public string? AdditionalFileName { get; set; }
        public string? AdditionalImageBase64 { get; set; }

        public string CustomerSatisfactionFileName { get; set; } = string.Empty;
        public string? CustomerSatisfactionImageBase64 { get; set; } = string.Empty;

        public int? CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
