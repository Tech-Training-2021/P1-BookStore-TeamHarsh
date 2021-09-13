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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        protected void RegisterUser(object sender,EventArgs e)
        {
            string f_name = fname.Text;
            string l_name = lname.Text;
            string mobile_no = phone.Text;
            string u_email = email.Text;
            string u_password = password.Text;
            string query = "AddUser";
            string ConString = ConfigurationManager.ConnectionStrings["BookStoreDbConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(ConString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter;
                    parameter = command.Parameters.Add("@fname", SqlDbType.VarChar);
                    parameter.Value = f_name;
                    parameter = command.Parameters.Add("@lname", SqlDbType.VarChar);
                    parameter.Value = l_name;
                    parameter = command.Parameters.Add("@mobileNo", SqlDbType.VarChar);
                    parameter.Value = mobile_no;
                    parameter = command.Parameters.Add("@email", SqlDbType.VarChar);
                    parameter.Value = u_email;
                    parameter = command.Parameters.Add("@password", SqlDbType.VarChar);
                    parameter.Value = u_password;
                    parameter = command.Parameters.Add("@role_id", SqlDbType.Int);
                    parameter.Value = 1;
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            fname.Text = "";
            lname.Text = "";
            phone.Text = "";
            email.Text = "";
            password.Text = "";
            confirmPassword.Text = "";
        }
    }
}