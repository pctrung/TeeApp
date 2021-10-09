using AutoMapper;
using Moq;
using System.Linq;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Services;
using TeeApp.Data.EF;
using TeeApp.Models.RequestModels.Common;
using TeeApp.UnitTests.Common;
using Xunit;

namespace TeeApp.UnitTests.Application
{
    public class FriendServiceTests
    {
        // Most of arrange in FakeData class

        [Fact]
        public async Task GetFriends_ReturnsList()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await friendService.GetFriendsPaginationAsync(request);

            // Assert
            Assert.Equal(2, list.Items.Count);
            Assert.Equal(2, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(1, list.PageCount);
        }

        [Fact]
        public async Task GetFriends_ReturnsEmpty()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            context.Friendships.RemoveRange(context.Friendships);
            await context.SaveChangesAsync();

            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await friendService.GetFriendsPaginationAsync(request);

            // Assert
            Assert.Empty(list.Items);
            Assert.Equal(0, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(0, list.PageCount);
        }

        [Fact]
        public async Task GetFriendRequests_ReturnsList()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await friendService.GetFriendRequestsPaginationAsync(request);

            // Assert
            Assert.Single(list.Items);
            Assert.Equal(1, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(1, list.PageCount);
        }

        [Fact]
        public async Task GetFriendRequests_ReturnsEmpty()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            context.Friendships.RemoveRange(context.Friendships);
            await context.SaveChangesAsync();

            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await friendService.GetFriendRequestsPaginationAsync(request);

            // Assert
            Assert.Empty(list.Items);
            Assert.Equal(0, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(0, list.PageCount);
        }

        [Fact]
        public async Task GetRequested_ReturnsList()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await friendService.GetFriendRequestsPaginationAsync(request);

            // Assert
            Assert.Single(list.Items);
            Assert.Equal(1, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(1, list.PageCount);
        }

        [Fact]
        public async Task GetRequested_ReturnsEmpty()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            context.Friendships.RemoveRange(context.Friendships);
            await context.SaveChangesAsync();

            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await friendService.GetRequestedPaginationAsync(request);

            // Assert
            Assert.Empty(list.Items);
            Assert.Equal(0, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(0, list.PageCount);
        }

        [Fact]
        public void GetBlocked_ReturnsList()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = friendService.GetBlockedPagination(request);

            // Assert
            Assert.Single(list.Items);
            Assert.Equal(1, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(1, list.PageCount);
        }

        [Fact]
        public void GetBlocked_ReturnsEmpty()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            context.Users.FirstOrDefault(x => x.Id.Equals(currentUserMock.Object.UserId))?.BlockedUsers.RemoveAll(x => true);
            context.SaveChanges();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = friendService.GetBlockedPagination(request);

            // Assert
            Assert.Empty(list.Items);
            Assert.Equal(0, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(0, list.PageCount);
        }

        [Fact]
        public void GetFollowing_ReturnsList()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = friendService.GetFollowingPagination(request);

            // Assert
            Assert.Equal(2, list.Items.Count);
            Assert.Equal(2, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(1, list.PageCount);
        }

        [Fact]
        public void GetFollowing_ReturnsEmpty()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            context.Users.FirstOrDefault(x => x.Id.Equals(currentUserMock.Object.UserId))?.Following.RemoveAll(x => true);
            context.SaveChanges();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = friendService.GetFollowingPagination(request);

            // Assert
            Assert.Empty(list.Items);
            Assert.Equal(0, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(0, list.PageCount);
        }

        [Fact]
        public void GetFollowers_ReturnsList()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = friendService.GetFollowersPagination(request);

            // Assert
            Assert.Equal(2, list.Items.Count);
            Assert.Equal(2, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(1, list.PageCount);
        }

        [Fact]
        public void GetFollowers_ReturnsEmpty()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            context.Users.FirstOrDefault(x => x.Id.Equals(currentUserMock.Object.UserId))?.Followers.RemoveAll(x => true);
            context.SaveChanges();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = friendService.GetFollowersPagination(request);

