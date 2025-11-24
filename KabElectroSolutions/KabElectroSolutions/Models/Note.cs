using System.ComponentModel.DataAnnotations;

namespace KabElectroSolutions.Models
{
    public class Note
    {
        [Key]
        public int Id { get; set; }                     // Identity
        public int ClaimId { get; set; }                // Foreign claim Id
        public string Message { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public DateTime TimeStamp { get; set; }
    }
}
