using System.ComponentModel.DataAnnotations;

namespace KabElectroSolutions.Models
{
    public class Location
    {
        [Key]
        public int LocationID { get; set; }
        
        public string LocationName { get; set; }
    }
}
