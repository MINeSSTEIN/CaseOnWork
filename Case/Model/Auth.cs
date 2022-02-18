using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Markup;
using System.Windows.Media;

namespace Case.Model
{
    public class Auth
    {
        private static Dictionary<string, int> classesIndexes = new Dictionary<string, int>();
        /// <summary>
        /// Процедура входа в аккаунт
        /// 
        /// Содержит проверку на наличие введенных данных,
        /// выыодит сообщения о том, что некоторые поля пустые при соответствующем условии.
        /// </summary>
        /// <param name="login">Текст поля для логина</param>
        /// <param name="password">Текст поля для пароля</param>
        public static void Authorisation(TextBox login, TextBox password)
        {
            if(CheckEmpty(login, password))
            {
                if(TryLogin(login, password))
                {
                    Login(login, password);
                }
            }
        }

        /// <summary>
        /// Процедура регистрации пользователя
        /// 
        /// Содержит проверку на наличие введенных данных, 
        /// выыодит сообщения о том, что некоторые поля пустые при соответствующем условии.
        /// 
        /// Добавляет данные в базу при их корректности
        /// </summary>
        /// <param name="name"></param>
        /// <param name="secondName"></param>
        /// <param name="thirdName"></param>
        /// <param name="birthDate"></param>
        /// <param name="age"></param>
        /// <param name="gender"></param>
        /// <param name="className"></param>
        /// <param name="login"></param>
        /// <param name="password"></param>
        /// <param name="passConfirm"></param>
        public static void Registration(
            TextBox fio,
            TextBox address,
            ComboBox className,
            TextBox login,
            TextBox password,
            TextBox passConfirm)
        {
            //Проверка полей на пустоту

            if(CheckEmpty(fio, address, className, login, password, passConfirm))
            {
                CreateUser(fio, address, className, login, password);
                Static.FrmMain.Navigate(new pages.Chat());
            }
        }

        /// <summary>
        /// Заполняет имеющиеся поля с выбором имеющимися в базе значениями.
        /// </summary>
        /// <param name="className">Имя класса</param>
        public static void FillCBs(ComboBox className)
        {
            Static.db.Класс.Load();
            foreach(var a in Static.db.Класс.Local)
            {
                classesIndexes.Add(a.Навзание, a.КодКласса);
                className.Items.Add(a.Навзание);
            }
        }

        /// <summary>
        /// Проверяет поля на пустоту
        /// </summary>
        /// <param name="fio"></param>
        /// <param name="address"></param>
        /// <param name="className"></param>
        /// <param name="login"></param>
        /// <param name="password"></param>
        /// <param name="passConfirm"></param>
        /// <returns></returns>
        private static bool CheckEmpty(
            TextBox fio,
            TextBox address,
            ComboBox className,
            TextBox login,
            TextBox password,
            TextBox passConfirm)
        {
            List<Control> emptyElems = new List<Control>();
            List<TextBox> elems = new List<TextBox>
            {
                fio, address, login, password, passConfirm
            };
            foreach(var a in elems)
            {
                if(a.Text == "")
                {
                    emptyElems.Add(a);
                }
            }
            if(className.Text == "")
            {
                emptyElems.Add(className);
            }
            if(emptyElems.Count > 0 || password.Text != passConfirm.Text)
            {
                MessageBox.Show("Некоторые поля пусты или пароли не совпадают.");
                return false;
            }
            else
            {
                return true;
            }
        }

        private static bool CheckEmpty(TextBox login, TextBox password)
        {
            if(login.Text == "" || password.Text == ""){
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Создает пользователя (ученика) c указанными параметрами.
        /// </summary>
        /// <param name="fio"></param>
        /// <param name="address"></param>
        /// <param name="className"></param>
        /// <param name="login"></param>
        /// <param name="password"></param>
        /// <param name="passConfirm"></param>
        private static void CreateUser(
            TextBox fio,
            TextBox address,
            ComboBox className,
            TextBox login,
            TextBox password)
        {
            Авторизация newAuth = new Авторизация()
            {
                Логин = login.Text,
                Пароль = password.Text
            };
            Static.db.Авторизация.Add(newAuth);
            Static.db.SaveChanges();
            Ученик newStudent = new Ученик()
            {
                ФИО = fio.Text,
                Класс = classesIndexes[className.Text],
                Адрес = address.Text,
                КодАвторизаци = newAuth.КодАвторизация
            };
            Static.db.Ученик.Add(newStudent);
            Static.db.SaveChanges();
            Static.currentAuth = newAuth.КодАвторизация;
        }

        /// <summary>
        /// Проверяет существование пользователя по введенным данным.
        /// </summary>
        /// <param name="login"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private static bool TryLogin(TextBox login, TextBox password)
        {
            //Static.db.Авторизация.Load();
            Авторизация checkAuth = Static.db.Авторизация.FirstOrDefault(x => x.Логин == login.Text && x.Пароль == password.Text );
            if(checkAuth != null)
            {
                if(checkAuth.Ученик != null)
                {
                    Static.isStudent = true;
                }
                else
                {
                    Static.isStudent = false;
                }
                return true;
            }
            else
            {
                MessageBox.Show("Введены неверные логин или пароль.");
                return false;
            }
        }

        private static void Login(TextBox login, TextBox password)
        {
            var user = Static.db.Авторизация.FirstOrDefault(x => x.Логин == login.Text && x.Пароль == password.Text);
            if (Static.isStudent)
            {
                Static.FrmMain.Navigate(new pages.Chat());
            }
        }
    }
}
