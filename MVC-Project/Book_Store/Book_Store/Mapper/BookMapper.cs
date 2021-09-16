using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Store.Mapper
{
    public class BookMapper
    {
        public static Book_Store.Models.Book Map(Data.Entities.Book book)
        {
            return new Book_Store.Models.Book()
            {
               /* Book_Id = book.Book_Id,
                Inventory_Id=book.Inventory.Quantity,
                BookDetail_Id=book.
                FirstName = user.FirstName,
                LastName = user.LastName,
                MobileNumber = user.MobileNumber,
                Email = user.Email,
                Password = user.Password,
                Role_Id = user.Role.Role_Name*/
            };
        }
    }
}