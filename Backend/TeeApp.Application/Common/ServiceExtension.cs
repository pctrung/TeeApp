using System.Collections.Generic;
using System.Linq;
using TeeApp.Data.Entities;

namespace TeeApp.Application.Common
{
    public static class ServiceExtension
    {
        public static IQueryable<Friendship> FilterBlockedAndKeyword(this IQueryable<Friendship> source, User currentUser, string keyword = "")
        {
            keyword = string.IsNullOrWhiteSpace(keyword) ? "" : keyword.ToLower();
            return source
                .Where(
                    x =>
                    !currentUser.BlockedByUsers.Contains(x.RecievedUser) &&
                    !currentUser.BlockedByUsers.Contains(x.RequestedUser) &&
                    !currentUser.BlockedUsers.Contains(x.RecievedUser) &&
                    !currentUser.BlockedUsers.Contains(x.RequestedUser) &&
                    ((x.RequestedUserId.Equals(currentUser.Id) &&
                    (x.RecievedUser.FirstName.ToLower().Contains(keyword) ||
                        x.RecievedUser.LastName.ToLower().Contains(keyword) ||
                        x.RecievedUser.UserName.ToLower().Contains(keyword))) ||
                    (x.RecievedUserId.Equals(currentUser.Id) &&
                    (x.RequestedUser.FirstName.ToLower().Contains(keyword) ||
                        x.RequestedUser.LastName.ToLower().Contains(keyword) ||
                        x.RequestedUser.UserName.ToLower().Contains(keyword)))))
                .OrderBy(x => x.RequestedUser.UserName.Equals(currentUser.UserName) ? x.RecievedUser.LastName : x.RequestedUser.LastName);
        }

        public static List<User> FilterBlockedAndKeyword(this List<User> source, User currentUser, string keyword = "")
        {
            keyword = string.IsNullOrWhiteSpace(keyword) ? "" : keyword.ToLower();
            return source
                .Where(
                    x =>
                    !currentUser.BlockedByUsers.Contains(x) &&
                    !currentUser.BlockedUsers.Contains(x) &&
                   (x.FirstName.ToLower().Contains(keyword) ||
                        x.LastName.ToLower().Contains(keyword) ||
                        x.UserName.ToLower().Contains(keyword)))
                .OrderBy(x => x.FullName).ToList();
        }
    }
}