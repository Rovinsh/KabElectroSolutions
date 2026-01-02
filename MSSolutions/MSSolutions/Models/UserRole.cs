namespace MSSolutions.Models
{
    public class UserRole
    {
        public int UserId { get; set; }         // Foreign key to Users table
        public int RoleId { get; set; }         // Role identifier
        public MsUser User { get; set; }
        public MsRole Role { get; set; }
    }
}
