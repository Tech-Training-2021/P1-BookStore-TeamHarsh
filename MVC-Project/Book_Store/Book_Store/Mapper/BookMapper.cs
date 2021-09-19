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
                Book_Id = book.Book_Id,
                Category_Id = book.Inventory.Category.Category_Name,
                Store_Id = book.Inventory.Store.Store_Name,
                Quantity = book.Inventory.Quantity,
                Book_Details_Id = book.BookDetail_Id,
                Book_Name = book.Book_Detail.Book_Name,
                Book_Author = book.Book_Detail.Book_Author,
                Book_Description = book.Book_Detail.Book_Description,
                Book_Image = book.Book_Detail.Book_Image,
                Book_Price = book.Book_Detail.Book_Price,
                ISBN_10 = book.Book_Detail.ISBN_10,
                Language = book.Book_Detail.Language,
                Total_Pages = book.Book_Detail.Total_Pages,
                Publisher_Name = book.Publication.Publisher_Name,
                Publication_Date = book.Publication.Publication_Date,
            };
        }
        public static Book_Store.Models.BookViewModel MapBookViewModel(Data.Entities.Book book)
        {
            return new Book_Store.Models.BookViewModel()
            {
                Book_Id = book.Book_Id,
                Category_Id = book.Inventory.Category.Category_Name,
                Store_Id = book.Inventory.Store.Store_Name,
                Quantity = book.Inventory.Quantity,
                Book_Name = book.Book_Detail.Book_Name,
                Book_Author = book.Book_Detail.Book_Author,
                Book_Description = book.Book_Detail.Book_Description,
                Book_Image = book.Book_Detail.Book_Image,
                Book_Price = book.Book_Detail.Book_Price,
                ISBN_10 = book.Book_Detail.ISBN_10,
                Language = book.Book_Detail.Language,
                Total_Pages = book.Book_Detail.Total_Pages,
                Publisher_Name = book.Publication.Publisher_Name,
                Publication_Date = book.Publication.Publication_Date,
            };
        }
        public static Data.Entities.Book Map(Book_Store.Models.BookViewModel book)
        {
            return new Data.Entities.Book()
            {
                Book_Id = book.Book_Id,
            };
        }

    }
}