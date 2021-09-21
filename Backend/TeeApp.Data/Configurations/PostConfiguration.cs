using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TeeApp.Data.Entities;

namespace TeeApp.Data.Configurations
{
    public class PostConfiguration : IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post> builder)
        {
            builder.ToTable("Posts");
            builder.HasKey(x => x.Id);
            builder.HasOne(x => x.Creator).WithMany(x => x.Posts).IsRequired();
            builder.HasMany(x => x.Comments).WithOne(x => x.Post);
            builder.HasMany(x => x.Reactions).WithOne(x => x.Post);
            builder.HasMany(x => x.Photos).WithOne(x => x.Post);
        }
    }
}