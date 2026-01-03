using System.ComponentModel.DataAnnotations;

namespace MSSolutions.Models
{
    public class MsAddress
    {
        [Key]
        public int Id { get; set; }
        public int UserId { get; set; }
        public string AddressLine { get; set; }
        //public int Location { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
        public int PincodeId { get; set; }
        public int Pincode { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public bool IsBusinessAddress { get; set; }
    }
}
