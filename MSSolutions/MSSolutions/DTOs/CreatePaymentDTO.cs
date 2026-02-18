namespace MSSolutions.DTOs
{
    public class CartItemDto
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
    public class CreatePaymentDto
    {
        public int ShippingAddressId { get; set; }

        public int BillingAddressId { get; set; }

        public bool UseShippingAsBilling { get; set; }

        public string? CouponCode { get; set; }

        public List<CartItemDto> CartItems { get; set; } = new();
    }
}
