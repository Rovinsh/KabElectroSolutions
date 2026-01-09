namespace MSSolutions.DTOs
{
     public class WishlistDto
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public string ImageUrl { get; set; } = string.Empty;
    }
	public class AddWishlistRequest
{
    public int ProductId { get; set; }
}
}
