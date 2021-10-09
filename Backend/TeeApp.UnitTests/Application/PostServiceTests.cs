using AutoMapper;
using Microsoft.AspNetCore.Http;
using Moq;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Interfaces;
using TeeApp.Application.Services;
using TeeApp.Data.EF;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.RequestModels.Posts;
using TeeApp.UnitTests.Common;
using TeeApp.Utilities.Enums.Types;
using Xunit;

namespace TeeApp.UnitTests.Application
{
    // Most of arrange in FakeData class
    public class PostServiceTests
    {
        private static IStorageService GetStorageServiceMock()
        {
            var storageServiceMock = new Mock<IStorageService>();
            storageServiceMock.Setup(x => x.SaveImageAsync(It.IsAny<IFormFile>())).Returns(Task.FromResult("fakeimagename.jpg"));
            storageServiceMock.Setup(x => x.DeleteFileAsync(It.IsAny<string>())).Returns(Task.CompletedTask);

            return storageServiceMock.Object;
        }

        [Fact]
        public async Task GetAll_WithNotEmptyPostInDb_ReturnsList()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await postService.GetNewsFeedPaginationAsync(request);

            // Assert
            // fake data include 4 valid post
            Assert.Equal(4, list.Items.Count);
            Assert.Equal(4, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(1, list.PageCount);
        }

        [Fact]
        public async Task GetAll_WithEmptyPostInDb_ReturnsEmpty()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            context.Posts.RemoveRange(context.Posts);
            await context.SaveChangesAsync();

            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = new PaginationRequestBase() { Keyword = "", Limit = 50, Page = 1 };

            // Act
            var list = await postService.GetNewsFeedPaginationAsync(request);

            // Assert
            Assert.Empty(list.Items);
            Assert.Equal(0, list.TotalRecords);
            Assert.Equal(50, list.Limit);
            Assert.Equal(1, list.Page);
            Assert.Equal(0, list.PageCount);
        }

        [Theory]
        [InlineData(1)]
        [InlineData(2)]
        [InlineData(3)]
        public async Task GetById_WithExistsId_ReturnsOk(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());

            // Act
            var result = await postService.GetByIdAsync(postId);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Fact]
        public async Task GetById_WithExistsId_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var notExistsPostId = 10;

            // Act
            var result = await postService.GetByIdAsync(notExistsPostId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task CreatePost_WithValidRequest_ReturnsCreated()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = new CreatePostRequest()
            {
                Content = "New post",
                Privacy = PrivacyType.Public
            };

            // Act
            var result = await postService.CreateAsync(request);

            // Assert
            Assert.Equal(201, result.StatusCode);
        }

        [Theory]
        [InlineData(10)]
        [InlineData(12)]
        [InlineData(13)]
        public async Task UpdatePost_WithNonExistsPost_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = new UpdatePostRequest()
            {
                Content = "New post",
                Privacy = PrivacyType.Public
            };

            // Act
            var result = await postService.UpdateAsync(postId, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1)]
        [InlineData(2)]
        [InlineData(3)]
        public async Task UpdatePost_WithNotMyPost_ReturnsForBid(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = new UpdatePostRequest()
            {
                Content = "New post",
                Privacy = PrivacyType.Public
            };

            // Act
            var result = await postService.UpdateAsync(postId, request);

            // Assert
            Assert.Equal(403, result.StatusCode);
        }

        [Fact]
        public async Task UpdatePost_WithMyExistsPost_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = new UpdatePostRequest()
            {
                Content = "New post",
                Privacy = PrivacyType.Public
            };
            var postId = 8;

            // Act
            var result = await postService.UpdateAsync(postId, request);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }

        [Theory]
        [InlineData(10)]
        [InlineData(12)]
        [InlineData(13)]
        public async Task DeletePost_WithNonExistsPost_ReturnsNotFound(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());

            // Act
            var result = await postService.DeleteAsync(postId);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Theory]
        [InlineData(1)]
        [InlineData(2)]
        [InlineData(3)]
        public async Task DeletePost_WithNotMyPost_ReturnsForBid(int postId)
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());

            // Act
            var result = await postService.DeleteAsync(postId);

            // Assert
            Assert.Equal(403, result.StatusCode);
        }

        [Fact]
        public async Task DeletePost_WithMyExistsPost_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            IMapper mapper = FakeData.GetIMapperTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();

            var postService = new PostService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var postId = 8;

            // Act
            var result = await postService.DeleteAsync(postId);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }
    }
}