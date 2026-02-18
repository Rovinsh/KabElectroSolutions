using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSSolutions.Models
{

public class MsOrders
{
    [Key]
    public int Id { get; set; }
    public string OrderCode { get; set; }
    public int UserId { get; set; }
    public decimal SubTotal { get; set; }
    public decimal TaxAmount { get; set; }
    public decimal DiscountAmount { get; set; }
    public decimal GrandTotal { get; set; }
    public decimal ReceiveAmount { get; set; }
    public string PaymentStatus { get; set; } = "Pending";
    public string OrderStatus { get; set; } = "Pending";
    public string? CouponCode { get; set; }
    public decimal CouponAmount { get; set; }
    public string? RazorpayOrderId { get; set; }
    public string? MerchantTransactionId { get; set; }       
    public string? RazorpayPaymentId { get; set; }
    public string? RazorpaySignature { get; set; }
    public string? PaymentResponse { get; set; }   
    public DateTime OrderDate { get; set; } = DateTime.UtcNow;
    public DateTime PaymentDate { get; set; } = DateTime.UtcNow;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public int ShippingAddressId { get; set; }
    public int BillingAddressId { get; set; }
    public ICollection<MsOrderDetails> OrderDetails { get; set; }
    public MsOrderBillingAddress BillingAddress { get; set; }
    public MsOrderShippingAddress ShippingAddress { get; set; }
    }
public class MsOrderDetails
    {
    [Key]
    public int Id { get; set; }
    public int OrderId { get; set; }
    public int ProductId { get; set; }
    public string? ProductName { get; set; }
    public int CategoryId { get; set; }
    public string? CategoryName { get; set; }
    public int BrandId { get; set; }
    public string? BrandName { get; set; }
    public decimal UnitPrice { get; set; }
    public int Quantity { get; set; }
    public decimal Discount { get; set; }
    public decimal TotalAmount { get; set; }
}
public class MsOrderBillingAddress
{
    [Key]
    public int Id { get; set; }
    public int OrderId { get; set; }
    public string? FullName { get; set; }
    public string? Phone { get; set; }
    public string? AddressLine { get; set; }
    public string? City { get; set; }
    public string? State { get; set; }
    public string? Pincode { get; set; }
}
public class MsOrderShippingAddress
{
    [Key]
    public int Id { get; set; }
    public int OrderId { get; set; }
    public string? FullName { get; set; }
    public string? Phone { get; set; }
    public string? AddressLine { get; set; }
    public string? City { get; set; }
    public string? State { get; set; }
    public string? Pincode { get; set; }
    public string? Country { get; set; }
}

}
