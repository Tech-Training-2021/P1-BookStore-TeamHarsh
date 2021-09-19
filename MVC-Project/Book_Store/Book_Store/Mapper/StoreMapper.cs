using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Store.Mapper
{
    public class StoreMapper
    {
        public static Book_Store.Models.Store Map(Data.Entities.Store store)
        {
            return new Book_Store.Models.Store()
            {
                Store_Id = store.Store_Id,
                Location_Id = store.Location.Location_Name,
                Store_Name = store.Store_Name
            };
        }
    }
}