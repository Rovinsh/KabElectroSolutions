namespace KabElectroSolutions.Models
{
    public class AuditLog
    {
        public int Id { get; set; }
        public string EntityName { get; set; } = string.Empty;
        public int EntityRecordId { get; set; }

        public string Status { get; set; } = string.Empty;
        public string PerformerName { get; set; } = string.Empty;
        public string Designation { get; set; } = string.Empty;
        public DateTime Timestamp { get; set; } = DateTime.UtcNow;
        public string? Remarks { get; set; }
    }
}
