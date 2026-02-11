namespace MSSolutions.DTOs
{
   public class TopSellingProductDTO
{
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public string BrandName { get; set; }
    public string CategoryName { get; set; }
    public int OrderCount { get; set; }     // ✅ number of orders
    public int TotalQuantity { get; set; }  // ✅ total qty sold
    public decimal TotalAmount { get; set; } // ✅ revenue
}

}
