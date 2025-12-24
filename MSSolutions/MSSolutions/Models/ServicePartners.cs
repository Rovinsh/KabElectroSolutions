namespace MSSolutions.Models
{
    public class ServicePartners
    {
        public int Id { get; set; }
        public string ServicePartner { get; set; }     
        public int CityId { get; set; }
        public int StateId { get; set; }
        public int PinCodeId { get; set; }
        public string? Address { get; set; }
        public string Phone { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string? Pan { get; set; }
        public string? Gst { get; set; }
        public string? ExtraInfo { get; set; }
        public bool IsDisable { get; set; }
        public required string? Firstname { get; set; }
        public string? Lastname { get; set; }
    }
}