using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Data.Entities;

namespace Book_Store.Controllers
{
    public class BookController : Controller
    {
        // GET: User
        Data.Repository.Book book;
        public BookController()
        {
            book = new Data.Repository.Book(new Data.Entities.BookStoreModel());
        }
        public ActionResult Index()
        {
            var books = book.GetBooks();
            var data = new List<Book_Store.Models.Book>();
            foreach (var c in books)
            {
                data.Add(Book_Store.Mapper.BookMapper.Map(c));
            }
            return View(data);
        }
        public ActionResult GetBookById(int id)
        {

            var findBook = book.GetBookById(id);
            return View(Book_Store.Mapper.BookMapper.Map(findBook));
        }
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Store = new SelectList(book.getStore(), "Store_Id", "Store_Name");
            ViewBag.Category = new SelectList(book.GetCategories(), "Category_Id", "Category_Name");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Book_Store.Models.BookViewModel book)
        {
            return View();
        }
        public string UpdateBookById(int id, Data.Entities.Book bookdata)
        {
            book.UpdateBookById(id, bookdata);
            return "Book updated successfully";
        }
        public string DeleteBookById(int id)
        {
            book.DeleteBookById(id);
            return "Book is successfully deleted";
        }
    }
}