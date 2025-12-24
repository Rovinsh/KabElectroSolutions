namespace KabElectroSolutions.DTOs
{
    public class InvoiceDetailDto
    {
        public int Id { get; set; }
        public int ClaimId { get; set; }

        public DateOnly InvoiceDate { get; set; }
        public string InvoiceNumber { get; set; } = string.Empty;

        public decimal BillAmountBeforeTax { get; set; }
        public decimal TaxAmount { get; set; }
        public decimal TotalBillAmount { get; set; }

        public string? Remarks { get; set; }

        public string InvoiceFileName { get; set; } = string.Empty;
        public string? InvoiceImageBase64 { get; set; } = string.Empty;

        public bool IsRejected { get; set; }

        public int? CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
