namespace MSSolutions.DTOs
{
    public class ProductResponseDTO
    {
        public List<ProductDTO> Data { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }

    }
}
