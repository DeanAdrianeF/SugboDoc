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
    public partial class ConsultationPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ELDNET1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblPrep.Text = Session["name"].ToString();
            if (!Page.IsPostBack)
            {
                //This is to add column slots in gridview.
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three") });
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                ConsultationGridView.DataSource = dt;
                ConsultationGridView.DataBind();
                ViewState["dt"] = dt;
                ViewState["count"] = 0;
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ConsultationPage.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM CONSULTATIONHEADERFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dt = cmd.ExecuteReader();

            bool found = false;

            while (dt.Read())
            {
                if (dt["CONHNO"].ToString().ToUpper() == Consultationtb.Text.ToUpper())
                {
                    found = true;
                    Label23.Text = "Code Exist";
                    Response.Write("<script>alert('Consultation code already exist. Try different code')</script>");
                    Consultationtb.Text = "";
                    break;
                }
            }
            if (found == false)
            {
                Label23.Text = "";
            }
        }

        protected void ConsImmtb_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM CONSULTATIONHEADERFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dt = cmd.ExecuteReader();

            bool found = false;

            while (dt.Read())
            {
                if (dt["CONHIMMREF"].ToString().ToUpper() == ConsImmtb.Text.ToUpper())
                {
                    found = true;
                    Label24.Text = "Number Exist";
                    Response.Write("<script>alert('Immunization Number already exist. Try different code')</script>");
                    ConsImmtb.Text = "";
                    break;
                }
            }
            if (found == false)
            {
                Label24.Text = "";
            }
        }

        protected void ConsPatCodetb_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM PATIENTFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;

            while (dr.Read())
            {
                if (dr["PATCODE"].ToString().ToUpper() == ConsPatCodetb.Text.ToUpper())
                {
                    found = true;
                    Label25.Text = "";

                    ConsPatNametb.Text = dr["PATFNAME"] + " " + dr["PATMNAME"] + " " + dr["PATLNAME"].ToString();
                    ConsPatAddtb.Text = dr["PATADDR"].ToString();
                    ConsPatTeltb.Text = dr["PATTEL"].ToString();
                    ConsPatFathtb.Text = dr["PATFATHNAME"].ToString();
                    ConsPatMothtb.Text = dr["PATMOTHNAME"].ToString();
                    ConsPatGentb.Text = dr["PATGENDER"].ToString();
                    ConsPatBdaytb.Text = dr["PATBDATE"].ToString();
                    ConsPatAgetb.Text = dr["PATAGE"].ToString();
                    ConsPatWeighttb.Text = dr["PATWEIGHT"].ToString();
                    ConsPatHeighttb.Text = dr["PATHEIGHT"].ToString();
                    break;
                }
            }
            if (found == false)
            {
                Label25.Text = "Invalid Code";
                Response.Write("<script>alert('Code did not Exist')</script>");
                ConsPatCodetb.Text = "";
                ConsPatNametb.Text = "";
                ConsPatAddtb.Text = "";
                ConsPatTeltb.Text = "";
                ConsPatFathtb.Text = "";
                ConsPatMothtb.Text = "";
                ConsPatGentb.Text = "";
                ConsPatBdaytb.Text = "";
                ConsPatAgetb.Text = "";
                ConsPatWeighttb.Text = "";
                ConsPatHeighttb.Text = "";
            }

        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "INSERT INTO CONSULTATIONHEADERFILE(CONHNO, CONHIMMREF, CONHDATE, CONHPATCODE, CONHPATWEIGHT, CONHPATHEIGHT, CONHBODYTEMP, CONHPREPBY, CONHEXAMBY, CONHREFSLIPS) " +
                "VALUES(@ConsHno,@ConsHimmrefno,@ConsHdate, @ConsHpcode, @ConsHpatW,@ConsHpatH,@ConsHbodyT,@ConsHprepby,@ConsHxby,@slip)";
            SqlCommand cmd = new SqlCommand(sql, con);


            cmd.Parameters.AddWithValue("@ConsHno", Consultationtb.Text);
            cmd.Parameters.AddWithValue("@ConsHimmrefno", ConsImmtb.Text);
            cmd.Parameters.AddWithValue("@ConsHdate", ConsuldataionDatetb.Text);
            cmd.Parameters.AddWithValue("@ConsHpcode", ConsPatCodetb.Text);
            cmd.Parameters.AddWithValue("@ConsHpatW", ConsPatWeighttb.Text);
            cmd.Parameters.AddWithValue("@ConsHpatH", ConsPatHeighttb.Text);
            cmd.Parameters.AddWithValue("@ConsHbodyT", ConsPatBodyTemptb.Text);
            cmd.Parameters.AddWithValue("@ConsHprepby", lblPrep.Text);
            cmd.Parameters.AddWithValue("@ConsHxby", ExamBytb2.Text);
            if (CheckBox3.Checked && !CheckBox2.Checked)
            {
                Label31.Text = "AD";
                cmd.Parameters.AddWithValue("@slip", Label31.Text);
            }
            if (CheckBox2.Checked && !CheckBox3.Checked)
            {
                Label31.Text = "LT";
                cmd.Parameters.AddWithValue("@slip", Label31.Text);
            }
            if (CheckBox3.Checked && CheckBox2.Checked)
            {
                Label31.Text = "BT";
                cmd.Parameters.AddWithValue("@slip", Label31.Text);
            }
            if (!CheckBox3.Checked && !CheckBox2.Checked)
            {
                Label31.Text = "N/A";
                cmd.Parameters.AddWithValue("@slip", Label31.Text);
            }
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
                Response.Write("<script>alert('Record Saved Successfuly')</script>");
            con.Close();

            //  THIS IS TO INSERT IN PRESCRIPTIONDETAILFILE 
            for (int a = 0; a < (int)ViewState["count"]; a++)
            {
                con.Open();
                sql = "INSERT INTO CONSULTATIONDETAILFILE(CONDNO, CONDDIAGCODE, CONDNOTES) VALUES(@ConsDcode, @ConsDdcode, @ConsDnotes)";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@ConsDcode", Consultationtb.Text);
                cmd.Parameters.AddWithValue("@ConsDdcode", ConsultationGridView.Rows[a].Cells[0].Text);
                cmd.Parameters.AddWithValue("@ConsDnotes", ConsultationGridView.Rows[a].Cells[2].Text);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            clearall();
        }
        protected void clearall()
        {
            // Method for clearing all inputted records
            ConsImmtb.Text = "";
            ConsuldataionDatetb.Text = "";
            ConsPatCodetb.Text = "";
            ConsPatNametb.Text = "";
            ConsPatAddtb.Text = "";
            ConsPatTeltb.Text = "";
            ConsPatFathtb.Text = "";
            ConsPatMothtb.Text = "";
            ConsPatGentb.Text = "";
            ConsPatBdaytb.Text = "";
            ConsPatAgetb.Text = "";
            ConsPatWeighttb.Text = "";
            ConsPatHeighttb.Text = "";
            ConsPatBodyTemptb.Text = "";
            ExamBytb1.Text = "";
            ExamBytb2.Text = "";
            ConsNotes.Text = "";

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three") });
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            ConsultationGridView.DataSource = dt;
            ConsultationGridView.DataBind();
            ViewState["dt"] = dt;
            ViewState["count"] = 0;

            ConsDiagCode.Text = "";
            Consultationtb.Text = "";
            CheckBox3.Checked = false;
            CheckBox2.Checked = false;
        }

        protected void TextBox22_TextChanged(object sender, EventArgs e)
        {
            int row = (int)ViewState["count"];
            while (row > -1)
            {
                if (ConsDiagCode.Text == ConsultationGridView.Rows[row].Cells[0].Text)
                {
                    ConsDiagCode.Text = "";
                    Response.Write("<script>alert('You entered the code twice.')</script>");
                }
                else
                    Label28.Text = "";

                row--;
            }
            row = (int)ViewState["count"];
            string connectionString = ConfigurationManager.ConnectionStrings["ELDNET1"].ConnectionString;
            SqlConnection consultationConnection = new SqlConnection(connectionString);

            string sql = "SELECT * FROM DIAGNOSISFILE WHERE DIAGCODE = '" + ConsDiagCode.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, consultationConnection);
            consultationConnection.Open();

            SqlDataReader dr = cmd.ExecuteReader(); ;
            bool found = false;
            while (dr.Read())
            {
                found = true;
                ConsultationGridView.Rows[row].Cells[0].Text = dr["DIAGCODE"].ToString();
                ConsultationGridView.Rows[row].Cells[1].Text = dr["DIAGNAME"].ToString();
                ViewState["count"] = (int)ViewState["count"] + 1;
                Label28.Text = "";

            }
            if (found == false)
            {
                Response.Write("<script>alert('Medicine Code did not exist.')</script>");
                Label28.Text = "Invalid Code";
                ConsDiagCode.Text = "";
                ConsNotes.Text = "";
            }
        }

        protected void ConsNotes_TextChanged(object sender, EventArgs e)
        {
            int rowCount = (int)ViewState["count"];
            for (int i = 0; i < ConsultationGridView.Rows.Count; i++)
                if (ConsDiagCode.Text == ConsultationGridView.Rows[i].Cells[0].Text)
                {
                    ConsultationGridView.Rows[i].Cells[2].Text = ConsNotes.Text;
                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[3] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three") });
                    dt.Rows.Add(ConsultationGridView.Rows);
                }
        }

        protected void ExamBytb2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox19_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM EMPLOYEEFILE WHERE EMPPOSITION = 'DOC'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();


            bool found = false;
            while (dr.Read())
            {
                if (dr["EMPCODE"].ToString() == ExamBytb1.Text)
                {
                    found = true;
                    Label30.Text = "";
                    Response.Write("<script>alert('Authorized Doctor')</script>");
                    ExamBytb2.Text = dr["EMPFNAME"] + " " + dr["EMPMNAME"] + " " + dr["EMPLNAME"].ToString();
                    break;
                }
            }
            if (found == false)
            {
                Label30.Text = "Invalid Code";
                Response.Write("<script>alert('Unauthorized Staff')</script>");
                ExamBytb2.Text = "";
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");

        }

        protected void ConsPatBodyTemptb_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ConsPatWeighttb_TextChanged(object sender, EventArgs e)
        {

        }
    }
}