using System.Collections.Generic;
using System.Linq;

namespace TeeApp.Utilities.Extentions
{
    public static class PaginationExtension
    {
        public static IQueryable<T> Paged<T>(this IQueryable<T> source, int page, int limit)
        {
            limit = limit <= 0 ? int.MaxValue : limit;
            page = page <= 0 ? 1 : page;
            return source.Skip((page - 1) * limit).Take(limit);
        }

        public static IEnumerable<T> Paged<T>(this IEnumerable<T> source, int page, int limit)
        {
            limit = limit <= 0 ? int.MaxValue : limit;
            page = page <= 0 ? 1 : page;
            return source.Skip((page - 1) * limit).Take(limit);
        }
    }
}