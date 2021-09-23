using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace Book_Store.Models
{
    public class OrderHistory
    {
        public int id { get; set; }

        [DisplayName("User Id")]
        public int userid { get; set; }

        [DisplayName("Book Name")]
        public string Book_Id { get; set; }

        public int Quantity { get; set; }

        public int Total_Price { get; set; }

        public DateTime date { get; set; }

    }
}