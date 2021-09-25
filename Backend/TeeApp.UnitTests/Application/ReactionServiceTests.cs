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
        public async Task CreateReaction_WithPostHaveBlockedCreator_ReturnsBadRequest(int postId)
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
        [InlineData(1)] // post from friend
        [InlineData(8)] // post from current user
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
        [InlineData(int.MaxValue, 3)]  // Non exist post
        [InlineData(int.MaxValue, 13)] // Non exist post
        public async Task UpdateReaction_WithNonExistsPost_ReturnsNotFound(int postId, int reactionId)
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
            var result = await service.UpdateAsync(postId, reactionId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1, int.MaxValue)]  // Non exist reaction
        [InlineData(8, int.MaxValue)] // Non exist reaction
        public async Task UpdateReaction_WithNonExistsReaction_ReturnsNotFound(int postId, int reactionId)
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
            var result = await service.UpdateAsync(postId, reactionId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3, 1)] // 3 is post id from user blocked current user
        [InlineData(4, 1)] // 4 is post id from user blocked by current user
        public async Task UpdateReaction_WithPostHaveBlockedCreator_ReturnsBadRequest(int postId, int reactionId)
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
            var result = await service.UpdateAsync(postId, reactionId, request);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Theory]
        [InlineData(1, 3)]  // post from friend and reaction from current user
        [InlineData(8, 13)] // post and reaction from current user
        public async Task UpdateReaction_WithValidRequest_ReturnsOk(int postId, int reactionId)
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
            var result = await service.UpdateAsync(postId, reactionId, request);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Theory]
        [InlineData(int.MaxValue, 3)]  // Non exist post
        [InlineData(int.MaxValue, 13)] // Non exist post
        public async Task DeleteReaction_WithNonExistsPost_ReturnsNotFound(int postId, int reactionId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, reactionId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1, int.MaxValue)]  // Non exist reaction
        [InlineData(8, int.MaxValue)] // Non exist reaction
        public async Task DeleteReaction_WithNonExistsReaction_ReturnsNotFound(int postId, int reactionId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, reactionId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(3, 1)] // 3 is post id from user blocked current user
        [InlineData(4, 1)] // 4 is post id from user blocked by current user
        public async Task DeleteReaction_WithPostHaveBlockedCreator_ReturnsBadRequest(int postId, int reactionId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, reactionId);

            // Assert
            Assert.Equal(400, result.StatusCode);
        }

        [Theory]
        [InlineData(1, 3)]  // post from friend and reaction from current user
        [InlineData(8, 13)] // post and reaction from current user
        public async Task DeleteReaction_WithValidRequest_ReturnsOk(int postId, int reactionId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var service = new ReactionService(mapper, context, currentUserMock.Object);

            // Act
            var result = await service.DeleteAsync(postId, reactionId);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }
    }
}