namespace MSSolutions.Models
{
    public class City
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int LocationId { get; set; }
        public State Location { get; set; }
        public ICollection<Pincode> Pincodes { get; set; }
    }
}