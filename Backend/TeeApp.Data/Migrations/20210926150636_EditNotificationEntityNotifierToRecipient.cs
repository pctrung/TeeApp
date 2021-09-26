using Microsoft.EntityFrameworkCore.Migrations;

namespace TeeApp.Data.Migrations
{
    public partial class EditNotificationEntityNotifierToRecipient : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Notifications_Users_NotifierId",
                table: "Notifications");

            migrationBuilder.RenameColumn(
                name: "NotifierId",
                table: "Notifications",
                newName: "RecipientId");

            migrationBuilder.RenameIndex(
                name: "IX_Notifications_NotifierId",
                table: "Notifications",
                newName: "IX_Notifications_RecipientId");

            migrationBuilder.AddForeignKey(
                name: "FK_Notifications_Users_RecipientId",
                table: "Notifications",
                column: "RecipientId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.NoAction);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Notifications_Users_RecipientId",
                table: "Notifications");

            migrationBuilder.RenameColumn(
                name: "RecipientId",
                table: "Notifications",
                newName: "NotifierId");

            migrationBuilder.RenameIndex(
                name: "IX_Notifications_RecipientId",
                table: "Notifications",
                newName: "IX_Notifications_NotifierId");

            migrationBuilder.AddForeignKey(
                name: "FK_Notifications_Users_NotifierId",
                table: "Notifications",
                column: "NotifierId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}