namespace MSSolutions.DTOs
{
    public class OrderResponseDTO
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public List<OrderDTO> Data { get; set; }
    }

}
