using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSSolutions.Models
{
    [Table("SubStatus")]
    public class SubStatus
    {
        [Key]
        public int SubStatusId { get; set; }
        public string Name { get; set; } = string.Empty;        
        public bool Active { get; set; }

        [ForeignKey("Status")]
        public int StatusId { get; set; }
        public Status? Status { get; set; }
    }
}
