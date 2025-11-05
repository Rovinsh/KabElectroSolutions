using KabElectroSolutions.Models;
using Microsoft.EntityFrameworkCore;

namespace KabElectroSolutions.Data
{
    public class KabElectroSolutionsDbContext : DbContext
    {
        public KabElectroSolutionsDbContext(DbContextOptions<KabElectroSolutionsDbContext> options) : base(options) { }

        public DbSet<Status> Statuses => Set<Status>();
        public DbSet<SubStatus> SubStatuses => Set<SubStatus>();
        public DbSet<User> Users => Set<User>();
        public DbSet<Address> Addresses => Set<Address>();
        public DbSet<UserRole> UserRoles => Set<UserRole>();
        public DbSet<Role> Roles => Set<Role>();
        public DbSet<UserPrivilege> UserPrivileges => Set<UserPrivilege>();
        //public DbSet<Location> Locations => Set<Location>();

        public DbSet<State> Locations { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Pincode> Pincodes { get; set; }
        public DbSet<WarrantyStatus> WarrantyStatuses { get; set; }
        public DbSet<WarrantyType> WarrantyTypes { get; set; }
        public DbSet<Claim> Claims { get; set; }
        public DbSet<Brands> Brands { get; set; }
        public DbSet<Categories> Categories { get; set; }
        public DbSet<Plans> Plans { get; set; }
        public DbSet<Warranties> Warranties { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // 👇 Place your configuration here
            modelBuilder.Entity<User>()
                .HasOne(u => u.Address)
                .WithMany()
                .HasForeignKey(u => u.AddressId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<User>()
                .HasOne(u => u.BusinessAddress)
                .WithMany()
                .HasForeignKey(u => u.BusinessAddressId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<UserPrivilege>()
    .HasKey(up => new { up.UserId, up.PrivilegeId });

            modelBuilder.Entity<UserRole>()
    .HasKey(ur => new { ur.UserId, ur.RoleId });

            modelBuilder.Entity<UserRole>()
                .HasOne(ur => ur.User)
                .WithMany(u => u.UserRoles)
                .HasForeignKey(ur => ur.UserId)
                .HasPrincipalKey(u => u.Id); ;

            modelBuilder.Entity<UserRole>()
                .HasOne(ur => ur.Role)
                .WithMany(r => r.UserRoles)
                .HasForeignKey(ur => ur.RoleId);

            modelBuilder.Entity<Pincode>()
            .Property(p => p.PincodeValue)
            .HasColumnName("Pincode");

            modelBuilder.Entity<State>().ToTable("Locations");

            modelBuilder.Entity<Claim>().ToTable("Claims");

            // Add any other entity configurations here...
        }
    } 
}