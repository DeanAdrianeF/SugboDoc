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
    public partial class ImmunizationPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ImmPrepby.Text = Session["name"].ToString();
            if (!Page.IsPostBack)
            {
                //This is to add column slots in gridview.
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[5] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five") });
                dt.Rows.Add("", "", "", "", "");
                dt.Rows.Add("", "", "", "", "");
                dt.Rows.Add("", "", "", "", "");
                dt.Rows.Add("", "", "", "", "");
                dt.Rows.Add("", "", "", "", "");
                dt.Rows.Add("", "", "", "", "");
                dt.Rows.Add("", "", "", "", "");
                dt.Rows.Add("", "", "", "", "");
                ImmunizationGridview.DataSource = dt;
                ImmunizationGridview.DataBind();
                ViewState["dt"] = dt;
                ViewState["count"] = 0;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM CONSULTATIONHEADERFILE , PATIENTFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;
            while (dr.Read())
            {
                if (dr["CONHIMMREF"].ToString().ToUpper() == ImmunizationCodetb.Text.ToUpper())
                {
                    found = true;
                    Label23.Text = "";
                    ImmPatientCodetb.Text = dr["CONHPATCODE"].ToString();
                    if (dr["PATCODE"].ToString() == ImmPatientCodetb.Text)
                    {
                        found = true;
                        ImmPatientNametb.Text = dr["PATFNAME"] + " " + dr["PATMNAME"] + " " + dr["PATLNAME"].ToString();
                        ImmPatientAddtb.Text = dr["PATADDR"].ToString();
                        ImmPatientTeltb.Text = dr["PATTEL"].ToString();
                        ImmPatienFathtb.Text = dr["PATFATHNAME"].ToString();
                        ImmPatientMothtb.Text = dr["PATMOTHNAME"].ToString();
                        ImmPatientGentb.Text = dr["PATGENDER"].ToString();
                        ImmPatientBdatetb.Text = dr["PATBDATE"].ToString();
                        ImmPatientAgetb.Text = dr["PATAGE"].ToString();
                        break;
                    }
                }
            }
            if (found == false)
            {
                Response.Write("<script>alert('Immunization code did not exist. Please get referral code.')</script>");
                Label23.Text = "Invalid Code";
                ImmunizationCodetb.Text = "";
                ImmPatientCodetb.Text = "";
                ImmPatientNametb.Text = "";
                ImmPatientAddtb.Text = "";
                ImmPatientTeltb.Text = "";
                ImmPatienFathtb.Text = "";
                ImmPatientMothtb.Text = "";
                ImmPatientGentb.Text = "";
                ImmPatientBdatetb.Text = "";
                ImmPatientAgetb.Text = "";
            }
        }

        protected void ImmPatientVaccCode_TextChanged(object sender, EventArgs e)
        {
            int row = (int)ViewState["count"];

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM VACCINEFILE WHERE VACCODE = '" + ImmPatientVaccCode.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader(); ;

            bool found = false;
            while (row > -1)
            {
                if (ImmPatientVaccCode.Text == ImmunizationGridview.Rows[row].Cells[0].Text)
                {
                    ImmPatientVaccCode.Text = "";
                    Response.Write("<script>alert('You entered the same code.')</script>");
                    Label26.Text = "Invalid Code";
                    return;
                }
                else
                    Label26.Text = "";

                row--;
            }
            row = (int)ViewState["count"];
            while (dr.Read())
            {
                found = true;
                ImmunizationGridview.Rows[row].Cells[0].Text = dr["VACCODE"].ToString();
                ImmunizationGridview.Rows[row].Cells[1].Text = dr["VACNAME"].ToString();
                ImmunizationGridview.Rows[row].Cells[2].Text = dr["VACDESC"].ToString();
                ViewState["count"] = (int)ViewState["count"] + 1;
                Label26.Text = "";

            }
            if (found == false)
            {
                Response.Write("<script>alert('Medicine Code did not exist.')</script>");
                Label26.Text = "Invalid Code";
                ImmPatientVaccCode.Text = "";
                ImmPatientShotNum.Text = "";
                ImmPatientReaction.Text = "";
            }
        }

        protected void ImmPatientShotNum_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ImmPatientShotNum.Text) < 1)
            {
                Response.Write("<script>alert('0 is not accepted')</script>");
                ImmPatientShotNum.Text = "";
                return;
            }

            int rowCount = (int)ViewState["count"];
            for (int i = 0; i < ImmunizationGridview.Rows.Count; i++)
                if (ImmPatientVaccCode.Text == ImmunizationGridview.Rows[i].Cells[0].Text)
                {
                    ImmunizationGridview.Rows[i].Cells[3].Text = ImmPatientShotNum.Text;
                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[5] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five") });
                    dt.Rows.Add(ImmunizationGridview.Rows);
                }
        }

        protected void ImmPatientReaction_TextChanged(object sender, EventArgs e)
        {
            int rowCount = (int)ViewState["count"];
            for (int i = 0; i < ImmunizationGridview.Rows.Count; i++)
                if (ImmPatientVaccCode.Text == ImmunizationGridview.Rows[i].Cells[0].Text)
                {
                    ImmunizationGridview.Rows[i].Cells[4].Text = ImmPatientReaction.Text;
                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[6] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five"), new DataColumn("six") });
                    dt.Rows.Add(ImmunizationGridview.Rows);
                }
        }

        protected void ImmedBy_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM EMPLOYEEFILE WHERE EMPPOSITION = 'DOC'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;
            while (dr.Read())
            {
                if (dr["EMPCODE"].ToString() == ImmedBy.Text)
                {
                    found = true;
                    Label27.Text = "";
                    Response.Write("<script>alert('Authorized Doctor')</script>");
                    ImmunizerName.Text = dr["EMPFNAME"] + " " + dr["EMPMNAME"] + " " + dr["EMPLNAME"].ToString();
                    break;
                }
            }
            if (found == false)
            {
                Label27.Text = "Invalid Code";
                Response.Write("<script>alert('Unauthorized Staff')</script>");
                ImmedBy.Text = "";
                ImmunizerName.Text = "";
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ImmunizationPage.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "INSERT INTO IMMUNIZATIONHEADERFILE(IMMHIMMUNO, IMMHDATE, IMMHPATCODE, IMMHPATWEIGHT, IMMHPATHEIGHT, IMMHPREPBY, IMMHIMMUBY) " +
                                                            "VALUES(@ImmHcode,@ImmHdate,@ImmHpatcode, @ImmHpatw, @ImmHpath, @ImmHprepby, @ImmHimmedby)";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            cmd.Parameters.AddWithValue("@ImmHcode", ImmunizationCodetb.Text);
            cmd.Parameters.AddWithValue("@ImmHdate", ImmunizationCdatetb.Text);
            cmd.Parameters.AddWithValue("@ImmHpatcode", ImmPatientCodetb.Text);
            cmd.Parameters.AddWithValue("@ImmHpatw", ImmPatientWtb.Text);
            cmd.Parameters.AddWithValue("@ImmHpath", ImmPatientHtb.Text);
            cmd.Parameters.AddWithValue("@ImmHprepby", ImmPrepby.Text);
            cmd.Parameters.AddWithValue("@ImmHimmedby", ImmunizerName.Text);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
                Response.Write("<script>alert('Record Saved Successfuly')</script>");
            con.Close();
            //  THIS IS TO INSERT IN IMMUNIZATIONDETAILFILE
            for (int a = 0; a < (int)ViewState["count"]; a++)
            {
                con.Open();
                sql = "INSERT INTO IMMUNIZATIONDETAILFILE(IMMDIMMUHNO, IMMDVACCODE, IMMDSHOTNUM, IMMDREACTION) " +
                                                "VALUES(@ImmDimmno, @ImmDvaccode, @ImmDshotnum, @ImmDreaction)";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@ImmDimmno", ImmunizationCodetb.Text);
                cmd.Parameters.AddWithValue("@ImmDvaccode", ImmunizationGridview.Rows[a].Cells[0].Text);
                cmd.Parameters.AddWithValue("@ImmDshotnum", Convert.ToInt32(ImmunizationGridview.Rows[a].Cells[3].Text));
                cmd.Parameters.AddWithValue("@ImmDreaction", ImmunizationGridview.Rows[a].Cells[4].Text);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            ImmunizationCodetb.Text = "";
            ImmPatientCodetb.Text = "";
            ImmunizationCdatetb.Text = "";
            ImmPatientNametb.Text = "";
            ImmPatientAddtb.Text = "";
            ImmPatientTeltb.Text = "";
            ImmPatienFathtb.Text = "";
            ImmPatientMothtb.Text = "";
            ImmPatientGentb.Text = "";
            ImmPatientBdatetb.Text = "";
            ImmPatientAgetb.Text = "";
            ImmPatientWtb.Text = "";
            ImmPatientHtb.Text = "";
            ImmPatientVaccCode.Text = "";
            ImmPatientShotNum.Text = "";
            ImmPatientReaction.Text = "";
            ImmedBy.Text = "";
            ImmunizerName.Text = "";

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three"), new DataColumn("four"), new DataColumn("five") });
            dt.Rows.Add("", "", "", "", "");
            dt.Rows.Add("", "", "", "", "");
            dt.Rows.Add("", "", "", "", "");
            dt.Rows.Add("", "", "", "", "");
            dt.Rows.Add("", "", "", "", "");
            dt.Rows.Add("", "", "", "", "");
            dt.Rows.Add("", "", "", "", "");
            dt.Rows.Add("", "", "", "", "");
            ImmunizationGridview.DataSource = dt;
            ImmunizationGridview.DataBind();
            ViewState["dt"] = dt;
            ViewState["count"] = 0;
        }

        protected void ImmPatientCodetb_TextChanged(object sender, EventArgs e)
        {

        }
    }
}