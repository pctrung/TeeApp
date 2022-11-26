using System.Collections.Generic;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Utilities.Constants
{
    public class SystemConstants
    {
        public const string ADMIN_USERNAME = "teeadmin";
        public const string CONNECTION_NAME = "DefaultConnection";
        public const string IMAGE_FOLDER = "files";
        public const string DEFAULT_FOLDER = "default";
        public const string CHAT_HUB_CONFIG = "ChatHubUrl";
        public const string APP_HUB_CONFIG = "AppHubUrl";
        public const int DEFAULT_LIMIT = 50;
        public const string DEFAULT_COVER = "default-cover.jpg";
        public const string BLOCKED_KEYWORDS_SEPARATOR = "@_)@#$!@#$";

        private static readonly Dictionary<Gender, string> dictionary = new()
        {
            { Gender.Male, "default-male.svg" },
            { Gender.Female, "default-female.svg" },
            { Gender.Other, "default-other.svg" }
        };

        public static readonly Dictionary<Gender, string> DEFAULT_AVATAR = dictionary;
    }
}