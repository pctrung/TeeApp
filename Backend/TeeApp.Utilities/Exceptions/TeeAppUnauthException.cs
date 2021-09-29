using System;

namespace TeeApp.Utilities.Exceptions
{
    public class TeeAppUnauthException : Exception
    {
        public TeeAppUnauthException()
        {
        }

        public TeeAppUnauthException(string message)
            : base(message)
        {
        }

        public TeeAppUnauthException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }
}