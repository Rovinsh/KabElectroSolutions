public class ProductDTO
{
    public int Id { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public string SKU { get; set; } = string.Empty;

    public int CategoryId { get; set; }
    public string CategoryName { get; set; } = string.Empty;

    public int BrandId { get; set; }
    public string BrandName { get; set; } = string.Empty;

    public decimal BaseAmount { get; set; }

    public string? Description { get; set; }
    public string? ShortDescription { get; set; }

    public decimal? DiscountPrice { get; set; }

    public int? GstId { get; set; }
    public decimal? GstPercentage { get; set; }
    public decimal? GstAmount { get; set; }
    public decimal? WithGstAmount { get; set; }

    public int StockQty { get; set; }
    public bool IsActive { get; set; }
    public List<ProductImagesDto> Images { get; set; } = new();
}
public class ProductImagesDto
{
    public int Id { get; set; }
    public int ProductId { get; set; }
    public string FileName { get; set; } = "";
    public string ImageBase64 { get; set; } = "";
}