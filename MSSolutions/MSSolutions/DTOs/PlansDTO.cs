namespace MSSolutions.DTOs
{
    public class PlansDTO
    {
        public int Id { get; set; }
        public int CatId { get; set; }
        public int BrandId { get; set; }
        public string CategoryName { get; set; }
        public string BrandName { get; set; }
        public required string PlanName { get; set; }
        public string? Description { get; set; }
        public string? Remark { get; set; }
        public bool IsDisable { get; set; }

    }
}
