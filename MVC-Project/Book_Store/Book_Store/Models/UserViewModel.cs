using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Store.Models
{
    public class UserViewModel
    {
        public Login Login { get; set; }
        public Register Register { get; set; }
    }
    public class Register
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MobileNumber { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
    public class Login
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}