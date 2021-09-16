using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Store.Mapper
{
    public class RoleMapper
    {
        public static Book_Store.Models.Role Map(Data.Entities.Role role)
        {
            return new Book_Store.Models.Role()
            {
                Role1 = role.Role1,
                Role_Name = role.Role_Name
            };
        }
    }
}