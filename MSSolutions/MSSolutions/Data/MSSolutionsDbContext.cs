using DocumentFormat.OpenXml.Spreadsheet;
using Microsoft.EntityFrameworkCore;
using MSSolutions.Models;

namespace MSSolutions.Data
{
    public class MSSolutionsDbContext : DbContext
    {
        public MSSolutionsDbContext(DbContextOptions<MSSolutionsDbContext> options) : base(options) { }
        public DbSet<MsUser> MsUsers => Set<MsUser>();
        public DbSet<MsOrders> MsOrders => Set<MsOrders>();
        public DbSet<MsOrderDetails> MsOrderDetails => Set<MsOrderDetails>();
        public DbSet<MsOrderBillingAddress> MsOrderBillingAddress => Set<MsOrderBillingAddress>(); 
        public DbSet<MsOrderShippingAddress> MsOrderShippingAddress => Set<MsOrderShippingAddress>();
        public DbSet<MsAddress> MsAddresses => Set<MsAddress>();
        public DbSet<MsUserRole> MsUserRoles => Set<MsUserRole>();
        public DbSet<MsRole> MsRoles => Set<MsRole>();
        public DbSet<MsUserPrivilege> MsUserPrivileges => Set<MsUserPrivilege>();
        public DbSet<State> Locations { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Pincode> Pincodes { get; set; }
        public DbSet<MsBrands> MsBrands { get; set; }     
        public DbSet<MsCategories> MsCategories { get; set; }
        public DbSet<Plans> Plans { get; set; }
        public DbSet<MsCoupons> MsCoupons { get; set; }
        public DbSet<MsGst> MsGst { get; set; }
        public DbSet<MsProductImage> MsProductImage { get; set; } = null!;
        public DbSet<MsProducts> MsProducts { get; set; }    
        public DbSet<AuditLog> AuditLogs { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // 👇 Place your configuration here
            modelBuilder.Entity<MsUser>()
                .HasOne(u => u.Address)
                .WithMany()
                .HasForeignKey(u => u.AddressId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<MsUser>()
                .HasOne(u => u.BusinessAddress)
                .WithMany()
                .HasForeignKey(u => u.BusinessAddressId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<MsUserPrivilege>()
    .HasKey(up => new { up.UserId, up.PrivilegeId });

            modelBuilder.Entity<MsUserRole>()
    .HasKey(ur => new { ur.UserId, ur.RoleId });

            modelBuilder.Entity<MsUserRole>()
                .HasOne(ur => ur.MsUser)
                .WithMany(u => u.UserRoles)
                .HasForeignKey(ur => ur.UserId)
                .HasPrincipalKey(u => u.Id); ;

            modelBuilder.Entity<MsUserRole>()
                .HasOne(ur => ur.MsRole)
                .WithMany(r => r.UserRoles)
                .HasForeignKey(ur => ur.RoleId);

            modelBuilder.Entity<Pincode>()
            .Property(p => p.PincodeValue)
            .HasColumnName("Pincode");

            modelBuilder.Entity<State>().ToTable("Locations");

            modelBuilder.Entity<MsOrderDetails>()
      .HasOne<MsOrders>()
      .WithMany(o => o.OrderDetails)
      .HasForeignKey(d => d.OrderId);

            modelBuilder.Entity<MsOrderBillingAddress>()
                .HasOne<MsOrders>()
                .WithOne(o => o.BillingAddress)
                .HasForeignKey<MsOrderBillingAddress>(b => b.OrderId);

            modelBuilder.Entity<MsOrderShippingAddress>()
                .HasOne<MsOrders>()
                .WithOne(o => o.ShippingAddress)
                .HasForeignKey<MsOrderShippingAddress>(s => s.OrderId);
        }
    }
    } 