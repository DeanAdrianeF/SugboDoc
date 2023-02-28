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
    public partial class PrescriptionPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ELDNET1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblPrep.Text = Session["name"].ToString();
            if (!Page.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[6] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five"), new DataColumn("six") });
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                MedicineGridView.DataSource = dt;
                MedicineGridView.DataBind();
                ViewState["dt"] = dt;
                ViewState["count"] = 0;
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "INSERT INTO PRESCRIPTIONHEADERFILE(PRESHCODE, PRESHCONSNO, PRESHDATE, PRESHPATCODE, PRESHPREPBY) VALUES(@PresHcode,@PresHconsno,@PresHdate, @PresHpatcode, @Preshprepby)";
            SqlCommand cmd = new SqlCommand(sql, con);
            

            cmd.Parameters.AddWithValue("@PresHcode", PresNotb.Text);
            cmd.Parameters.AddWithValue("@PresHconsno", ConsNotb.Text);
            cmd.Parameters.AddWithValue("@PresHdate", PresHdatetb.Text);
            cmd.Parameters.AddWithValue("@PresHpatcode", PresHpatcodetb.Text);
            cmd.Parameters.AddWithValue("@Preshprepby", lblPrep.Text);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
                Response.Write("<script>alert('Record Saved Successfuly')</script>");
            con.Close();
            //  THIS IS TO INSERT IN PRESCRIPTIONDETAILFILE TABLE
            for (int a = 0; a < (int)ViewState["count"]; a++)
            {
                con.Open();
                sql = "INSERT INTO PRESCRIPTIONDETAILFILE(PREDCODE, PREDMEDCODE, PREDQTY, PREDREMARKS) VALUES(@PresDcode, @PresDmedcode, @PresDqnty, @PresDremarks)";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@PresDcode", PresNotb.Text);
                cmd.Parameters.AddWithValue("@PresDmedcode", MedicineGridView.Rows[a].Cells[0].Text);
                cmd.Parameters.AddWithValue("@PresDqnty", Convert.ToInt32(MedicineGridView.Rows[a].Cells[4].Text));
                cmd.Parameters.AddWithValue("@PresDremarks", MedicineGridView.Rows[a].Cells[5].Text);
                cmd.ExecuteNonQuery();
                con.Close();


                ConsNotb.Text = "";
                PresHdatetb.Text = "";
                PresHpatcodetb.Text = "";
                PresHpatnametb.Text = "";
                PresHagetb.Text = "";
                PresHmedcodetb.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[6] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five"), new DataColumn("six") });
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                dt.Rows.Add("", "", "", "", "", "");
                MedicineGridView.DataSource = dt;
                MedicineGridView.DataBind();
                ViewState["dt"] = dt;
                ViewState["count"] = 0;
            }
            PresNotb.Text = "";
        }

        protected void PresNotb_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM PRESCRIPTIONHEADERFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;

            while (dr.Read())
            {
                if (dr["PRESHCODE"].ToString().ToUpper() == PresNotb.Text.ToUpper())
                {
                    found = true;
                    Label13.Text = "Code Exist";
                    Response.Write("<script>alert('Patient code already exist. Try different code')</script>");
                    PresNotb.Text = "";
                    break;
                }
            }
            if (found == false)
            {
                Label13.Text = "";
            }
        }

        protected void ConsNotb_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM CONSULTATIONHEADERFILE , PATIENTFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;

            while (dr.Read())
            {
                if (dr["CONHNO"].ToString().ToUpper() == ConsNotb.Text.ToUpper())
                {
                    found = true;
                    Label14.Text = "";
                    PresHpatcodetb.Text = dr["CONHPATCODE"].ToString();
                    if (dr["PATCODE"].ToString() == PresHpatcodetb.Text)
                    {
                        found = true;
                        PresHpatnametb.Text = dr["PATFNAME"] + " " + dr["PATMNAME"] + " " + dr["PATLNAME"].ToString();
                        PresHagetb.Text = dr["PATAGE"].ToString();
                        break;
                    }
                }
            }
            if (found == false)
            {
                Label14.Text = "Invalid Code";
                Response.Write("<script>alert('Code did not Exist')</script>");
                ConsNotb.Text = "";
                PresHpatcodetb.Text = "";
                PresHpatnametb.Text = "";
                PresHagetb.Text = "";
            }
        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(TextBox8.Text) < 1)
            {
                Response.Write("<script>alert('0 is not accepted')</script>");
                TextBox8.Text = "";
                return;
            }

            int rowCount = (int)ViewState["count"];
            for (int i = 0; i < MedicineGridView.Rows.Count; i++)
                if (PresHmedcodetb.Text == MedicineGridView.Rows[i].Cells[0].Text)
                {
                    MedicineGridView.Rows[i].Cells[4].Text = TextBox8.Text;
                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[6] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five"), new DataColumn("six") });
                    dt.Rows.Add(MedicineGridView.Rows);
                }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PrescriptionPage.aspx");
        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            int rowCount = (int)ViewState["count"];
            for (int i = 0; i < MedicineGridView.Rows.Count; i++)
                if (PresHmedcodetb.Text == MedicineGridView.Rows[i].Cells[0].Text)
                {
                    MedicineGridView.Rows[i].Cells[5].Text = TextBox9.Text;
                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[6] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five"), new DataColumn("six") });
                    dt.Rows.Add(MedicineGridView.Rows);
                }
        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {
            int row = (int)ViewState["count"];
            while (row > -1)
            {
                if (PresHmedcodetb.Text == MedicineGridView.Rows[row].Cells[0].Text)
                {
                    PresHmedcodetb.Text = "";
                    Label15.Text = "Invalid Code";
                }
                else
                    Label15.Text = "";

                row--;
            }
            row = (int)ViewState["count"];
            string connectionString = ConfigurationManager.ConnectionStrings["ELDNET1"].ConnectionString;
            SqlConnection prescriptionPage = new SqlConnection(connectionString);

            string sql = "SELECT * FROM MEDICINEFILE WHERE MEDCODE = '" + PresHmedcodetb.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, prescriptionPage);
            prescriptionPage.Open();

            SqlDataReader dr = cmd.ExecuteReader(); ;
            bool found = false;
            while (dr.Read())
            {
                found = true;
                MedicineGridView.Rows[row].Cells[0].Text = dr["MEDCODE"].ToString();
                MedicineGridView.Rows[row].Cells[1].Text = dr["MEDNAME"].ToString();
                MedicineGridView.Rows[row].Cells[2].Text = dr["MEDDOSE"].ToString();
                MedicineGridView.Rows[row].Cells[3].Text = dr["MEDDESC"].ToString();
                ViewState["count"] = (int)ViewState["count"] + 1;
                Label15.Text = "";

            }
            if (found == false)
            {
                Response.Write("<script>alert('Medicine Code did not exist.')</script>");
                Label15.Text = "Invalid Code";
                PresHmedcodetb.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
            }
        }

        protected void PresHpatcodetb_TextChanged(object sender, EventArgs e)
        {

        }

        protected void PresHpatnametb_TextChanged(object sender, EventArgs e)
        {

        }
        protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void MedicineGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}