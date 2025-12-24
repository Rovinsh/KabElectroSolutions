namespace MSSolutions.Models
{
    public class UserPrivilege
    {
        public int UserId { get; set; }          // Foreign key to Users table
        public int PrivilegeId { get; set; }     // Privilege value (assumed to be from a predefined set)

        // Navigation property (optional)
        public User? User { get; set; }
        public UserPrivilege Privilege { get; set; }
    }
}