            // Assert
            Assert.Empty(list.Items);
            Assert.Equal(0, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(0, list.PageCount);
        }

        [Fact]
        public async Task AddFriend_WithoutExistsFriendRequest_ReturnsOK()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "havenofriendship";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task AddFriend_WithExistsFriendRequest_ReturnsOK()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friendrequest";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(2001, result.StatusCode);
        }

        [Fact]
        public async Task AddFriend_WithExistsMyFriendRequest_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "myrequest";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task AddFriend_WithUserAlreadyFriend_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friend2";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task AddFriend_WithNonExistsUser_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "notexists";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task AddFriend_WithBlockedUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedbyme";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task AddFriend_WithUserBlockedCurrentUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedme";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task AcceptFriendRequest_WithNonExistsUser_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "nonexist";

            // Act
            var result = await friendService.AddFriendAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task AcceptFriendRequest_WithBlockedUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedbyme";

            // Act
            var result = await friendService.AcceptFriendRequestAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task AcceptFriendRequest_WithUserBlockedCurrentUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedme";

            // Act
            var result = await friendService.AcceptFriendRequestAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task AcceptFriendRequest_WithNonExistsFriendRequest_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "havenofriendship";

            // Act
            var result = await friendService.AcceptFriendRequestAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task AcceptFriendRequest_WithFriend_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friend2";

            // Act
            var result = await friendService.AcceptFriendRequestAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task AcceptFriendRequest_WithExistsFriendRequest_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friendrequest";

            // Act
            var result = await friendService.AcceptFriendRequestAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task DeleteFriend_WithNonExistsUser_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "nonexists";

            // Act
            var result = await friendService.DeleteFriendshipAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task DeleteFriend_WithNonFriendship_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "havenofriendship";

            // Act
            var result = await friendService.DeleteFriendshipAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task DeleteFriend_WithExistsFriendship_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friend1";

            // Act
            var result = await friendService.DeleteFriendshipAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task BlockFriend_WithNonExistsUser_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "nonexists";

            // Act
            var result = await friendService.BlockFriendAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task BlockFriend_WithBlockedUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedbyme";

            // Act
            var result = await friendService.BlockFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task BlockFriend_WithNonBlockedUser_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friend1";

            // Act
            var result = await friendService.BlockFriendAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task UnBlockFriend_WithNonExistsUser_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "nonexists";

            // Act
            var result = await friendService.UnblockFriendAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task UnBlockFriend_WithNonBlockedUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friend1";

            // Act
            var result = await friendService.UnblockFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task UnBlockFriend_WithBlockedUser_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedbyme";

            // Act
            var result = await friendService.UnblockFriendAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task FollowFriend_WithNonExistsUser_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "nonexists";

            // Act
            var result = await friendService.FollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task FollowFriend_BlockedUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedbyme";

            // Act
            var result = await friendService.FollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task FollowFriend_UserBlockedCurrentUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "blockedme";

            // Act
            var result = await friendService.FollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task FollowFriend_WithAlreadyFollowedUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friend1";

            // Act
            var result = await friendService.FollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Fact]
        public async Task FollowFriend_WithNotFollowedUser_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "havenofriendship";

            // Act
            var result = await friendService.FollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task UnFollowFriend_WithNonExistsUser_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "nonexists";

            // Act
            var result = await friendService.UnFollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task UnFollowFriend_WithAlreadyFollowedUser_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "friend1";

            // Act
            var result = await friendService.UnFollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task UnFollowFriend_WithNotFollowedUser_ReturnsBadRequest()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var friendService = new FriendService(mapper, context, currentUserMock.Object);
            string friendUserName = "havenofriendship";

            // Act
            var result = await friendService.UnFollowFriendAsync(friendUserName);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }
    }
}