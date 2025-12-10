namespace KabElectroSolutions.DTOs
{
    public class ShareEstimationDetailDto
    {
        public int Id { get; set; }
        public int ClaimId { get; set; }
        public string Observation { get; set; }
        public string ClaimType { get; set; }
        public string Symptom { get; set; }
        public string Remarks { get; set; }
        public DateTime CreatedAt { get; set; }

        public List<EstimationItem> Items { get; set; } = new List<EstimationItem>();
        public List<IFormFile> Images { get; set; } = new List<IFormFile>();
    }

    public class EstimationItem
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Material { get; set; }
        public int HSNCode { get; set; }
        public decimal Price { get; set; }
        public decimal TaxPercent { get; set; }

        public int EstimationDetailId { get; set; }

    }

    public class EstimationImages
    {
        public int Id { get; set; }
        public int ClaimId { get; set; }
        public string FileName { get; set; }
        public byte[] Image { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
