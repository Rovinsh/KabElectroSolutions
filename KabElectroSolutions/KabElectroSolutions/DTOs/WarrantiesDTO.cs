using System.ComponentModel.DataAnnotations;

namespace KabElectroSolutions.DTOs
{
    public class WarrantiesDTO
    {
        public int Id { get; set; }
        public long SerialNumber { get; set; }
        public string? WarrantyType { get; set; }
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
        public string? ProductName { get; set; }
        public string? CustomerName { get; set; }
        public string? CustomerMobileNo { get; set; }
        public string? CustomerEmail { get; set; }
        public string? CustomerAddress { get; set; }
        public int? CustomerCityId { get; set; }
        public string? CustomerCityName { get; set; }
        public int? CustomerStateId { get; set; }
        public string? CustomerStateName { get; set; }
        public string? CustomerPinCode { get; set; }
        public bool IsDisable { get; set; }

    }
}
