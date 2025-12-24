namespace MSSolutions.DTOs
{
    public class EstimationDetailDto
    {
        public int ClaimId { get; set; }  // mandatory
        public string ClaimType { get; set; } = string.Empty;
        public string Observation { get; set; } = string.Empty;
        public string Symptom { get; set; } = string.Empty;

        public string Type { get; set; } = string.Empty;
        public string Material { get; set; } = string.Empty;
        public string HSNCode { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public decimal TaxPercent { get; set; }
        public string? Remarks { get; set; }

        public List<IFormFile>? Images { get; set; } = new();
    }
}
