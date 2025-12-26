using MSSolutions.Models;
using Microsoft.EntityFrameworkCore;

namespace MSSolutions.Data
{
    public class MSSolutionsDbContext : DbContext
    {
        public MSSolutionsDbContext(DbContextOptions<MSSolutionsDbContext> options) : base(options) { }

        public DbSet<Status> Statuses => Set<Status>();
        public DbSet<SubStatus> SubStatuses => Set<SubStatus>();
        public DbSet<User> Users => Set<User>();
        public DbSet<MsUser> Msusers => Set<MsUser>();
        public DbSet<Address> Addresses => Set<Address>();
        public DbSet<MsAddress> MsAddresses => Set<MsAddress>();
        
        public DbSet<UserRole> UserRoles => Set<UserRole>();
        //public DbSet<MsUserRole> MsUserRoles => Set<MsUserRole>();
        public DbSet<Role> Roles => Set<Role>();
        //public DbSet<MsRole> MsRoles => Set<MsRole>();
        public DbSet<UserPrivilege> UserPrivileges => Set<UserPrivilege>();
        //public DbSet<MsUserPrivilege> MsUserPrivileges => Set<MsUserPrivilege>();
        //public DbSet<Location> Locations => Set<Location>();

        public DbSet<State> Locations { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Pincode> Pincodes { get; set; }
        public DbSet<WarrantyStatus> WarrantyStatuses { get; set; }
        public DbSet<WarrantyType> WarrantyTypes { get; set; }
        public DbSet<Claim> Claims { get; set; }
        public DbSet<MsBrands> MsBrands { get; set; }
        public DbSet<ServicePartners> ServicePartner { get; set; }       
        public DbSet<MsCategories> MsCategories { get; set; }
        public DbSet<Plans> Plans { get; set; }
        public DbSet<MsCoupons> MsCoupons { get; set; }
        public DbSet<MsGst> MsGst { get; set; }
        public DbSet<MsProductImage> ProductImages { get; set; } = null!;
        public DbSet<MsProducts> MsProducts { get; set; }
        public DbSet<Warranties> Warranties { get; set; }
        public DbSet<Reports> Reports { get; set; }        
        public DbSet<AuditLog> AuditLogs { get; set; }
        public DbSet<Note> Notes { get; set; }
        public DbSet<ClaimImage> ClaimImages { get; set; }
        public DbSet<EstimationDetail> EstimationDetails { get; set; } = null!;
        // DbSet for EstimationImages table
        public DbSet<EstimationImage> EstimationImages { get; set; } = null!;
        public DbSet<EstimationImages> ShareEstimationImages { get; set; } = null!;
        public DbSet<ClaimRepairDetail> ClaimRepairDetails => Set<ClaimRepairDetail>();
        public DbSet<ClaimClosedWithOrWithoutRepairDetail> ClaimClosedWithOrWithoutRepairDetails { get; set; }
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

            modelBuilder.Entity<ClaimImage>(entity =>
            {
                entity.ToTable("ClaimImages");

                entity.HasKey(e => e.Id);

                entity.Property(e => e.ClaimId).IsRequired();
                entity.Property(e => e.ImageType).HasMaxLength(50).IsRequired();
                entity.Property(e => e.ImageData).IsRequired();
                entity.Property(e => e.Remarks).HasMaxLength(500);
                entity.Property(e => e.CreatedAt).IsRequired();
                entity.Property(e => e.CreatedBy).HasMaxLength(100).IsRequired();
            });

            modelBuilder.Entity<ClaimRepairDetail>(entity =>
            {
                entity.ToTable("ClaimRepairDetails");
                entity.HasKey(e => e.RepairId);

                entity.Property(e => e.RepairedAt).HasMaxLength(100).IsRequired();
                entity.Property(e => e.Reason).HasMaxLength(100);
                entity.Property(e => e.Remarks).HasMaxLength(500);
                entity.Property(e => e.ClosureDate).HasColumnType("date");
                entity.Property(e => e.CreatedAt)
                      .HasDefaultValueSql("GETDATE()");
            });
        }
    }
    } 