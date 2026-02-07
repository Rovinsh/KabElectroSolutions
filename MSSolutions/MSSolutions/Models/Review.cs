namespace MSSolutions.Models
{
    public class MsReview
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public required string Comment { get; set; }
        public required int Rating { get; set; }
        public DateOnly CurrentDate { get; set; }
    }
}