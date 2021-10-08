using AutoMapper;
using Microsoft.AspNetCore.Http;
using Moq;
using System.IO;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Interfaces;
using TeeApp.Application.Services;
using TeeApp.Data.EF;
using TeeApp.Models.RequestModels.PostPhotos;
using TeeApp.UnitTests.Common;
using Xunit;

namespace TeeApp.UnitTests.Application
{
    // Most of arrange in FakeData class
    public class PostPhotoPhotoServiceTests
    {
        private const int MY_POST_ID = 8;
        private const int MY_PHOTO_ID = 11;
        private const int OTHER_POST_ID = 1;
        private const int NON_EXIST_PHOTO_ID = int.MaxValue;
        private const int NON_EXIST_POST_ID = int.MaxValue;

        private static PostPhotoRequest GetFakeRequest()
        {
            var fileMock = new Mock<IFormFile>();
            var content = "Hello World from a Fake File";
            var fileName = "test.pdf";
            var ms = new MemoryStream();
            var writer = new StreamWriter(ms);
            writer.Write(content);
            writer.Flush();
            ms.Position = 0;
            fileMock.Setup(_ => _.OpenReadStream()).Returns(ms);
            fileMock.Setup(_ => _.FileName).Returns(fileName);
            fileMock.Setup(_ => _.Length).Returns(ms.Length);

            var request = new PostPhotoRequest()
            {
                Image = fileMock.Object,
                Caption = "Fake caption"
            };
            return request;
        }

        private static IStorageService GetStorageServiceMock()
        {
            var storageServiceMock = new Mock<IStorageService>();
            storageServiceMock.Setup(x => x.SaveImageAsync(It.IsAny<IFormFile>())).Returns(Task.FromResult("fakeimagename.jpg"));
            storageServiceMock.Setup(x => x.DeleteFileAsync(It.IsAny<string>())).Returns(Task.CompletedTask);

            return storageServiceMock.Object;
        }

        [Fact]
        public async Task CreatePostPhoto_WithNonExistsPost_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            IMapper mapper = FakeData.GetIMapperTest();

            var postPhotoService = new PostPhotoService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = GetFakeRequest();

            // Act
            var result = await postPhotoService.CreateAsync(NON_EXIST_POST_ID, request);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task CreatePostPhoto_WithPostFromOtherUser_ReturnsForBid()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            IMapper mapper = FakeData.GetIMapperTest();

            var postPhotoService = new PostPhotoService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = GetFakeRequest();

            // Act
            var result = await postPhotoService.CreateAsync(OTHER_POST_ID, request);

            // Assert
            Assert.Equal(403, result.StatusCode);
        }

        [Fact]
        public async Task CreatePostPhoto_WithValidRequest_ReturnsCreated()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            IMapper mapper = FakeData.GetIMapperTest();

            var postPhotoService = new PostPhotoService(mapper, context, currentUserMock.Object, GetStorageServiceMock());
            var request = GetFakeRequest();

            // Act
            var result = await postPhotoService.CreateAsync(MY_POST_ID, request);

            // Assert
            Assert.Equal(201, result.StatusCode);
        }

        [Fact]
        public async Task DeletePostPhoto_WithNonExistsPost_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            IMapper mapper = FakeData.GetIMapperTest();

            var postPhotoService = new PostPhotoService(mapper, context, currentUserMock.Object, GetStorageServiceMock());

            // Act
            var result = await postPhotoService.DeleteAsync(NON_EXIST_POST_ID, MY_PHOTO_ID);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task DeletePostPhoto_WithNonExistsPhoto_ReturnsNotFound()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            IMapper mapper = FakeData.GetIMapperTest();

            var postPhotoService = new PostPhotoService(mapper, context, currentUserMock.Object, GetStorageServiceMock());

            // Act
            var result = await postPhotoService.DeleteAsync(MY_POST_ID, NON_EXIST_PHOTO_ID);

            // Assert
            Assert.Equal(404, result.StatusCode);
        }

        [Fact]
        public async Task DeletePostPhoto_WithPostFromOtherUser_ReturnsForBid()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            IMapper mapper = FakeData.GetIMapperTest();

            var postPhotoService = new PostPhotoService(mapper, context, currentUserMock.Object, GetStorageServiceMock());

            // Act
            var result = await postPhotoService.DeleteAsync(OTHER_POST_ID, MY_PHOTO_ID);

            // Assert
            Assert.Equal(403, result.StatusCode);
        }

        [Fact]
        public async Task DeletePostPhoto_WithValidRequest_ReturnsOk()
        {
            // Arrange
            TeeAppDbContext context = FakeData.GetInMemoryDbTest();
            Mock<ICurrentUser> currentUserMock = FakeData.GetICurrentUserTest();
            IMapper mapper = FakeData.GetIMapperTest();

            var postPhotoService = new PostPhotoService(mapper, context, currentUserMock.Object, GetStorageServiceMock());

            // Act
            var result = await postPhotoService.DeleteAsync(MY_POST_ID, MY_PHOTO_ID);

            // Assert
            Assert.Equal(200, result.StatusCode);
        }
    }
}