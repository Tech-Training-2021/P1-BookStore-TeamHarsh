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
    public class UserController : Controller
    {
        // GET: User
        Data.Repository.User user;
        public UserController()
        {
            user = new Data.Repository.User(new BookStoreModel());
        }
        public ActionResult Index()
        {
            var users = user.GetUsers();
            var data = new List<Book_Store.Models.User>();
            foreach (var c in users)
            {
                data.Add(Book_Store.Mapper.UserMapper.Map(c));
            }
            return View(data);
        }
        public ActionResult GetUserById(int id) {

            var findUser = user.GetUserById(id);
            return View(Book_Store.Mapper.UserMapper.Map(findUser));
        }
        public string UpdateUserById(int id,Data.Entities.User userdata)
        {
            user.UpdateUserById(id, userdata);
            return "User updated successfully";
        }
        public string DeleteUserById(int id)
        {
            user.DeleteUserById(id);
            return "User is successfully deleted";
        }
    }
}