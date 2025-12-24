namespace MSSolutions.Models
{
    public class AppointmentRequest
    {
        public DateOnly? AppointmentDate { get; set; }
        public TimeOnly? AppointmentTime { get; set; }
        public string Remarks { get; set; } = string.Empty;
        public string PendingReason { get; set; } = string.Empty;
        public string VisitPendingReason { get; set; } = string.Empty;
    }
}
