using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using TeeApp.Hubs.Interfaces;

namespace TeeApp.Hubs.Hubs
{
    [Authorize]
    public class AppHub : Hub<IAppClient>
    {
    }
}