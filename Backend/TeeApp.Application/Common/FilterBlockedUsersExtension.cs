using System.Collections.Generic;
using System.Linq;
using TeeApp.Data.Entities;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Application.Common
{
    public static class FilterBlockedUsersExtension
    {
        // Filter blocked users for users list
        public static IQueryable<Friendship> FilterBlockedAndRequestWithoutPagination(this IQueryable<Friendship> source, User currentUser, PaginationRequestBase request)
        {
            request.Keyword = request.Keyword.ToLower();
            var query = source
                .Where(
                    x =>
                    !currentUser.BlockedByUsers.Contains(x.RecievedUser) &&
                    !currentUser.BlockedByUsers.Contains(x.RequestedUser) &&
                    !currentUser.BlockedUsers.Contains(x.RecievedUser) &&
                    !currentUser.BlockedUsers.Contains(x.RequestedUser) &&
                    ((x.RequestedUserId.Equals(currentUser.Id) &&
                    (x.RecievedUser.FirstName.ToLower().Contains(request.Keyword) ||
                        x.RecievedUser.LastName.ToLower().Contains(request.Keyword) ||
                        x.RecievedUser.UserName.ToLower().Contains(request.Keyword))) ||
                    (x.RecievedUserId.Equals(currentUser.Id) &&
                    (x.RequestedUser.FirstName.ToLower().Contains(request.Keyword) ||
                        x.RequestedUser.LastName.ToLower().Contains(request.Keyword) ||
                        x.RequestedUser.UserName.ToLower().Contains(request.Keyword)))));

            if (request.SortType == SortType.Ascending)
            {
                query = query.OrderBy(x => x.RequestedUser.UserName.Equals(currentUser.UserName) ? x.RecievedUser.LastName : x.RequestedUser.LastName);
            }
            else
            {
                query = query.OrderByDescending(x => x.RequestedUser.UserName.Equals(currentUser.UserName) ? x.RecievedUser.LastName : x.RequestedUser.LastName);
            }

            return query;
        }

        public static IList<User> FilterBlockedAndRequestWithoutPagination(this IList<User> source, User currentUser, PaginationRequestBase request)
        {
            request.Keyword = request.Keyword.ToLower();
            var query = source
                .Where(
                    x =>
                    !currentUser.BlockedByUsers.Contains(x) &&
                    !currentUser.BlockedUsers.Contains(x) &&
                   (x.FirstName.ToLower().Contains(request.Keyword) ||
                        x.LastName.ToLower().Contains(request.Keyword) ||
                        x.UserName.ToLower().Contains(request.Keyword)));

            if (request.SortType == SortType.Ascending)
            {
                query = query.OrderBy(x => x.FullName);
            }
            else
            {
                query = query.OrderByDescending(x => x.FullName);
            }

            return query.ToList();
        }

        public static IQueryable<User> FilterBlockedAndRequestWithoutPagination(this IQueryable<User> source, User currentUser, PaginationRequestBase request)
        {
            request.Keyword = request.Keyword.ToLower();
            var query = source
                .Where(
                    x =>
                    !currentUser.BlockedByUsers.Contains(x) &&
                    !currentUser.BlockedUsers.Contains(x) &&
                   (x.FirstName.ToLower().Contains(request.Keyword) ||
                        x.LastName.ToLower().Contains(request.Keyword) ||
                        x.UserName.ToLower().Contains(request.Keyword)));

            if (request.SortType == SortType.Ascending)
            {
                query = query.OrderBy(x => x.FirstName);
            }
            else
            {
                query = query.OrderByDescending(x => x.FirstName);
            }

            return query;
        }

        // Filter blocked users for post
        public static IQueryable<Post> FilterBlockedAndRequestWithoutPagination(this IQueryable<Post> source, User currentUser, PaginationRequestBase request)
        {
            request.Keyword = request.Keyword.ToLower();
            var query = source
                .Where(
                    x =>
                    !currentUser.BlockedByUsers.Contains(x.Creator) &&
                    !currentUser.BlockedUsers.Contains(x.Creator) &&
                    x.Content.ToLower().Contains(request.Keyword));

            if (request.SortType == SortType.Ascending)
            {
                query = query.OrderBy(x => x.DateCreated);
            }
            else
            {
                query = query.OrderByDescending(x => x.DateCreated);
            }

            return query;
        }
    }
}