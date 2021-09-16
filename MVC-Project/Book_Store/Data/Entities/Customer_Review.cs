namespace Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Customer_Review
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer_Review()
        {
            Books = new HashSet<Book>();
        }

        [Key]
        public int Customer_Review_Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Customer_Name { get; set; }

        public DateTime DateTime { get; set; }

        public decimal Rating { get; set; }

        [Required]
        [StringLength(1000)]
        public string Comment { get; set; }

        public int Book_Id { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Book> Books { get; set; }

        public virtual Book Book { get; set; }
    }
}
