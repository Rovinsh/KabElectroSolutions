CREATE TABLE MsOrders (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    OrderCode NVARCHAR(30) NOT NULL UNIQUE,     -- public order id (ORD-20251226-0001)
    UserId INT NOT NULL,
    SubTotal DECIMAL(10,2) NOT NULL,
    TaxAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
    ShippingAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
    DiscountAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
    GrandTotal DECIMAL(10,2) NOT NULL,
    ReceiveAmount DECIMAL(10,2) NOT NULL,
    PaymentStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending', -- Pending, Paid, Failed
    OrderStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending',   -- Pending, Confirmed, Shipped, Delivered
    CouponCode NVARCHAR(100) NULL,
    RazorpayOrderId NVARCHAR(100) NULL,
    RazorpayPaymentId NVARCHAR(100) NULL,
    RazorpaySignature NVARCHAR(255) NULL,
    OrderDate DATETIME2 NOT NULL DEFAULT GETDATE(),
    PaymentDate DATETIME2 NOT NULL DEFAULT GETDATE(),
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_MsOrders_MsUser FOREIGN KEY (UserId) REFERENCES MsUsers(Id)
);