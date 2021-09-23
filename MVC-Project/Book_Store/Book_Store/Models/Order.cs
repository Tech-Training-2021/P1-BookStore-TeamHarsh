using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Store.Models
{
    public class Order
    {
        public int OrderId { get; set; }
        public int OrderDetailsid { get; set; }
        public int bookid { get; set; }
        public string ImageUrl { get; set; }
        public string BookName { get; set; }
        public int Quantity { get; set; }
        public int price { get; set; }
        public int totalPrice { get; set; }
    }
}