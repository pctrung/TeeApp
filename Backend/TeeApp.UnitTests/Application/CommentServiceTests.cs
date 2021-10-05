using AutoMapper;
using Moq;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Services;
using TeeApp.Data.EF;
using TeeApp.Models.RequestModels.Comments;
using TeeApp.UnitTests.Common;
using Xunit;

namespace TeeApp.UnitTests.Application
{
    // Most of arrange in FakeData class
    public class CommentServiceTests
    {
        [Theory]
        [InlineData(int.MaxValue)]  // non exists post id
        [InlineData(int.MaxValue - 1)]
        public async Task CreateComment_WithNonExistsPost_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);
            var request = new CommentRequest()
            {
                Content = "Test comment",
            };

            // Act
            var result = await service.CreateAsync(postId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3)] // 3 is post id from user blocked current user
        [InlineData(4)] // 4 is post id from user blocked by current user
        public async Task CreateComment_WithPostHaveBlockedCreator_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);
            var request = new CommentRequest()
            {
                Content = "Test comment",
            };

            // Act
            var result = await service.CreateAsync(postId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1)] // post from friend
        [InlineData(8)] // post from current user
        public async Task CreateComment_WithValidRequest_ReturnsCreated(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);
            var request = new CommentRequest()
            {
                Content = "Test comment",
            };

            // Act
            var result = await service.CreateAsync(postId, request);

            // Assert
            Assert.Equal(201, result.StatusCode);
        }

        [Theory]
        [InlineData(int.MaxValue, 3)]  // non exists post
        [InlineData(int.MaxValue, 13)] // non exists post
        public async Task UpdateComment_WithNonExistsPost_ReturnsNotFound(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);
            var request = new CommentRequest()
            {
                Content = "Test comment",
            };

            // Act
            var result = await service.UpdateAsync(postId, commentId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1, int.MaxValue)]  // non exists comment
        [InlineData(8, int.MaxValue)] // non exists comment
        public async Task UpdateComment_WithNonExistsComment_ReturnsNotFound(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);
            var request = new CommentRequest()
            {
                Content = "Test comment",
            };

            // Act
            var result = await service.UpdateAsync(postId, commentId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3, 1)] // 3 is post id from user blocked current user
        [InlineData(4, 1)] // 4 is post id from user blocked by current user
        public async Task UpdateComment_WithPostHaveBlockedCreator_ReturnsNotFound(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);
            var request = new CommentRequest()
            {
                Content = "Test comment",
            };

            // Act
            var result = await service.UpdateAsync(postId, commentId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1, 3)]  // post from friend and comment from current user
        [InlineData(8, 13)] // post and comment from current user
        public async Task UpdateComment_WithValidRequest_ReturnsOk(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);
            var request = new CommentRequest()
            {
                Content = "Test comment",
            };

            // Act
            var result = await service.UpdateAsync(postId, commentId, request);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Theory]
        [InlineData(int.MaxValue, 3)]  // non exists post
        [InlineData(int.MaxValue, 13)] // non exists post
        public async Task DeleteComment_WithNonExistsPost_ReturnsNotFound(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, commentId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1, int.MaxValue)]  // non exists comment
        [InlineData(8, int.MaxValue)] // non exists comment
        public async Task DeleteComment_WithNonExistsComment_ReturnsNotFound(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, commentId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3, 1)] // 3 is post id from user blocked current user
        [InlineData(4, 1)] // 4 is post id from user blocked by current user
        public async Task DeleteComment_WithPostHaveBlockedCreator_ReturnsNotFound(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, commentId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1, 3)]  // post from friend and comment from current user
        [InlineData(8, 13)] // post and comment from current user
        public async Task DeleteComment_WithValidRequest_ReturnsOk(int postId, int commentId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new CommentService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, commentId);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }
    }
}