namespace KabElectroSolutions.DTOs
{
    public class EstimationSummaryResponseDto
    {
        public List<EstimationDetailResponseDto> Items { get; set; } = new();
        public decimal GrandTotal { get; set; }
        public List<string> Images { get; set; } = new();
    }
}
