using System.Windows;
using System.Windows.Controls;

namespace Case.Model
{
    public static class Static
    {
        /// <summary>
        /// Главный фрейм приложения
        /// </summary>
        public static Frame FrmMain = new Frame();
        public static УпшкаEntities db = new УпшкаEntities();
        public static int currentAuth = 0;
        public static bool isStudent = true;
    }
}
