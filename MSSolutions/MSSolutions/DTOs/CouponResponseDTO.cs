namespace MSSolutions.DTOs
{
  public class CouponResponse
{
    public int Status { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<CouponDto> Data { get; set; } = new();
}
}
