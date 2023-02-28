using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ELDNET_ClinicSystem
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Documents\ELDNET1.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "SELECT * FROM ADMINTABLE WHERE EMPUSERNAME = '" + LoginUsername.Text + "' and EMPPASSWORD = '" + LoginPassword.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, con);

            SqlDataReader dr = cmd.ExecuteReader();
            bool found = false;
            string username = "";

            while (dr.Read())
            {
                username = dr["EMPUSERNAME"].ToString();
                found = true;
            }

            if (found == true)
            {
                Session["name"] = LoginUsername.Text;
                //Session["username"] = username;
                Response.Redirect("~/HomePage.aspx");
            }
            else
                Response.Write("<script>alert('Please check Username or Password')</script>");
            //LoginStatusLabel.Text = "Invalid Login";


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MembershipRegistration.aspx");

        }

        protected void LoginUsername_TextChanged(object sender, EventArgs e)
        {

        }
    }
}