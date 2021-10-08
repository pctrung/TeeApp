using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.PostPhotos;
using TeeApp.Models.ResponseModels.Posts;

namespace TeeApp.Application.Interfaces
{
    public interface IPostPhotoService
    {
        Task<ApiResult<PostResponse>> CreateAsync(int postId, PostPhotoRequest request);

        Task<ApiResult<PostResponse>> DeleteAsync(int postId, int postPhotoId);
    }
}