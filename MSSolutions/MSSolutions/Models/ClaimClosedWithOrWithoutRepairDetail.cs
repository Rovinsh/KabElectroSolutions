namespace MSSolutions.Models
{
    public class ClaimClosedWithOrWithoutRepairDetail
    {
        public int Id { get; set; }

        public int ClaimId { get; set; }

        public string ClaimType { get; set; } = string.Empty;

        public string Remarks { get; set; } = string.Empty;

        public string JobSheetFileName { get; set; } = string.Empty;
        public byte[] JobSheetImage { get; set; } = Array.Empty<byte>();

        public string? AdditionalFileName { get; set; }
        public byte[]? AdditionalImage { get; set; }

        public string CustomerSatisfactionFileName { get; set; } = string.Empty;
        public byte[] CustomerSatisfactionImage { get; set; } = Array.Empty<byte>();

        public int? CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
