using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TeeApp.Data.Entities;

namespace TeeApp.Data.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("Users");
            builder.Property(x => x.LastName).HasMaxLength(50).IsRequired();
            builder.Property(x => x.FirstName).HasMaxLength(50).IsRequired();
            builder.Ignore(x => x.FullName);

            builder
                .HasMany(x => x.Followers)
                .WithMany(x => x.Following)
                .UsingEntity(
                    join =>
                    {
                        join.ToTable("Followers");
                    }
                );
            builder
                .HasMany(x => x.BlockedUsers)
                .WithMany(x => x.BlockedByUsers)
                .UsingEntity(
                    join =>
                    {
                        join.ToTable("BlockedUsers");
                    }
                );
        }
    }
}