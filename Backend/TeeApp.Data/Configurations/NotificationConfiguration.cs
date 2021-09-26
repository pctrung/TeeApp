using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TeeApp.Data.Entities;

namespace TeeApp.Data.Configurations
{
    public class NotificationConfiguration : IEntityTypeConfiguration<Notification>
    {
        public void Configure(EntityTypeBuilder<Notification> builder)
        {
            builder.ToTable("Notifications");
            builder.HasKey(x => x.Id);
            builder.HasOne(x => x.Post).WithMany();
            builder.HasOne(x => x.Creator).WithMany().IsRequired();
            builder.HasOne(x => x.Recipient).WithMany(x => x.Notifications).IsRequired();
        }
    }
}