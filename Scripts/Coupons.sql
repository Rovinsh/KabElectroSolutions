CREATE TABLE MsCoupons (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CouponTitle NVARCHAR(150) NOT NULL,
    CouponCode NVARCHAR(50) NOT NULL,
    DiscountType NVARCHAR(20) NOT NULL,  -- percentage / fixed
    CouponAmount DECIMAL(10,2) NOT NULL,
    CouponStartDate DATETIME2 NOT NULL,
    CouponEndDate DATETIME2 NOT NULL,
    Description NVARCHAR(500) NULL,
    Remark NVARCHAR(500) NULL,
    IsExpired BIT NOT NULL DEFAULT 0,
    IsFirstOrder BIT NOT NULL DEFAULT 0,
    IsAllProducts BIT NOT NULL DEFAULT 0,
    IsDisable BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME2 NOT NULL DEFAULT GETDATE()
);

INSERT INTO MsCoupons
(
    CouponTitle,
    CouponCode,
    DiscountType,
    CouponAmount,
    CouponStartDate,
    CouponEndDate,
    Description,
    Remark,
    IsExpired,
    IsFirstOrder,
    IsAllProducts,
    IsDisable
)
ALTER TABLE MsCoupons
ADD CONSTRAINT UQ_MsCoupons_CouponCode UNIQUE (CouponCode);

VALUES
(
    'New Year Offer',
    'NEWYEAR2025',
    'percentage',
    10.00,
    '2025-01-01',
    '2025-01-31',
    '10% discount for New Year celebration',
    'Seasonal offer',
    0,
    0,
    1,
    1
),
(
    'First Order Bonus',
    'FIRST100',
    'fixed',
    100.00,
    '2025-01-01',
    '2025-12-31',
    'Flat ₹100 off on first order',
    'New user incentive',
    0,
    1,
    0,
    1
),
(
    'Summer Sale',
    'SUMMER15',
    'percentage',
    15.00,
    '2025-04-01',
    '2025-06-30',
    '15% off during summer sale',
    'Seasonal discount',
    0,
    0,
    1,
    1
),
(
    'Flash Sale',
    'FLASH50',
    'fixed',
    50.00,
    '2025-02-10',
    '2025-02-12',
    'Limited time ₹50 off',
    '2 day flash sale',
    0,
    0,
    1,
    1
);
