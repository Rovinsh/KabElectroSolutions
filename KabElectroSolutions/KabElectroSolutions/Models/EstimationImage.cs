namespace KabElectroSolutions.Models
{
    public class EstimationImage
    {
        public int Id { get; set; }                 // Primary Key
        public int EstimationId { get; set; }       // FK to EstimationDetails
        public int ClaimId { get; set; }            // Claim ID for easy querying

        public EstimationDetail Estimation { get; set; } = null!; // Navigation property

        public byte[] Image { get; set; } = null!; // Binary image data
        public string FileName { get; set; } = string.Empty; // Original file name
        public DateTime CreatedAt { get; set; }
    }
}
