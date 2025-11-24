using System.ComponentModel.DataAnnotations;

namespace KabElectroSolutions.Models
{

    public class Warranties
    {
        public int Id { get; set; }
        public long SerialNumber { get; set; }
        public string? ItemSerialNumber { get; set; }     
        public int? WarrantyTypeId { get; set; } 
        public string? WarrantyDisplayName { get; set; }
        public string? WarrantyCode { get; set; }
        public decimal WarrantyPrice { get; set; }
        public int WarrantyDuration { get; set; }
        public DateTime? WarrantyStartDate { get; set; }
        public DateTime? WarrantyEndDate { get; set; }
        public string? WarrantyInvoiceNo { get; set; }
        public DateTime? WarrantyPurchaseDate { get; set; }
        public string? WarrantySeller { get; set; }
        public string? WarrantyCouponCode { get; set; }
        public string? WarrantyScratchCode { get; set; }
        public string? WarrantyExtraInfo { get; set; }
        public string? WarrantyDescription { get; set; }
        public string? WarrantyCreatedBy { get; set; }
        public int? ProductId { get; set; }
        public string? CustomerName { get; set; }
        public string? CustomerMobileNo { get; set; }
        public string? CustomerEmail { get; set; }
        public string? CustomerAddress { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public int? PinCodeId { get; set; }
        public bool IsDisable { get; set; } 
    }

}