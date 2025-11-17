namespace KabElectroSolutions.Models
{
    public class Reports
    {
        public int Id { get; set; }
        public string DateRange { get; set; }
        public string FileName { get; set; }
        public DateOnly CreatedDate { get; set; }
        public DateOnly StartDate { get; set; }
        public DateOnly EndDate { get; set; }
        public string TimeStamp { get; set; }
        public string Status { get; set; }
    }
}