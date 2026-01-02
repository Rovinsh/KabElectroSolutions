DECLARE @NextNumber INT =
    ISNULL((SELECT MAX(Id) FROM MsOrders), 0) + 1;

DECLARE @OrderCode NVARCHAR(30) =
    'ORD-' + FORMAT(GETDATE(), 'yyyyMMdd') + '-' + RIGHT('000000' + CAST(@NextNumber AS VARCHAR), 6);

INSERT INTO MsOrders
(
    OrderCode,
    UserId,
    SubTotal,
    TaxAmount,
    ShippingAmount,
    DiscountAmount,
    GrandTotal,
    ReceiveAmount,
    PaymentStatus,
    OrderStatus,
    CouponCode,
    RazorpayOrderId,
    RazorpayPaymentId,
    RazorpaySignature,
    OrderDate,
    PaymentDate
)
VALUES
(
    @OrderCode,        -- OrderCode
    1,                 -- UserId (must exist in MsUsers)
    1000.00,           -- SubTotal
    180.00,            -- TaxAmount
    50.00,             -- ShippingAmount
    0.00,              -- DiscountAmount
    1230.00,           -- GrandTotal
    1230.00,           -- ReceiveAmount
    'Paid',            -- PaymentStatus
    'Confirmed',       -- OrderStatus
    'NEWYEAR2025',     -- CouponCode
    'order_Rzp_123',   -- RazorpayOrderId
    'pay_Rzp_456',     -- RazorpayPaymentId
    'sig_Rzp_789',     -- RazorpaySignature
    GETDATE(),         -- OrderDate
    GETDATE()          -- PaymentDate
);
