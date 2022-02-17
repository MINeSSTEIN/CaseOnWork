using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Case.Model
{
    public class Auth
    {
        /// <summary>
        /// Процедура входа в аккаунт
        /// 
        /// Содержит проверку на наличие введенных данных,
        /// выыодит сообщения о том, что некоторые поля пустые при соответствующем условии.
        /// </summary>
        /// <param name="login">Текст поля для логина</param>
        /// <param name="password">Текст поля для пароля</param>
        public static void Authorisation(TextBox login, TextBox password) { }

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
            TextBox name,
            TextBox secondName,
            TextBox thirdName,
            DatePicker birthDate,
            TextBox age,
            ComboBox gender,
            ComboBox className,
            TextBox login,
            TextBox password,
            TextBox passConfirm)
        {
            Dictionary<Control, string> dictControls = new Dictionary<Control, string>
            {
                {name, "Имя" },
                {secondName, "" },
                {thirdName, "" },
                {birthDate, "" },
                {age, "" },
                {gender, "" },
                {className, "" },
                {login, "" },
                {password, "" },
                {passConfirm, "" }
            };

            //Проверка полей на пустоту
            List<Control> emptyControls = new List<Control>();

            string strEmptyFields = "";



            foreach(var a in emptyControls)
            {
                strEmptyFields += dictControls[a]+ ", ";
            }
            strEmptyFields.Remove(strEmptyFields.Length-2, 2);
            MessageBox.Show("Пустые поля:" + strEmptyFields);
        }
    }
}
