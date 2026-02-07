namespace KabElectroSolutions.DTOs
{
    public class ClaimImportDto
    {
        public string? CustomerName { get; set; }
        public string? CustomerPhone { get; set; }
        public string? CustomerEmail { get; set; }
        public string? Concern { get; set; }
        public string? ItemName { get; set; }
        public string? ItemBrand { get; set; }
        public string? ItemCategory { get; set; }
        public string? ItemSerialNumber { get; set; }
        public string? InvoiceNumber { get; set; }
        public DateOnly? InvoiceDate { get; set; }
        public decimal? ItemPrice { get; set; }
        public int? Pincode { get; set; }
        public string? CustomerCity { get; set; }
        public string? CustomerState { get; set; }
        public string? CustomerAddress { get; set; }
    }
}
