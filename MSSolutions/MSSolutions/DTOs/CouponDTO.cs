namespace MSSolutions.DTOs
{
   public class CouponDto
{
    public int Id { get; set; }
    public string CouponTitle { get; set; } = string.Empty;
    public string CouponCode { get; set; } = string.Empty;
    public string DiscountType { get; set; } = string.Empty;
    public decimal CouponAmount { get; set; }
    public DateTime CouponStartDate { get; set; }
    public DateTime CouponEndDate { get; set; }
    public string? Description { get; set; }
    public string? Remark { get; set; }
    public bool IsExpired { get; set; }
    public bool IsFirstOrder { get; set; }
    public bool IsAllProducts { get; set; }
    public bool IsDisable { get; set; }
}
}
