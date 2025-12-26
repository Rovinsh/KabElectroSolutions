namespace MSSolutions.Models
{
    public class MsGst
    {
        public int Id { get; set; }
        public required string GstValue { get; set; }
        public string? Description { get; set; }
        public bool IsDisable { get; set; }
    }
}