using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TeeApp.Utilities.Constants;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.RequestModels.Common
{
    public class PaginationRequestBase
    {
        private int _limit;
        private string _keyword;
        private int _page;

        [DefaultValue(1)]
        [Range(0, int.MaxValue, ErrorMessage = "Only positive number allowed")]
        public virtual int Page
        {
            get => _page > 0 ? _page : 1;
            set => _page = value;
        }

        [DefaultValue(0)]
        [Range(0, int.MaxValue, ErrorMessage = "Only positive number allowed")]
        public virtual int Limit
        {
            get => (_limit <= 0) ? int.MaxValue : _limit;
            //get => (_limit == 0) ? SystemConstants.DEFAULT_LIMIT : _limit;
            set => _limit = (value == 0) ? int.MaxValue : value;
        }

        [DefaultValue("")]
        public virtual string Keyword
        {
            get => string.IsNullOrWhiteSpace(_keyword) ? "" : _keyword;
            set => _keyword = value;
        }

        public virtual int SortField { get; set; }

        public virtual SortType SortType { get; set; }

        public int GetSkip()
        {
            return (Page - 1) * Limit;
        }

        public int GetTake()
        {
            return Limit;
        }
    }
}