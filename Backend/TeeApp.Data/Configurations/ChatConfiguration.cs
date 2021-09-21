﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TeeApp.Data.Entities;

namespace TeeApp.Data.Configurations
{
    public class ChatConfiguration : IEntityTypeConfiguration<Chat>
    {
        public void Configure(EntityTypeBuilder<Chat> builder)
        {
            builder.ToTable("Chats");
            builder.HasKey(x => x.Id);
            builder.HasOne(x => x.Creator).WithMany(x => x.CreatedChats);
            builder
                .HasMany(x => x.Participants)
                .WithMany(x => x.JoinedChats)
                .UsingEntity(
                    join =>
                    {
                        join.ToTable("ChatParticipants");
                    }
                );
            builder.Property(x => x.Name).HasMaxLength(100);
        }
    }
}