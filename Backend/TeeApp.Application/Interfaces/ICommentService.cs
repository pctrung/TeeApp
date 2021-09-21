using System.Threading.Tasks;
using TeeApp.Models.Common;

namespace TeeApp.Application.Interfaces
{
    public interface ICommentService
    {
        Task<ApiResult<bool>> CreateAsync();

        Task<ApiResult<bool>> UpdateAsync(int id);

        Task<ApiResult<bool>> DeleteAsync(int id);
    }
}