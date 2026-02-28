using MSSolutions.DTOs;

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
    public string? WhentoPurchase { get; set; }
    public string? ProductCovered { get; set; }
    public string? NoOfDevicesCovered { get; set; }
    public string? ServicesPeriod { get; set; }
    public string? ServicesCoverFeature { get; set; }
    public string? ServicesAvilableFrom { get; set; }
    public string? ProductUrl { get; set; }
    public string? CashlessService { get; set; }
    public string? AuthorizedServiceCentreRepairs { get; set; }
    public string? ClaimType { get; set; }
    public string? ServiceCancellationRefundPeriod { get; set; }
    public string? ExtendedHoursSupport { get; set; }
    public string? SupportCentreContactDetails { get; set; }
    public string? HowtoClaim { get; set; }
    public string? ServiceType { get; set; }
    public string? InstallationDemo { get; set; }
    public string? CustomerSupportEmail { get; set; }
    public string? RepairCostCovered { get; set; }
    public string? ServiceExcludes { get; set; }
    public string? ServiceIncludes { get; set; }
    public string? MarketerNameAddress { get; set; }
    public string? DocumentsRequired { get; set; }
    public string? CostCovered { get; set; }
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
public class HomeInitDTO
{
    public List<CategoriesDTO> Categories { get; set; }
    public List<ProductDTO> HomeProducts { get; set; }
}
public class HomeInitResponseDTO
{
    public int Status { get; set; }
    public string Message { get; set; }
    public HomeInitDTO Data { get; set; }
}

public class ProductListInitResponseDTO
{
    public List<CategoriesDTO> Categories { get; set; }
    public List<ProductDTO> HomeProducts { get; set; }

    public List<BrandsDTO> Brands { get; set; }
}
public class ProductListsInitResponseDTO
{
    public int Status { get; set; }
    public string Message { get; set; }
    public ProductListInitResponseDTO Data { get; set; }
}