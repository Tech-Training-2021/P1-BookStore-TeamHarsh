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
    public class RoleController : Controller
    {
        // GET: User
        Data.Repository.Role role;
        public RoleController()
        {
            role = new Data.Repository.Role(new BookStoreModel());
        }
        public ActionResult Index()
        {
            var roles = role.GetRoles();
            var data = new List<Book_Store.Models.Role>();
            foreach (var c in roles)
            {
                data.Add(Book_Store.Mapper.RoleMapper.Map(c));
            }
            return View(data);
        }
        public ActionResult GetRoleById(int id)
        {
            var findRole = role.GetRoleById(id);
            return View(Book_Store.Mapper.RoleMapper.Map(findRole));
        }
        public string UpdateRoleById(int id, Data.Entities.Role roledata)
        {
            role.UpdateRoleById(id, roledata);
            return "Role updated successfully";
        }
        public string DeleteUserById(int id)
        {
            role.DeleteRoleById(id);
            return "Role is successfully deleted";
        }
    }
}