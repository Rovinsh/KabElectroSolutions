namespace MSSolutions.Models
{
    public class Brands
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public required string BrandName { get; set; }
        public string? Description { get; set; }
        public bool IsDisable { get; set; }
    }
}