using System.ComponentModel.DataAnnotations;

namespace KabElectroSolutions.Models
{
    public class InvoiceDetail
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int ClaimId { get; set; }

        [Required]
        public DateOnly InvoiceDate { get; set; }

        [Required, MaxLength(50)]
        public string InvoiceNumber { get; set; } = string.Empty;

        [Required]
        public decimal BillAmountBeforeTax { get; set; }

        [Required]
        public decimal TaxAmount { get; set; }

        [Required]
        public decimal TotalBillAmount { get; set; }

        [MaxLength(100)]
        public string? Remarks { get; set; }

        [Required, MaxLength(255)]
        public string InvoiceFileName { get; set; } = string.Empty;

        [Required]
        public byte[] InvoiceImage { get; set; } = Array.Empty<byte>();

        public bool IsRejected { get; set; } = false;

        public int? CreatedBy { get; set; }

        public DateTime CreatedOn { get; set; } = DateTime.Now;
    }
}
