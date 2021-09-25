using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.PostPhotos;

namespace TeeApp.Application.Interfaces
{
    public interface IPostPhotoService
    {
        Task<ApiResult> CreateAsync(int postId, PostPhotoRequest request);

        Task<ApiResult> DeleteAsync(int postId, int postPhotoId);
    }
}