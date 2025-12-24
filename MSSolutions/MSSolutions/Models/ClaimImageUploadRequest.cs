namespace MSSolutions.Models
{
    public class ClaimImageUploadRequest
    {
        public int ClaimId { get; set; }
        public IFormFile? EstimationImage { get; set; }
        public IFormFile? ProductSerialNumber { get; set; }
        public IFormFile? ProductImage { get; set; }
        public IFormFile? ProductDefectImage { get; set; }
        public List<IFormFile>? OthersImages { get; set; }
        public string? Remarks { get; set; } = string.Empty;
        public string CreatedBy { get; set; } = string.Empty;
    }
}
