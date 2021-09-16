using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Book_Store
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "User",
                url: "{controller}/{action}",
                defaults: new { controller = "User", action = "Index" }
            );
            routes.MapRoute(
                name: "UserById",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "User", action = "GetUserById" }
            );
            routes.MapRoute(
                  name: "DeleteUserByUserID",
                  url: "{controller}/{action}/{id}",
                  defaults: new { controller = "User", action = "DeleteUserById" }
              );
        }
    }
}
