namespace KabElectroSolutions.DTOs
{
    public class ClaimCustomerVisitImagesResponse
    {
        public int ClaimId { get; set; }

        public string? EstimationImage { get; set; }
        public string? ProductSerialNumber { get; set; }
        public string? ProductImage { get; set; }
        public string? ProductDefectImage { get; set; }

        public List<string> Others { get; set; } = new();

        public string? Remarks { get; set; }
        public string CreatedBy { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }
    }
}
