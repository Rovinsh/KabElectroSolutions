namespace MSSolutions.Models
{
    public class MsRole
    {
        public int RoleId { get; set; }          // Primary key, identity
        public string RoleName { get; set; } = string.Empty;
        public ICollection<MsUserRole> UserRoles { get; set; } = new List<MsUserRole>();
    }
}
