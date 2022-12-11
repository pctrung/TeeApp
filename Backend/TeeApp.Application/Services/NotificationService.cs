using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Interfaces;
using TeeApp.Data.EF;
using TeeApp.Data.Entities;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Enums.Types;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class NotificationService : INotificationService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUser;

        public NotificationService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser)
        {
            _context = context;
            _mapper = mapper;

            _currentUser = _context.Users
                .Include(x => x.Notifications)
                .AsSplitQuery()
                .OrderBy(x => x.DateCreated)
                .FirstOrDefault(x => x.Id.Equals(currentUser.UserId));

            if (_currentUser == null)
            {
                throw new Exception("Unable to identify user. Please login and try again!");
            }
        }

        public async Task<PagedResult<NotificationViewModel>> GetAllAsync(PaginationRequestBase request)
        {
            var notifications = await _context.Notifications
                .Include(x => x.Creator)
                .Include(x => x.Recipient)
                .Include(x => x.Post)
                .Where(x => x.Recipient.Id.Equals(_currentUser.Id) && x.IsRead)
                .OrderByDescending(x => x.DateCreated)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecord = notifications.Count;
            notifications = notifications.Paged(request.Page, request.Limit).ToList();

            // not load unread notification when page > 1
            if (request.Page == 1)
            {
                var unreadNotifications = await _context.Notifications
                .Include(x => x.Creator)
                .Include(x => x.Recipient)
                .Include(x => x.Post)
                .Where(x => x.Recipient.Id.Equals(_currentUser.Id) && !x.IsRead)
                .OrderByDescending(x => x.DateCreated)
                .AsSplitQuery()
                .ToListAsync();
                notifications.AddRange(unreadNotifications);
            }

            var notificationViewModels = _mapper.Map<List<NotificationViewModel>>(notifications);

            var result = new PagedResult<NotificationViewModel>()
            {
                Items = notificationViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = totalRecord
            };

            return result;
        }

        public async Task ReadByIdAsync(int id)
        {
            var notification = await _context.Notifications.FindAsync(id);
            if (notification != null && notification.Recipient.Id.Equals(_currentUser.Id))
            {
                notification.IsRead = true;
                await _context.SaveChangesAsync();
            }
        }

        public async Task ReadAllAsync()
        {
            _currentUser.Notifications
                .Where(x => !x.IsRead)
                .ToList()
                .ForEach(x => x.IsRead = true);

            await _context.SaveChangesAsync();
        }

        public async Task<NotificationViewModel> CreateFollowNotificationAsync(string userName)
        {
            var notifier = await _context.Users
                .Where(x => x.UserName.Equals(userName))
                .Include(x => x.Notifications)
                .AsSplitQuery()
                .FirstOrDefaultAsync();
            if (notifier == null)
            {
                return null;
            }

            var notification = new Notification()
            {
                Creator = _currentUser,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Recipient = notifier,
                Type = NotificationType.Follow
            };

            notifier.Notifications.Add(notification);
            await _context.SaveChangesAsync();

            notification.DateCreated = notification.DateCreated.AddHours(-7);
            return _mapper.Map<NotificationViewModel>(notification);
        }

        public async Task<NotificationViewModel> CreateFriendRequestNotificationAsync(string userName)
        {
            var notifier = await _context.Users
                .Where(x => x.UserName.Equals(userName))
                .Include(x => x.Notifications)
                .AsSplitQuery()
                .FirstOrDefaultAsync();
            if (notifier == null)
            {
                return null;
            }

            var notification = new Notification()
            {
                Creator = _currentUser,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Recipient = notifier,
                Type = NotificationType.FriendRequest
            };

            notifier.Notifications.Add(notification);
            await _context.SaveChangesAsync();

            notification.DateCreated = notification.DateCreated.AddHours(-7);
            return _mapper.Map<NotificationViewModel>(notification);
        }

        public async Task<NotificationViewModel> CreateAcceptedFriendRequestNotificationAsync(string userName)
        {
            var notifier = await _context.Users
                .Where(x => x.UserName.Equals(userName))
                .Include(x => x.Notifications)
                .AsSplitQuery()
                .FirstOrDefaultAsync();
            if (notifier == null)
            {
                return null;
            }

            var notification = new Notification()
            {
                Creator = _currentUser,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Recipient = notifier,
                Type = NotificationType.AcceptedFriendRequest
            };

            notifier.Notifications.Add(notification);
            await _context.SaveChangesAsync();

            notification.DateCreated = notification.DateCreated.AddHours(-7);
            return _mapper.Map<NotificationViewModel>(notification);
        }

        public async Task<NotificationViewModel> CreateCommentNotificationAsync(int postId)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId))
                .Include(x => x.Creator)
                .ThenInclude(x => x.Notifications)
                .AsSplitQuery()
                .FirstOrDefaultAsync();
            if (post == null)
            {
                return null;
            }

            var notification = new Notification()
            {
                Creator = _currentUser,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Recipient = post.Creator,
                Post = post,
                Type = NotificationType.Comment
            };

            post.Creator.Notifications.Add(notification);
            await _context.SaveChangesAsync();

            notification.DateCreated = notification.DateCreated.AddHours(-7);
            return _mapper.Map<NotificationViewModel>(notification);
        }

        public async Task<NotificationViewModel> CreateReactionNotificationAsync(int postId, ReactionType reactionType)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId))
                .Include(x => x.Creator)
                .ThenInclude(x => x.Notifications)
                .AsSplitQuery()
                .FirstOrDefaultAsync();
            if (post == null)
            {
                return null;
            }

            var notification = new Notification()
            {
                Creator = _currentUser,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Recipient = post.Creator,
                Post = post,
                Type = NotificationType.Reaction,
                ReactionType = reactionType
            };

            post.Creator.Notifications.Add(notification);
            await _context.SaveChangesAsync();

            notification.DateCreated = notification.DateCreated.AddHours(-7);
            return _mapper.Map<NotificationViewModel>(notification);
        }
    }
}