namespace MSSolutions.DTOs
{
    public class ClaimCloseRequestDto
    {
        public int ClaimId { get; set; }
        public string ClaimType { get; set; } = string.Empty;
        public string Remarks { get; set; } = string.Empty;

        public IFormFile JobSheet { get; set; } = default!;
        public IFormFile? Additional { get; set; }
        public IFormFile CustomerSatisfaction { get; set; } = default!;
    }
}
