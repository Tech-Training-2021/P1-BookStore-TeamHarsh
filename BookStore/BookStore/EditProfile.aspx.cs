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
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            getUserDetails();
            }
        }
        protected void getUserDetails() 
        {
            int userid = Convert.ToInt32(Session["userid"]);
            string constr = ConfigurationManager.ConnectionStrings["BookStoreDbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("GETUSERDETAILS");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Connection = con;
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    tb_fname.Text = reader["FirstName"].ToString();
                    tb_lname.Text = reader["LastName"].ToString();
                    tb_mobileNo.Text =reader["MobileNumber"].ToString();
                    tb_email.Text = reader["Email"].ToString();
                }
            }
            con.Close();
        }
        protected void UpdateUser(object sender,EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["BookStoreDbConnectionString"].ConnectionString;
            SqlConnection connection;
            SqlCommand command;
            string query = "UPDATEUSERDETAILS";
            using (connection = new SqlConnection(conString))
            {
                try
                {
                    using (command = new SqlCommand(query, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        SqlParameter parameter;
                        parameter = command.Parameters.Add("@userid", SqlDbType.Int);
                        parameter.Value = Convert.ToInt32(Session["userid"]);

                        parameter = command.Parameters.Add("@fname", SqlDbType.VarChar);
                        parameter.Value = tb_fname.Text;
                        parameter = command.Parameters.Add("@lname", SqlDbType.VarChar);
                        parameter.Value = tb_lname.Text;
                        parameter = command.Parameters.Add("@mobileNo", SqlDbType.VarChar);
                        parameter.Value = tb_mobileNo.Text;
                        parameter = command.Parameters.Add("@email", SqlDbType.VarChar);
                        parameter.Value = tb_email.Text;
                        connection.Open();

                        int rowsAffected = command.ExecuteNonQuery();
                        Console.WriteLine($"Cat name updated, {rowsAffected} row(s) affected");
                        Response.Write("<script>alert('Details Updated Successfully');</script>");
                    }
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}