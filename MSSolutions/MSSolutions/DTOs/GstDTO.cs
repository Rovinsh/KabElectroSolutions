namespace MSSolutions.DTOs
{
    public class GstDTO
    {
        public int Id { get; set; }
        public required string GstValue { get; set; }
        public string? Description { get; set; }
        public bool IsDisable { get; set; }
    }
}
