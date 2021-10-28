using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeeApp.Utilities.Extentions
{
    public static class DateTimeExtension
    {
        public static DateTime ToVNTimeZone(this DateTime dateTime)
        {
            string vnTimeZoneKey = "SE Asia Standard Time";
            TimeZoneInfo vnTimeZone = TimeZoneInfo.FindSystemTimeZoneById(vnTimeZoneKey);
            DateTime vnTimeNow = TimeZoneInfo.ConvertTimeFromUtc(dateTime, vnTimeZone);
            return vnTimeNow;
        }
    }
}