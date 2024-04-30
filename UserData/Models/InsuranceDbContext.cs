using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace UserData.Models;

public partial class InsuranceDbContext : DbContext
{
    public InsuranceDbContext()
    {
    }

    public InsuranceDbContext(DbContextOptions<InsuranceDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Login> Logins { get; set; }

    public virtual DbSet<PaymentDetail> PaymentDetails { get; set; }

    public virtual DbSet<Policy> Policies { get; set; }

    public virtual DbSet<UserDetail> UserDetails { get; set; }

  
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Login>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Login__1788CCAC3F4CE238");

            entity.ToTable("Login");

            entity.HasIndex(e => e.Username, "UQ__Login__536C85E4F517FE1D").IsUnique();

            entity.Property(e => e.UserId)
                .ValueGeneratedNever()
                .HasColumnName("UserID");
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<PaymentDetail>(entity =>
        {
            entity.HasKey(e => e.PaymentDetailId).HasName("PK__PaymentD__7F4E340FDE24B93B");

            entity.HasIndex(e => e.CardNumber, "UQ__PaymentD__A4E9FFE977EA25F9").IsUnique();

            entity.Property(e => e.CardNumber).HasMaxLength(16);
            entity.Property(e => e.CardOwnerName).HasMaxLength(100);
            entity.Property(e => e.ExpirationDate).HasMaxLength(5);
            entity.Property(e => e.SecurityCode).HasMaxLength(3);
        });

        modelBuilder.Entity<Policy>(entity =>
        {
            entity.HasKey(e => e.PolicyId).HasName("PK__Policy__2E133944FACE9CB1");

            entity.ToTable("Policy");

            entity.HasIndex(e => e.PolicyNumber, "UQ__Policy__46DA015702D11893").IsUnique();

            entity.Property(e => e.PolicyId)
                .ValueGeneratedNever()
                .HasColumnName("PolicyID");
            entity.Property(e => e.EndDate).HasColumnType("date");
            entity.Property(e => e.InsuranceCompany)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PolicyNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PolicyType)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PremiumAmount).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.StartDate).HasColumnType("date");
        });

        modelBuilder.Entity<UserDetail>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.Address)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.FirstName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LastName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.PolicyId).HasColumnName("PolicyID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Policy).WithMany()
                .HasForeignKey(d => d.PolicyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__UserDetai__Polic__1332DBDC");

            entity.HasOne(d => d.User).WithMany()
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__UserDetai__UserI__14270015");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
