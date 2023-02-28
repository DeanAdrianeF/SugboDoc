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
    public partial class PatientPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ELDNET1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblEncBy.Text = Session["name"].ToString();
        }

        protected void saveButton_Click1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "INSERT INTO PATIENTFILE(PATCODE, PATFNAME, PATLNAME, PATMNAME, PATAGE, PATGENDER, PATBDATE, PATADDR, PATTEL, PATFATHNAME, PATMOTHNAME, PATHEIGHT, PATWEIGHT)VALUES(@pcode,@pfname, @plname, @pmname, @page, @pgender, @pbdate, @addr, @ptel, @pfathname, @pmothname, @pheight, @pweight)";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@pcode", pcodeTb.Text);
            cmd.Parameters.AddWithValue("@pfname", fname.Text);
            cmd.Parameters.AddWithValue("@pmname", mname.Text);
            cmd.Parameters.AddWithValue("@plname", lastnametb.Text);
            cmd.Parameters.AddWithValue("@page", ageTb.Text);
            cmd.Parameters.AddWithValue("@pgender", genderddl.Text);
            cmd.Parameters.AddWithValue("@pbdate", bdayTb.Text);
            cmd.Parameters.AddWithValue("@addr", addrsTb.Text);
            cmd.Parameters.AddWithValue("@ptel", teltb.Text);
            cmd.Parameters.AddWithValue("@pfathname", fathtb.Text);
            cmd.Parameters.AddWithValue("@pmothname", mothTb.Text);
            cmd.Parameters.AddWithValue("@pheight", heightTb.Text);
            cmd.Parameters.AddWithValue("@pweight", weightTb.Text);


            int i = cmd.ExecuteNonQuery();
            if (i > 0)
                Response.Write("<script>alert('Entries Recorded')</script>");

            pcodeTb.Text = "";
            fname.Text = "";
            mname.Text = "";
            lastnametb.Text = "";
            ageTb.Text = "";
            genderddl.ClearSelection();
            bdayTb.Text = "";
            addrsTb.Text = "";
            teltb.Text = "";
            fathtb.Text = "";
            mothTb.Text = "";
            heightTb.Text = "";
            weightTb.Text = "";
        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {

        }

        protected void clearButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PatientPage.aspx");

        }

        protected void pcodeTb_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM PATIENTFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();

            bool found = false;

            while (reader.Read())
            {
                if (reader["PATCODE"].ToString().ToUpper() == pcodeTb.Text.ToUpper())
                {
                    found = true;
                    Label19.Text = "Code Already Exist";
                    Response.Write("<script>alert('Patient code already exist. Try different code')</script>");
                    pcodeTb.Text = "";
                    break;
                }
            }
            if (found == false)
            {
                Label19.Text = "";
            }
        }

        protected void fathtb_TextChanged(object sender, EventArgs e)
        {

        }
    }
}