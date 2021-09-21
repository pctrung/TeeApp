using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using TeeApp.Data.Entities;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Constants;

namespace TeeApp.Api
{
    public class MappingProfile : Profile
    {
        public MappingProfile(IHttpContextAccessor httpContextAccessor)
        {
            var hostUrl = httpContextAccessor.HttpContext.Request.Host.Value;

            if (!string.IsNullOrWhiteSpace(hostUrl))
            {
                CreateMap<User, UserViewModel>()
                    .ForMember(des => des.AvatarUrl,
                    act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.AvatarFileName) ? "" : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.AvatarFileName}")));

                CreateMap<Chat, ChatViewModel>()
                    .ForMember(
                        des => des.GroupAvatarUrl,
                        act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.AvatarFileName) ? "" : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.AvatarFileName}")))
                    .ForMember(des => des.CreatorUserName, act => act.MapFrom(src => src.Creator.UserName))
                    .ForMember(des => des.CreatorFullName, act => act.MapFrom(src => src.Creator.FullName));

                CreateMap<Message, MessageViewModel>()
                .ForMember(des => des.SenderUserName, act => act.MapFrom(src => src.Sender.UserName))
                .ForMember(des => des.SenderFullName, act => act.MapFrom(src => src.Sender.FullName))
                .ForMember(des => des.ImageUrl,
                    act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.ImageFileName) ? "" : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.ImageFileName}")));

                CreateMap<Post, PostViewModel>();
                CreateMap<Photo, PhotoViewModel>();
                CreateMap<Comment, CommentViewModel>();
                CreateMap<Reaction, ReactionViewModel>();
            }
            else
            {
                throw new Exception("Cannot find host url in mapper");
            }
        }
    }
}