namespace MSSolutions.Models
{
    public class MsProducts
    {
		public int Id { get; set; }
        public string ProductName { get; set; } = string.Empty;
        public string SKU { get; set; } = string.Empty;
        public string? Description { get; set; }
        public string? ShortDescription { get; set; }
        public string? WhentoPurchase { get; set; }
        public string? ProductCovered { get; set; }
        public string? NoOfDevicesCovered { get; set; }
        public string? ServicesPeriod { get; set; }
        public string? ServicesCoverFeature { get; set; }
        public string? ServicesAvilableFrom { get; set; }
        public string? ProductUrl { get; set; }       
        public decimal? DiscountPrice { get; set; }
        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public decimal BaseAmount { get; set; }
        public int GstId { get; set; }
        public decimal GstPercentage { get; set; }
        public decimal GstAmount { get; set; }
        public decimal WithGstAmount { get; set; }
        public int StockQty { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}