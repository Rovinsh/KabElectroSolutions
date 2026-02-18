namespace MSSolutions.DTOs
{
    public class OrderDTO
    {
        public int Id { get; set; }
        public string OrderCode { get; set; }
        public string UserName { get; set; }
        public int UserId { get; set; }
        public decimal SubTotal { get; set; }
        public decimal TaxAmount { get; set; }
        public decimal DiscountAmount { get; set; }
        public decimal GrandTotal { get; set; }
        public decimal ReceiveAmount { get; set; }
        public string PaymentStatus { get; set; }
        public string OrderStatus { get; set; }
        public string? CouponCode { get; set; }
        public decimal CouponAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public DateTime OrderDate { get; set; }
        public string RazorpayOrderId { get; set; }
        public string RazorpaySignature { get; set; }
        public string RazorpayPaymentId { get; set; }
        public List<OrderDetailDTO> OrderDetails { get; set; }
        public BillingAddressDTO BillingAddress { get; set; }
        public ShippingAddressDTO ShippingAddress { get; set; }
    }

}
public class OrderDetailDTO
{
    public int Id { get; set; }
    public int ProductId { get; set; }
    public int BrandId { get; set; }
    public int CategoryId { get; set; }
    public string? ProductName { get; set; }
    public string? CategoryName { get; set; }
    public string? BrandName { get; set; }
    public decimal UnitPrice { get; set; }
    public int Quantity { get; set; }
    public decimal Discount { get; set; }
    public decimal TotalAmount { get; set; }
}

public class BillingAddressDTO
{
    public string? FullName { get; set; }
    public string? Phone { get; set; }
    public string? AddressLine { get; set; }
    public string? City { get; set; }
    public string? State { get; set; }
    public string? Pincode { get; set; }
}
public class ShippingAddressDTO
{
    public string? FullName { get; set; }
    public string? Phone { get; set; }
    public string? AddressLine { get; set; }
    public string? City { get; set; }
    public string? State { get; set; }
    public string? Pincode { get; set; }
    public string? Country { get; set; }
}