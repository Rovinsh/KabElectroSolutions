using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSSolutions.Models
{

    public class MsUser
    {
        [Key]
        public int Id { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string? Image { get; set; }
        [NotMapped]
        public int? AddressId { get; set; }
        public Address Address { get; set; }
        public int Business { get; set; }
        public string BusinessPhone { get; set; }
        public string BusinessEmail { get; set; }
        public string Businessname { get; set; }
        public int Businessrole { get; set; }
        public string BusinessGst { get; set; }
        public string BusinessPan { get; set; }
        [NotMapped]
        public int? BusinessAddressId { get; set; }
        public Address BusinessAddress { get; set; }
        public string? Empid { get; set; }
        [NotMapped]
        public List<int?> Roles { get; set; }
        //public Dictionary<string, string> RolesNameMap { get; set; }
        [NotMapped]
        public List<Role>? RolesNameMap { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string? Manager { get; set; }
        public string? Authtoken { get; set; }
        [NotMapped]
        public List<int?> Privileges { get; set; }
        public string? ExecutiveId { get; set; }
        public string? ChannelName { get; set; }
        public string BusinessroleName { get; set; }
        public bool IsActiveBusiness { get; set; }
        public string PasswordHash { get; set; } = string.Empty;
        public ICollection<UserRole> UserRoles { get; set; }
        public int? PartnerId { get; set; }
        public bool IsPartner { get; set; }
    }

    public class ApiResponse
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public User Data { get; set; }
    }
}
