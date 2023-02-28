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
    public partial class BillingPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ELDNET1"].ConnectionString;
        double parTotalPrice = 0.00;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblBillPrep.Text = Session["name"].ToString();
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
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                dt.Rows.Add("", "", "");
                BillingGridview.DataSource = dt;
                BillingGridview.DataBind();
                ViewState["dt"] = dt;
                ViewState["count"] = 0;
            }
        }
        protected void Button3_Click1(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BillingPage.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "INSERT INTO BILLINGHEADERFILE(BILLHNO, BILLHDATE, BILLHPATCODE, BILLHTOTAMT, BILLHPREPBY) VALUES(@BillingNo, @BillingDate, @BillingPatCode, @BillingAmt, @BillingPrepBy)";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@BillingNo", BillingNotb.Text);
            cmd.Parameters.AddWithValue("@BillingDate", BillingDatetb.Text);
            cmd.Parameters.AddWithValue("@BillingPatCode", BillingPatCodetb.Text);
            cmd.Parameters.AddWithValue("@BillingAmt", BillingTotAmttb.Text);
            cmd.Parameters.AddWithValue("@BillingPrepBy", lblBillPrep.Text);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
                Response.Write("<script>alert('Record Saved Successfuly')</script>");
            con.Close();

            //  THIS IS TO INSERT IN BILLINGDETAILFILE 
            for (int a = 0; a < (int)ViewState["count"]; a++)
            {
                con.Open();
                sql = "INSERT INTO BILLINGDETAILFILE(BILLDNO, BILLDCOUNT, BILLDDESC, BILLDAMOUNT) VALUES(@BillingDNo, @BillingDcount, @BillingDdesc, @BillingDprice)";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@BillingDNo", BillingNotb.Text);
                cmd.Parameters.AddWithValue("@BillingDcount", BillingGridview.Rows[a].Cells[0].Text);
                cmd.Parameters.AddWithValue("@BillingDdesc", BillingGridview.Rows[a].Cells[1].Text);
                cmd.Parameters.AddWithValue("@BillingDprice", BillingGridview.Rows[a].Cells[2].Text);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            BillingDatetb.Text = "";
            BillingPatCodetb.Text = "";
            BillingPatNametb.Text = "";
            BillingAgetb.Text = "";
            BillingConsultationCbox.Checked = false;
            BillingImmunizationCbox.Checked = false;
            BillingConsu_ImmNotb.Text = "";
            BillingTotAmttb.Text = "";

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("one"), new DataColumn("two"), new DataColumn("three") });
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            dt.Rows.Add("", "", "");
            BillingGridview.DataSource = dt;
            BillingGridview.DataBind();
            ViewState["dt"] = dt;
            ViewState["count"] = 0;
            BillingNotb.Text = "";
        }

        protected void BillingImmunizationCbox_CheckedChanged(object sender, EventArgs e)
        {
            if (BillingImmunizationCbox.Checked)
            {
                BillingConsu_ImmNotb.Enabled = true;
            }
            else
                BillingConsu_ImmNotb.Enabled = false;
        }

        protected void BillingConsultationCbox_CheckedChanged(object sender, EventArgs e)
        {
            if (BillingConsultationCbox.Checked)
            {
                BillingConsu_ImmNotb.Enabled = true;
            }
            else
                BillingConsu_ImmNotb.Enabled = false;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM BILLINGHEADERFILE";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;

            while (dr.Read())
            {
                if (dr["BILLHNO"].ToString().ToUpper() == BillingNotb.Text.ToUpper())
                {
                    found = true;
                    Label15.Text = "Number Exists";
                    Response.Write("<script>alert('Billing Number already exist. Try different number')</script>");
                    BillingNotb.Text = "";
                    break;
                }
            }
            if (found == false)
            {
                Label15.Text = "";
            }
        }

        protected void BillingImmNotb_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            if (BillingImmunizationCbox.Checked == true)
            {
                string sql = "SELECT * FROM PATIENTFILE LEFT JOIN IMMUNIZATIONHEADERFILE ON PATIENTFILE.PATCODE = IMMUNIZATIONHEADERFILE.IMMHPATCODE LEFT JOIN IMMUNIZATIONDETAILFILE" +
                " ON IMMUNIZATIONHEADERFILE.IMMHIMMUNO = IMMUNIZATIONDETAILFILE.IMMDIMMUHNO LEFT JOIN VACCINEFILE ON IMMUNIZATIONDETAILFILE.IMMDVACCODE = VACCINEFILE.VACCODE WHERE IMMUNIZATIONDETAILFILE.IMMDIMMUHNO = '" + BillingConsu_ImmNotb.Text + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                bool found = false;
                while (dr.Read())
                {
                    int row = (int)ViewState["count"];
                    found = true;
                    BillingPatCodetb.Text = dr["PATCODE"].ToString();
                    BillingPatNametb.Text = dr["PATFNAME"] + " " + dr["PATMNAME"] + " " + dr["PATLNAME"].ToString();
                    BillingAgetb.Text = dr["PATAGE"].ToString();
                    BillingGridview.Rows[row].Cells[0].Text = (row + 1).ToString();
                    BillingGridview.Rows[row].Cells[1].Text = dr["VACDESC"].ToString();
                    BillingGridview.Rows[row].Cells[2].Text = dr["VACPRICE"].ToString();
                    ViewState["count"] = row + 1;
                }
                if (found == false)
                {
                    if (found == false)
                    {
                        BillingConsu_ImmNotb.Text = "";
                        Response.Write("<script>alert('Immunization Number does not exist')</script>");
                    }
                }
            }
            else if (BillingConsultationCbox.Checked == true)
            {
                string sql = "SELECT * FROM PATIENTFILE LEFT JOIN CONSULTATIONHEADERFILE ON PATIENTFILE.PATCODE = CONSULTATIONHEADERFILE.CONHPATCODE LEFT JOIN CONSULTATIONDETAILFILE" +
                                " ON CONSULTATIONHEADERFILE.CONHNO = CONSULTATIONDETAILFILE.CONDNO LEFT JOIN DIAGNOSISFILE ON CONSULTATIONDETAILFILE.CONDDIAGCODE = DIAGNOSISFILE.DIAGCODE WHERE CONSULTATIONDETAILFILE.CONDNO = '" + BillingConsu_ImmNotb.Text + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                bool found = false;

                while (dr.Read())
                {
                    int row = (int)ViewState["count"];
                    found = true;
                    BillingPatCodetb.Text = dr["PATCODE"].ToString();
                    BillingPatNametb.Text = dr["PATFNAME"] + " " + dr["PATMNAME"] + " " + dr["PATLNAME"].ToString();
                    BillingAgetb.Text = dr["PATAGE"].ToString();
                    BillingGridview.Rows[row].Cells[0].Text = (row + 1).ToString();
                    BillingGridview.Rows[row].Cells[1].Text = dr["DIAGCODE"].ToString();
                    BillingGridview.Rows[row].Cells[2].Text = dr["DIAGPRICE"].ToString();
                    ViewState["count"] = row + 1;

                }
                if (found == false)
                {
                    BillingConsu_ImmNotb.Text = "";
                    Response.Write("<script>alert('Consultation Number does not exist')</script>");
                }
            }
            for (int i = 0; i < BillingGridview.Rows.Count; i++)
            {
                if (BillingGridview.Rows[i].Cells[2].Text.ToString() != string.Empty)
                {
                    parTotalPrice += Double.Parse(BillingGridview.Rows[i].Cells[2].Text.ToString());
                }
                else
                {
                    break;
                }
            }
            BillingTotAmttb.Text = "Php " + parTotalPrice.ToString();
        }

        protected void BillingPatCodetb_TextChanged(object sender, EventArgs e)
        {

        }
    }
}