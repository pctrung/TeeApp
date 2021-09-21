using System.Collections.Generic;

namespace TeeApp.Models.ResponseModels.Common
{
    public abstract class HubResponseBase
    {
        public List<string> RecipientUserNames { get; set; }
    }
}