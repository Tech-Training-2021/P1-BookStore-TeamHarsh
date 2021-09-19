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
    public class LocationController : Controller
    {
        // GET: User
        Data.Repository.Location location;
        public LocationController()
        {
            location = new Data.Repository.Location(new BookStoreModel());
        }
        public ActionResult Index()
        {
            var locations = location.GetLocations();
            var data = new List<Book_Store.Models.Location>();
            foreach (var c in locations)
            {
                data.Add(Book_Store.Mapper.LocationMapper.Map(c));
            }
            return View(data);
        }
        public ActionResult GetLocationById(int id)
        {

            var findLocation = location.GetLocationById(id);
            return View(Book_Store.Mapper.LocationMapper.Map(findLocation));
        }
        public string UpdateLocationById(int id, Data.Entities.Location locationData)
        {
            location.UpdateLocationById(id, locationData);
            return "Location updated successfully";
        }
        public string DeleteLocationById(int id)
        {
            location.DeleteLocationById(id);
            return "Location is successfully deleted";
        }
    }
}