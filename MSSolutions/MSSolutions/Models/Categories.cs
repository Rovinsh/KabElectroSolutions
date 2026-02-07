namespace MSSolutions.Models
{
    public class MsCategories
    {
        public int Id { get; set; }
        public required string CatName { get; set; }
        public string? Description { get; set; }
        public string? CatUrl { get; set; }
        public bool IsDisable { get; set; }
    }
}