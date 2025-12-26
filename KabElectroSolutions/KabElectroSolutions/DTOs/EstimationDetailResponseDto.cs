namespace KabElectroSolutions.DTOs
{
    public class EstimationDetailResponseDto
    {
        public int ClaimId { get; set; }
        public string Type { get; set; } = string.Empty;
        public string Material { get; set; } = string.Empty;
        public string HSNCode { get; set; } = string.Empty;

        public decimal Price { get; set; }
        public decimal TaxPercent { get; set; }
        public decimal TaxAmount { get; set; }
        public decimal TotalCost { get; set; }
    }
}
