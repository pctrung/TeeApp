using System;

namespace TeeApp.Utilities.Exceptions
{
    public class TeeAppException : Exception
    {
        public TeeAppException()
        {
        }

        public TeeAppException(string message)
            : base(message)
        {
        }

        public TeeAppException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }
}