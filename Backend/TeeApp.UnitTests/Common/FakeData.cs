using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Moq;
using System;
using System.Collections.Generic;
using TeeApp.Application.Identity;
using TeeApp.Data.EF;
using TeeApp.Data.Entities;
using TeeApp.Models.Common.Enums;
using TeeApp.Models.ViewModels;

namespace TeeApp.UnitTests.Common
{
    public class FakeData
    {
        private static readonly string MAIN_USER_ID = "69BD714F-9576-45BA-B5B7-F00649BE00DF";

        public static Mock<ICurrentUser> GetICurrentUserTest()
        {
            var currentUserMock = new Mock<ICurrentUser>();
            currentUserMock.Setup(x => x.UserName).Returns("pctrung");
            currentUserMock.Setup(x => x.FirstName).Returns("Trung");
            currentUserMock.Setup(x => x.LastName).Returns("Pham");
            currentUserMock.Setup(x => x.FullName).Returns("Pham Trung");
            currentUserMock.Setup(x => x.UserId).Returns(MAIN_USER_ID);

            return currentUserMock;
        }

        public static TeeAppDbContext GetInMemoryDbTest()
        {
            // Current user is friend of User1, User2
            // Current user following are User1, User2
            // Current user followers are User1, User2
            // Blocked User4, Blocked by User3

            var builder = new DbContextOptionsBuilder<TeeAppDbContext>()
                .UseInMemoryDatabase(Guid.NewGuid().ToString());
            var context = new TeeAppDbContext(builder.Options);

            var User1 = new User()
            {
                Id = "19BD714F-9576-45BA-B5B7-F00649BE20DF",
                UserName = "friend1",
                FirstName = "Phuc",
                LastName = "Hoang",
                Followers = new List<User>() { },
                Following = new List<User>() { },
                BlockedUsers = new List<User>() { },
                BlockedByUsers = new List<User>() { },
            };
            var User2 = new User()
            {
                Id = "19BD714F-9576-45BA-B5B7-F00649BE00DF",
                UserName = "friend2",
                FirstName = "Xuan",
                LastName = "Diem",
                Followers = new List<User>() { },
                Following = new List<User>() { },
                BlockedUsers = new List<User>() { },
                BlockedByUsers = new List<User>() { },
            };
            var User3 = new User() // blocked main user
            {
                Id = "29BD714F-9576-45BA-B5B7-F00649BE00DF",
                UserName = "blockedme",
                FirstName = "Lam",
                LastName = "Nguyen",
                Followers = new List<User>() { },
                Following = new List<User>() { },
                BlockedUsers = new List<User>() { },
                BlockedByUsers = new List<User>() { },
            };
            var User4 = new User()  // blocked by main user
            {
                Id = "39BD714F-9576-45BA-B5B7-F00649BE00DF",
                UserName = "blockedbyme",
                FirstName = "Nhi",
                LastName = "Nguyen",
                Followers = new List<User>() { },
                Following = new List<User>() { },
                BlockedUsers = new List<User>() { },
                BlockedByUsers = new List<User>() { },
            };
            var User5 = new User()  // friend request
            {
                Id = "39BD714F-9576-45BA-B5B7-F00649BE00DA",
                UserName = "friendrequest",
                FirstName = "Vi",
                LastName = "Huynh",
                Followers = new List<User>() { },
                Following = new List<User>() { },
                BlockedUsers = new List<User>() { },
                BlockedByUsers = new List<User>() { },
            };
            var User6 = new User() // My request
            {
                Id = "39BD714F-9576-45BA-B5B7-F00649BE00DW",
                UserName = "myrequest",
                FirstName = "Tien",
                LastName = "Huynh",
                Followers = new List<User>() { },
                Following = new List<User>() { },
                BlockedUsers = new List<User>() { },
                BlockedByUsers = new List<User>() { },
            };
            var User7 = new User()  // have no any friendship
            {
                Id = "12BD714F-9576-45BA-B5B7-F00649BE00DW",
                UserName = "havenofriendship",
                FirstName = "Test",
                LastName = "User",
                Followers = new List<User>() { },
                Following = new List<User>() { },
                BlockedUsers = new List<User>() { },
                BlockedByUsers = new List<User>() { },
            };
            var MainUser = new User()
            {
                Id = MAIN_USER_ID,
                UserName = "pctrung",
                FirstName = "Trung",
                LastName = "Pham",
                Followers = new List<User>() { User1, User2 },
                Following = new List<User>() { User1, User2 },
                BlockedUsers = new List<User>() { User4 },
                BlockedByUsers = new List<User>() { User3 },
            };
            User1.Followers.Add(MainUser);
            User1.Following.Add(MainUser);
            User2.Followers.Add(MainUser);
            User2.Following.Add(MainUser);
            User3.BlockedUsers.Add(MainUser);

            context.Users.AddRange(MainUser, User2, User3, User4, User5, User6, User7);

            context.Friendships.AddRange(
                new Friendship()
                {
                    Type = FriendshipType.Accepted,
                    RecievedUser = MainUser,
                    RecievedUserId = MainUser.Id,
                    RequestedUser = User1,
                    RequestedUserId = User1.Id,
                    RequestedDate = DateTime.Now
                },
                new Friendship()
                {
                    Type = FriendshipType.Accepted,
                    RecievedUser = MainUser,
                    RecievedUserId = MainUser.Id,
                    RequestedUser = User2,
                    RequestedUserId = User2.Id,
                    RequestedDate = DateTime.Now
                },
                new Friendship()
                {
                    Type = FriendshipType.Pending,
                    RecievedUser = MainUser,
                    RecievedUserId = MainUser.Id,
                    RequestedUser = User5,
                    RequestedUserId = User5.Id,
                    RequestedDate = DateTime.Now
                },
                new Friendship()
                {
                    Type = FriendshipType.Pending,
                    RecievedUser = User6,
                    RecievedUserId = User6.Id,
                    RequestedUser = MainUser,
                    RequestedUserId = MainUser.Id,
                    RequestedDate = DateTime.Now
                }
            );

            context.SaveChanges();
            return context;
        }

        public static IMapper GetIMapperTest()
        {
            var configMapper = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<User, UserViewModel>();

                cfg.CreateMap<Chat, ChatViewModel>()
                    .ForMember(des => des.CreatorUserName, act => act.MapFrom(src => src.Creator.UserName))
                    .ForMember(des => des.CreatorFullName, act => act.MapFrom(src => src.Creator.FullName));

                cfg.CreateMap<Message, MessageViewModel>()
                    .ForMember(des => des.SenderUserName, act => act.MapFrom(src => src.Sender.UserName))
                    .ForMember(des => des.SenderFullName, act => act.MapFrom(src => src.Sender.FullName));

                cfg.CreateMap<Post, PostViewModel>();
                cfg.CreateMap<Photo, PhotoViewModel>();
                cfg.CreateMap<Comment, CommentViewModel>();
                cfg.CreateMap<Reaction, ReactionViewModel>();

                // map friend to friendship view model
                cfg.CreateMap<Friendship, FriendshipViewModel>()
                    .ForMember(
                        des => des.User,
                        act => act.MapFrom(src => src.RequestedUserId == MAIN_USER_ID ? src.RecievedUser : src.RequestedUser));
            });

            IMapper mapper = configMapper.CreateMapper();

            return mapper;
        }
    }
}