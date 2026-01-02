INSERT INTO MsOrderShippingAddress
(
    OrderId,
    FullName,
    Phone,
    AddressLine,
    City,
    State,
    Pincode,
    Country
)
VALUES
(
    1,                       -- OrderId (must exist in MsOrders)
    'John Doe',
    '9876543210',
    '123 MG Road, Sector 5',
    'Bangalore',
    'Karnataka',
    '560001',
    'India'
);
