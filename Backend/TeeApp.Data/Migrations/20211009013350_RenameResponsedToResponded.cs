using Microsoft.EntityFrameworkCore.Migrations;

namespace TeeApp.Data.Migrations
{
    public partial class RenameResponsedToResponded : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ResponsedDate",
                table: "Friendships",
                newName: "RespondedDate");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "RespondedDate",
                table: "Friendships",
                newName: "ResponsedDate");
        }
    }
}
