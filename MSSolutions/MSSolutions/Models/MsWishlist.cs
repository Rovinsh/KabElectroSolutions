namespace MSSolutions.Models
{
    public class MsWishlist
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public int ProductId { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public MsUser User { get; set; } = null!;
    public MsProducts Product { get; set; } = null!;
    }
}