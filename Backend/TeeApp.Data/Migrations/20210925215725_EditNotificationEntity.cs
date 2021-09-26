using Microsoft.EntityFrameworkCore.Migrations;

namespace TeeApp.Data.Migrations
{
    public partial class EditNotificationEntity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserNotifications");

            migrationBuilder.AddColumn<string>(
                name: "NotifierId",
                table: "Notifications",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_NotifierId",
                table: "Notifications",
                column: "NotifierId");

            migrationBuilder.AddForeignKey(
                name: "FK_Notifications_Users_NotifierId",
                table: "Notifications",
                column: "NotifierId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.NoAction);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Notifications_Users_NotifierId",
                table: "Notifications");

            migrationBuilder.DropIndex(
                name: "IX_Notifications_NotifierId",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "NotifierId",
                table: "Notifications");

            migrationBuilder.CreateTable(
                name: "UserNotifications",
                columns: table => new
                {
                    NotificationsId = table.Column<int>(type: "int", nullable: false),
                    NotifiersId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserNotifications", x => new { x.NotificationsId, x.NotifiersId });
                    table.ForeignKey(
                        name: "FK_UserNotifications_Notifications_NotificationsId",
                        column: x => x.NotificationsId,
                        principalTable: "Notifications",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserNotifications_Users_NotifiersId",
                        column: x => x.NotifiersId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserNotifications_NotifiersId",
                table: "UserNotifications",
                column: "NotifiersId");
        }
    }
}