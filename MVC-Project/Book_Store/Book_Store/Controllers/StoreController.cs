using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Data;
using Data.Entities;
using Data.Repository;
namespace Book_Store.Controllers
{
    public class StoreController : Controller
    {
        // GET: User
        Data.Repository.Store store;
        public StoreController()
        {
            store = new Data.Repository.Store(new BookStoreModel());
        }
        public ActionResult Index()
        {
            var stores = store.GetStores();
            var data = new List<Book_Store.Models.Store>();
            foreach (var c in stores)
            {
                data.Add(Book_Store.Mapper.StoreMapper.Map(c));
            }
            return View(data);
        }
        public ActionResult GetStoreById(int id)
        {

            var findStore = store.GetStoreById(id);
            return View(Book_Store.Mapper.StoreMapper.Map(findStore));
        }


        [HttpGet]
        public string UpdateStoreById(int id)
        {
            //store.UpdateStoreById(id, StoreData);
            return "Store updated successfully";
        }
        [HttpPost]
        public string UpdateStoreById(int id, Data.Entities.Store StoreData)
        {
            store.UpdateStoreById(id, StoreData);
            return "Store updated successfully";
        }
        public string DeleteStoreById(int id)
        {
            store.DeleteStoreById(id);
            return "Store is successfully deleted";
        }
    }
}