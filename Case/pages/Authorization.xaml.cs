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
using Case.pages;

namespace Case.pages
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Page
    {
        public Authorization()
        {
            InitializeComponent();
        }

        private void btn_registr_Click(object sender, RoutedEventArgs e)
        {
            frm_Authorization.Navigate(new Registration());
        }

        private void btn_login_Click(object sender, RoutedEventArgs e)
        {
            Model.Auth.Authorisation(txb_login, txb_password);
        }
    }
}
