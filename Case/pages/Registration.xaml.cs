using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Case.Model;

namespace Case.pages
{
    /// <summary>
    /// Логика взаимодействия для Registration.xaml
    /// </summary>
    public partial class Registration : Page
    {
        public Registration()
        {
            InitializeComponent();
        }

        private void btn_goback_Click(object sender, RoutedEventArgs e)
        {
            Static.FrmMain.Navigate(new Authorization());
        }

        private void btn_signin_Click(object sender, RoutedEventArgs e)
        {
            Auth.Registration(txb_name, txb_familia, txb_otchestvo, dpk_birthday, txb_age, cbx_sex, cbx_class, txb_login, txb_password, txb_passwordrep);
        }
    }
}
