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
  ALTER TABLE MsOrders
DROP COLUMN
    CouponId,
    ShippingAmount;
	    ALTER TABLE MsOrders
DROP CONSTRAINT FK_MsOrders_MsCoupons;

ALTER TABLE MsOrders
DROP CONSTRAINT DF__MsOrders__Shippi__57A801BA;
ALTER TABLE MsOrders
ADD 
    CouponId INT NULL,
    CouponAmount DECIMAL(10,2) NOT NULL DEFAULT 0;
ALTER TABLE MsOrders
ADD CONSTRAINT FK_MsOrders_MsCoupons
FOREIGN KEY (CouponId) REFERENCES MsCoupons(Id);
UPDATE MsOrders
SET 
    CouponId = 1,
    CouponAmount = 100
WHERE Id = 5;


ALTER TABLE MsOrders
ADD
    MerchantTransactionId NVARCHAR(100) NULL,
    PaymentResponse NVARCHAR(MAX) NULL,
	ShippingAddressId INT NULL,
    BillingAddressId INT NULL;

    ALTER TABLE MsOrders
ADD CONSTRAINT FK_MsOrders_ShippingAddress
FOREIGN KEY (ShippingAddressId)
REFERENCES MsAddresses(Id);

ALTER TABLE MsOrders
ADD CONSTRAINT FK_MsOrders_BillingAddress
FOREIGN KEY (BillingAddressId)
REFERENCES MsAddresses(Id);

