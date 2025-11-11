namespace KabElectroSolutions.DTOs
{
    public class ReportsDTO
    {
        public int Id { get; set; }
        public string TimeStamp { get; set; }
        public string? ReportType { get; set; }
        public DateOnly? CreatedDate { get; set; }
        public required string FileName { get; set; }
        public required string DateRange { get; set; }
        public string? Link { get; set; }
        public bool Status { get; set; }

    }
}
