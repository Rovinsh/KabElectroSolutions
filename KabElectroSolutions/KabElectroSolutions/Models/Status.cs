using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KabElectroSolutions.Models
{
    [Table("Status")]
    public class Status
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;       
        public bool Active { get; set; }

        public List<SubStatus> Substatus { get; set; } = new();
    }
}
