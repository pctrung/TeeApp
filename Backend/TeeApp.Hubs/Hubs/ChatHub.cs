using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Hubs.Interfaces;

namespace TeeApp.Hubs.Hubs
{
    [Authorize]
    public class ChatHub : Hub<IChatClient>
    {
        private static readonly List<string> _onlineUserNameList = new();
        private const int DELAY_TIME = 2500;

        public override async Task OnConnectedAsync()
        {
            await Task.Delay(DELAY_TIME);

            await base.OnConnectedAsync();

            if (!_onlineUserNameList.Contains(Context.UserIdentifier))
            {
                _onlineUserNameList.Add(Context.UserIdentifier);
                await Clients.All.ReceiveUpdatedOnlineUserNameList(_onlineUserNameList);
            }
        }

        public override async Task OnDisconnectedAsync(Exception e)
        {
            await Task.Delay(DELAY_TIME);

            await base.OnDisconnectedAsync(e);

            if (_onlineUserNameList.Contains(Context.UserIdentifier))
            {
                _onlineUserNameList.Remove(Context.UserIdentifier);
                await Clients.All.ReceiveUpdatedOnlineUserNameList(_onlineUserNameList);
            }
        }
    }
}