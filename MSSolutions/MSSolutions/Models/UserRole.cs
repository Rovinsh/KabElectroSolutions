namespace MSSolutions.Models
{
    public class UserRole
    {
        public int UserId { get; set; }         // Foreign key to Users table
        public int RoleId { get; set; }         // Role identifier
        public User User { get; set; }
        public Role Role { get; set; }
    }
}
