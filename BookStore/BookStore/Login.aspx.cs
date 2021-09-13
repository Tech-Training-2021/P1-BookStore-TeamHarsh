using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace BookStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginUser(object sender,EventArgs e)
        {
            string username = tb_email.Text;
            string password = tb_password.Text;
            int UserId = 0;
            string constr = ConfigurationManager.ConnectionStrings["BookStoreDbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("loginuser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", tb_email.Text);
            cmd.Parameters.AddWithValue("@password", tb_password.Text);
            cmd.Connection = con;
            con.Open();
            UserId = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            switch (UserId)
            {
                case -1:
                    tb_email.Text = "";
                    tb_password.Text = "";
                    Response.Redirect("Login.aspx");
                    break;
                default:
                    Session["UserName"] = tb_email.Text;
                    Session["userid"] = UserId;
                    Response.Redirect("Default.aspx");
                    break;
            }
        }
    }
}