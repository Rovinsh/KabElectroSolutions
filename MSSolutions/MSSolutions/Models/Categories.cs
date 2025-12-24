namespace MSSolutions.Models
{
    public class Categories
    {
        public int Id { get; set; }
        public required string CatName { get; set; }
        public string? Description { get; set; }
        public bool IsDisable { get; set; }
    }
}