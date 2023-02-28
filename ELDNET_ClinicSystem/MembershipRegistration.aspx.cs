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
    public partial class MembershipRegistration : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Documents\ELDNET1.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "SELECT * FROM ADMINTABLE";
            SqlCommand cmd = new SqlCommand(sql, con);
            

            SqlDataReader reader = cmd.ExecuteReader();

            bool found = false;

            while (reader.Read())
            {
                if (reader["EMPUSERNAME"].ToString().ToUpper() == TextBox1.Text.ToUpper())
                {
                    found = true;
                    Label4.Text = "Username Already Exist!";
                    Response.Write("<script>alert('Username Already Exist')</script>");
                    TextBox1.Text = "";
                    break;
                }
            }
            if (found == false)
            {
                Label4.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM ADMINTABLE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();

            cmd.Parameters.AddWithValue("@user", TextBox1.Text);
            cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
            cmd.Parameters.AddWithValue("@conpass", TextBox3.Text);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
                Response.Write("<script>alert('Account Saved Successfuly')</script>");
            TextBox1.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }
}