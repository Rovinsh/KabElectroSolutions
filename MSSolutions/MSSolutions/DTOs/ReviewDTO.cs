namespace MSSolutions.DTOs
{
    public class ReviewDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string? UserName { get; set; }
        public required int Rating { get; set; }
        public required string Comment { get; set; }
        public DateOnly CurrentDate { get; set; }

    }
}
