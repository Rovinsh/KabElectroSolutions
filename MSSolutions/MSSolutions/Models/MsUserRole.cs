namespace MSSolutions.Models
{
    public class MsUserRole
    {
        public int UserId { get; set; }         // Foreign key to Users table
        public int RoleId { get; set; }         // Role identifier
        public MsUser MsUser { get; set; }
        public MsRole MsRole { get; set; }
    }
}
