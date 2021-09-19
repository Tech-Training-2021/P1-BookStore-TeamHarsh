using Data.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Data.Repository
{
    public class Book : IBook
    {
        private BookStoreModel db;
        public Book(BookStoreModel db)
        {
            this.db = db;
        }
        public IEnumerable<Data.Entities.Book> GetBooks()
        {
            return db.Books
                  .Include("Inventory")
                  .Include("Book_Detail")
                  .Include("Publication")
                  .ToList();
        }
        public Data.Entities.Book GetBookById(int id)
        {
            if (id > 0)
            {
                var book = db.Books
                    .Include(i => i.Inventory)
                    .Include(b => b.Book_Detail)
                    .Include(p => p.Publication)
                    .Where(c => c.Book_Id == id)
                    .FirstOrDefault();
                if (book != null)
                    return book;
                else
                {
                    return null;
                }
            }
            else
            {
                throw new ArgumentException("Id cannot be less than 0");
            }
        }
        public void AddBook(Data.Entities.Book book)
        {
            db.Books.Add(book);
            save();
        }
        public void UpdateBookById(int id, Data.Entities.Book book)
        {
            var getBook = db.Books.Where<Data.Entities.Book>(u => u.Book_Id == id).First();
            if (getBook != null)
            {
                db.Books.AddOrUpdate(getBook);
                save();
                return;
            }
            else
            {
                throw new ArgumentException($"No Book Found With the id : {id}");
            }
            throw new ArgumentException("Id cannot be less than 0");
        }
        public void DeleteBookById(int id)
        {
            var book = db.Books.Where<Data.Entities.Book>(u => u.Book_Id == id).First();
            if (book != null)
            {
                db.Books.Remove(book);
                save();
                return;
            }
            else
            {
                throw new ArgumentException($"No Book Found With the id : {id}");
            }
            throw new ArgumentException("Id cannot be less than 0");
        }
        public void save()
        {
            db.SaveChanges();
        }
        public IEnumerable<Data.Entities.Store> getStore()
        {
            return db.Stores
                .Include("Location")
                .ToList(); ;
        }
        public IEnumerable<Data.Entities.Category> GetCategories()
        {
            return db.Categories.ToList();
        }
    }
}
