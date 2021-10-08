using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using TeeApp.Application.Common;
using TeeApp.Application.Identity;
using TeeApp.Data.Entities;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Constants;

namespace TeeApp.Api
{
    public class MappingProfile : Profile
    {
        public MappingProfile(IHttpContextAccessor httpContextAccessor, ICurrentUser currentUser)
        {
            var hostUrl = httpContextAccessor.HttpContext.Request.Host.Value;

            if (!string.IsNullOrWhiteSpace(hostUrl))
            {
                CreateMap<User, UserViewModel>()
                    .ForMember(des => des.AvatarUrl,
                    act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.AvatarFileName)
                    ? $"https://{hostUrl}/{SystemConstants.DEFAULT_FOLDER}/{SystemConstants.DEFAULT_AVATAR[src.Gender]}"
                    : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.AvatarFileName}")))
                    .ForMember(des => des.CoverUrl,
                    act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.CoverFileName)
                    ? $"https://{hostUrl}/{SystemConstants.DEFAULT_FOLDER}/{SystemConstants.DEFAULT_COVER}"
                    : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.CoverFileName}")));

                CreateMap<Chat, ChatViewModel>()
                    .ForMember(
                        des => des.GroupAvatarUrl,
                        act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.AvatarFileName) ? "" : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.AvatarFileName}")))
                    .ForMember(des => des.CreatorUserName, act => act.MapFrom(src => src.Creator.UserName))
                    .ForMember(des => des.CreatorFullName, act => act.MapFrom(src => src.Creator.FullName));

                CreateMap<Message, MessageViewModel>()
                    .ForMember(des => des.SenderUserName, act => act.MapFrom(src => src.Sender.UserName))
                    .ForMember(des => des.SenderFullName, act => act.MapFrom(src => src.Sender.FullName))
                    .ForMember(
                        des => des.ImageUrl,
                        act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.ImageFileName) ? "" : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.ImageFileName}")));

                CreateMap<Post, PostViewModel>();
                CreateMap<Photo, PhotoViewModel>()
                    .ForMember(
                        des => des.ImageUrl,
                        act => act.MapFrom(src => (string.IsNullOrWhiteSpace(src.ImageFileName) ? "" : $"https://{hostUrl}/{SystemConstants.IMAGE_FOLDER}/{src.ImageFileName}")));
                CreateMap<Comment, CommentViewModel>();
                CreateMap<Reaction, ReactionViewModel>();
                CreateMap<Notification, NotificationViewModel>()
                    .ForMember(des => des.Content, act => act.MapFrom(src => src.GetNotificationContent()))
                    .ForMember(des => des.RecipientUserName, act => act.MapFrom(src => src.Recipient.UserName))
                    .ForMember(des => des.PostId, act => act.MapFrom(src => src.Post.Id));

                // map friend to friendship view model
                CreateMap<Friendship, FriendshipViewModel>()
                    .ForMember(
                        des => des.User,
                        act => act.MapFrom(src => src.RequestedUserId.Equals(currentUser.UserId) ? src.RecievedUser : src.RequestedUser));
            }
            else
            {
                throw new Exception("Cannot find host url in mapper");
            }
        }
    }
}