//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Case.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Учитель
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Учитель()
        {
            this.Рассписание = new HashSet<Рассписание>();
            this.Чат = new HashSet<Чат>();
        }
    
        public int КодУчителя { get; set; }
        public string ФИО { get; set; }
        public Nullable<int> КодПредмет { get; set; }
        public Nullable<int> КодАвторизаци { get; set; }
        public Nullable<int> КодКласса { get; set; }
    
        public virtual Авторизация Авторизация { get; set; }
        public virtual Класс Класс { get; set; }
        public virtual Предмет Предмет { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Рассписание> Рассписание { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Чат> Чат { get; set; }
    }
}
