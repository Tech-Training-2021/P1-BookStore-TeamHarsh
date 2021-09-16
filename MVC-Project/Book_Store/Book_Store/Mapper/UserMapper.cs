using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Store.Mapper
{
    public class UserMapper
    {
        public static Book_Store.Models.User Map(Data.Entities.User user)
        {
            return new Book_Store.Models.User()
            {
                User_Id = user.User_Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                MobileNumber = user.MobileNumber,
                Email = user.Email,
                Password = user.Password,
                Role_Id = user.Role.Role_Name
            };
        }
    }
}