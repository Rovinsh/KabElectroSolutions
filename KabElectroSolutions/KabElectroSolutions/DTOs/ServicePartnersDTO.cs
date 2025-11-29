namespace KabElectroSolutions.DTOs
{
    public class ServicePartnersDTO
    {
        public int Id { get; set; }
        public required string ServicePartner { get; set; }
        public required string FirstName { get; set; }
        public string? LastName { get; set; }
        public int CityId { get; set; }
        public string? CityName { get; set; }
        public int StateId { get; set; }
        public string? StateName { get; set; }
        public int PinCodeId { get; set; }
        public int PinCode { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string? Pan { get; set; }
        public string? Gst { get; set; }
        public string? ExtraInfo { get; set; }
        public bool IsDisable { get; set; }

    }
}
