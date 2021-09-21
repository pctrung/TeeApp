using Microsoft.EntityFrameworkCore.Migrations;

namespace TeeApp.Data.Migrations
{
    public partial class RemoveSharedPostTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SharedPosts");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SharedPosts",
                columns: table => new
                {
                    SharedByUsersId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    SharedPostsId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SharedPosts", x => new { x.SharedByUsersId, x.SharedPostsId });
                    table.ForeignKey(
                        name: "FK_SharedPosts_Posts_SharedPostsId",
                        column: x => x.SharedPostsId,
                        principalTable: "Posts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SharedPosts_Users_SharedByUsersId",
                        column: x => x.SharedByUsersId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SharedPosts_SharedPostsId",
                table: "SharedPosts",
                column: "SharedPostsId");
        }
    }
}
