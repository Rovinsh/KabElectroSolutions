namespace MSSolutions.Models
{
    public class MsProductImage
    {      // FK to EstimationDetails
        public int Id { get; set; }
        public int ProductId { get; set; }            // Claim ID for easy querying
        public byte[] Image { get; set; } = null!; // Binary image data
        public string FileName { get; set; } = string.Empty; // Original file name
        public DateTime CreatedAt { get; set; }
    }
}
