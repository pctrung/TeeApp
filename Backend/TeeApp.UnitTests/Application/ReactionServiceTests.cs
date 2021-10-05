using AutoMapper;
using Moq;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Services;
using TeeApp.Data.EF;
using TeeApp.Models.RequestModels.Reactions;
using TeeApp.UnitTests.Common;
using Xunit;

namespace TeeApp.UnitTests.Application
{
    // Most of arrange in FakeData class
    public class ReactionServiceTests
    {
        [Theory]
        [InlineData(int.MaxValue)]  // non exists post id
        [InlineData(int.MaxValue - 1)]
        public async Task CreateReaction_WithNonExistsPost_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);
            var request = new ReactionRequest()
            {
                Type = 0
            };

            // Act
            var result = await service.CreateAsync(postId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3)] // 3 is post id from user blocked current user
        [InlineData(4)] // 4 is post id from user blocked by current user
        public async Task CreateReaction_WithPostHaveBlockedCreator_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);
            var request = new ReactionRequest()
            {
                Type = 0
            };

            // Act
            var result = await service.CreateAsync(postId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1)] // 1 is post current user already reacted
        public async Task CreateReaction_WithAlreadyReactedPost_ReturnsBadRequest(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);
            var request = new ReactionRequest()
            {
                Type = 0
            };

            // Act
            var result = await service.CreateAsync(postId, request);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Theory]
        [InlineData(2)] // post from friend
        [InlineData(9)] // post from current user
        public async Task CreateReaction_WithValidRequest_ReturnsCreated(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);
            var request = new ReactionRequest()
            {
                Type = 0
            };

            // Act
            var result = await service.CreateAsync(postId, request);

            // Assert
            Assert.Equal(201, result.StatusCode);
        }

        [Theory]
        [InlineData(int.MaxValue)]  // Non exist post
        public async Task UpdateReaction_WithNonExistsPost_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);
            var request = new ReactionRequest()
            {
                Type = 0
            };

            // Act
            var result = await service.UpdateAsync(postId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3)] // 3 is post id from user blocked current user
        [InlineData(4)] // 4 is post id from user blocked by current user
        public async Task UpdateReaction_WithPostHaveBlockedCreator_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);
            var request = new ReactionRequest()
            {
                Type = 0
            };

            // Act
            var result = await service.UpdateAsync(postId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1)]  // post from friend and reaction from current user
        [InlineData(8)] // post and reaction from current user
        public async Task UpdateReaction_WithValidRequest_ReturnsOk(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);
            var request = new ReactionRequest()
            {
                Type = 0
            };

            // Act
            var result = await service.UpdateAsync(postId, request);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Theory]
        [InlineData(int.MaxValue)]  // Non exist post
        public async Task DeleteReaction_WithNonExistsPost_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3)] // 3 is post id from user blocked current user
        [InlineData(4)] // 4 is post id from user blocked by current user
        public async Task DeleteReaction_WithPostHaveBlockedCreator_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1)]  // post from friend and reaction from current user
        [InlineData(8)] // post and reaction from current user
        public async Task DeleteReaction_WithValidRequest_ReturnsOk(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }
    }
}