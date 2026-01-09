namespace MSSolutions.DTOs
{
    public class WishlistListResponseDto
    {
		public List<WishlistDto> Data { get; set; } = new();
        public int Status { get; set; }
        public string Message { get; set; }

    }
    public class WishlistListsResponseDto
    {
        public List<AddWishlistRequest> Data { get; set; } = new();
        public int Status { get; set; }
        public string Message { get; set; }

    }
}
