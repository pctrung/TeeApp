using System;

namespace TeeApp.Utilities.Exceptions
{
    public class TeeAppForBidException : Exception
    {
        public TeeAppForBidException()
        {
        }

        public TeeAppForBidException(string message)
            : base(message)
        {
        }

        public TeeAppForBidException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }
}