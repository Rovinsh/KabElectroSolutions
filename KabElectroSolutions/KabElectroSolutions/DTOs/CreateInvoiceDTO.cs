using System.ComponentModel.DataAnnotations;

namespace KabElectroSolutions.DTOs
{
    public class CreateInvoiceDTO
    {
        [Required]
        public int ClaimId { get; set; }

        [Required]
        public DateOnly InvoiceDate { get; set; }

        [Required]
        public string InvoiceNumber { get; set; } = string.Empty;

        [Required]
        public decimal BillAmountBeforeTax { get; set; }

        [Required]
        public decimal TaxAmount { get; set; }

        [Required]
        public decimal TotalBillAmount { get; set; }

        public string? Remarks { get; set; }

        [Required]
        public IFormFile InvoiceImage { get; set; } = null!;

        public bool IsRejected { get; set; } = false;
    }
}
