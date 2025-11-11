namespace KabElectroSolutions.Models
{
    public class Reports
    {
        public int Id { get; set; }
        public string? DateRange { get; set; }
        public string? FileName { get; set; }
        public string? ReportType { get; set; }
        public DateOnly? CreatedDate { get; set; }
        public required string Link { get; set; }
        public string? TimeStamp { get; set; }
        public bool Status { get; set; }
    }
}