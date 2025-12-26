namespace MSSolutions.DTOs
{
    public class ProductImageDto
    {
        public int Id { get; set; }
		public int ProductId { get; set; }
		public List<IFormFile>? Images { get; set; } = new();
    }

    public class ProductImages
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public string FileName { get; set; }
        public byte[] Image { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
