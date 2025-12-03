namespace KabElectroSolutions.Models
{
    public class ClaimImage
    {
        public int Id { get; set; }
        public int ClaimId { get; set; }
        public string ImageType { get; set; } = string.Empty;
        public byte[] ImageData { get; set; } = default!;
        public string? Remarks { get; set; }
        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; } = string.Empty;
    }
}
