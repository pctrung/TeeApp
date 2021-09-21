﻿using System;

namespace TeeApp.Data.Entities
{
    public abstract class EntityBase
    {
        public int Id { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public DateTime? DateDeleted { get; set; }
    }
}