INSERT INTO MsOrderDetails
(
    OrderId,
    ProductId,
    Quantity,
    UnitPrice,
    Discount,
    TotalAmount
)
VALUES
(
    1,        -- OrderId (must exist in MsOrders)
    5,        -- ProductId (must exist in MsProducts)
    2,        -- Quantity
    500.00,   -- UnitPrice
    50.00,    -- Discount
    950.00    -- TotalAmount = (2 * 500) - 50
);
