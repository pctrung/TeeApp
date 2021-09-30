using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Reactions;
using TeeApp.Models.ResponseModels.Reactions;

namespace TeeApp.Application.Interfaces
{
    public interface IReactionService
    {
        Task<ApiResult<ReactionResponse>> CreateAsync(int postId, ReactionRequest request);

        Task<ApiResult<ReactionResponse>> UpdateAsync(int postId, ReactionRequest request);

        Task<ApiResult<ReactionResponse>> DeleteAsync(int postId);
    }
}