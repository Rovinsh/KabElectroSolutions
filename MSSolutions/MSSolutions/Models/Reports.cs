namespace MSSolutions.Models
{
    public class Reports
    {
        public int Id { get; set; }
        public string DateRange { get; set; }
        public string FileName { get; set; }
        public DateOnly CreatedDate { get; set; }
        public DateOnly StartDate { get; set; }
        public string CreatedByName { get; set; }
        public int CreatedById { get; set; }       
        public DateOnly EndDate { get; set; }
        public string TimeStamp { get; set; }
        public string Status { get; set; }
    }

    public class ReportsFilter
    {
        public string ReportType { get; set; }
        public string ReportName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        
    }
}