using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TeeApp.Data.Entities;

namespace TeeApp.Data.Configurations
{
    public class FriendshipConfiguration : IEntityTypeConfiguration<Friendship>
    {
        public void Configure(EntityTypeBuilder<Friendship> builder)
        {
            builder.ToTable("Friendships");
            builder.HasKey(x => new { x.RequestedUserId, x.RecievedUserId });
            builder.HasOne(x => x.RequestedUser).WithMany().IsRequired();
            builder.HasOne(x => x.RecievedUser).WithMany().IsRequired();
        }
    }
}