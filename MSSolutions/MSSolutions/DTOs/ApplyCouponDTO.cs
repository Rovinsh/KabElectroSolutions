namespace MSSolutions.DTOs
{
    public class ApplyCoupon
    {
    public string CouponCode { get; set; } = string.Empty;
    public decimal CartTotal { get; set; }
	public List<int> ProductIds { get; set; } = new();
    }
	public class CouponResponses
	{
	public int CouponId { get; set; }
    public string CouponCode { get; set; } = string.Empty;
    public decimal DiscountAmount { get; set; }
    public decimal FinalAmount { get; set; }
    public string DiscountType { get; set; } = string.Empty;
	}
}
