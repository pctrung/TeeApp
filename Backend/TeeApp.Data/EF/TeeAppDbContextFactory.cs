using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System.IO;
using TeeApp.Utilities.Constants;

namespace TeeApp.Data.EF
{
    public class TeeAppDbContextFactory : IDesignTimeDbContextFactory<TeeAppDbContext>
    {
        public TeeAppDbContext CreateDbContext(string[] args)
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            var connectionString = configuration.GetConnectionString(SystemConstants.CONNECTION_NAME);

            var optionsBuilder = new DbContextOptionsBuilder<TeeAppDbContext>();
            optionsBuilder.UseSqlServer(connectionString);

            return new TeeAppDbContext(optionsBuilder.Options);
        }
    }
}