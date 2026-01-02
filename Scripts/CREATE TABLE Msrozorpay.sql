CREATE TABLE MsRazorpayPayments (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    RazorpayOrderId NVARCHAR(100) NOT NULL,
    RazorpayPaymentId NVARCHAR(100),
    RazorpaySignature NVARCHAR(255),
    Status NVARCHAR(20),
    Amount DECIMAL(10,2),
    Currency NVARCHAR(10) DEFAULT 'INR',
    CreatedAt DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT FK_MsRazorpay_MsOrder FOREIGN KEY (OrderId) REFERENCES MsOrders(Id) ON DELETE CASCADE
);