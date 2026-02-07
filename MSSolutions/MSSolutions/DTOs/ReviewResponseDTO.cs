namespace MSSolutions.DTOs
{
    public class ReviewResponseDTO
    {
        public List<ReviewDTO> Data { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }

    }
}
