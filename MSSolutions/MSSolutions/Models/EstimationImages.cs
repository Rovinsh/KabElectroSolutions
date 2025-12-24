namespace MSSolutions.Models
{
    public class EstimationImages
    {
     public int Id { get; set; }
     public int ClaimId { get; set; }
     public string FileName { get; set; }
     public byte[] Image { get; set; }
     public DateTime CreatedAt { get; set; }
    }
}
