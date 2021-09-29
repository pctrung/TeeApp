using System;

namespace TeeApp.Utilities.Exceptions
{
    public class TeeAppNotFoundException : Exception
    {
        public TeeAppNotFoundException()
        {
        }

        public TeeAppNotFoundException(string message)
            : base(message)
        {
        }

        public TeeAppNotFoundException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }
}