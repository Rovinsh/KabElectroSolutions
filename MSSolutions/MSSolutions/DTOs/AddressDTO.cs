namespace MSSolutions.DTOs
{
   public class AddressDto
{
    public int Id { get; set; }
    public string? FullName { get; set; }
    public string? Phone { get; set; }
    public string AddressLine { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public int? Pincode { get; set; }
    public int CityId { get; set; }
    public int StateId { get; set; }
    public int PincodeId { get; set; }
    public bool IsDefault { get; set; }
}
}
