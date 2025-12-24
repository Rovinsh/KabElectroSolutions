namespace MSSolutions.Models
{
    public class Pincode
    {
        public int Id { get; set; }
        public int PincodeValue { get; set; }
        public int CityId { get; set; }
        public City City { get; set; }
    }
}