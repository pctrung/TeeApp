using System;

namespace TeeApp.Models.ViewModels
{
    public abstract class ViewModelBase
    {
        public int Id { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public UserViewModel Creator { get; set; }
    }
}