using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.DataBind();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Select * from Tbl_member where member_id = '" + txtMemberID.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read()) {
                        txtFullName.Text = dr.GetValue(0).ToString();
                        txtAccStatus.Text = dr.GetValue(10).ToString();
                        txtDOB.Text = dr.GetValue(1).ToString();
                        txtContact.Text = dr.GetValue(2).ToString();
                        txtEmail.Text = dr.GetValue(3).ToString();
                        txtState.Text = dr.GetValue(4).ToString();
                        txtCity.Text = dr.GetValue(5).ToString();
                        txtPincode.Text = dr.GetValue(6).ToString();
                        txtAddress.Text = dr.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID.');</script>");

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            con.Close();

        }

        protected void btnActive_Click(object sender, EventArgs e)
        {
            updateMemberstatusById("Active");
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            updateMemberstatusById("Pending");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            updateMemberstatusById("Deactive");
        }

        void DeleteUserPermanentById()
        {
            if (checkIfMemberExists())
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                try
                {
                    string str = "Delete from Tbl_member where member_id='" + txtMemberID.Text.Trim() + "'";
                    SqlCommand cmd = new SqlCommand(str, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView2.DataBind();
                    Response.Write("<script>alert('Member Deleted successfully');</script>");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            else
            {
                Response.Write("<script>alert('Member ID Does not exists');</script>");
            }
        }
    
        void updateMemberstatusById(string status)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Update Tbl_member Set account_status='" + status + "' where member_id='"+txtMemberID.Text.Trim()+"'";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
                GridView2.DataBind();
                Response.Write("<script>alert('Member Updated successfully');</script>");
            
            
            }
            catch (Exception ex)
            { Console.WriteLine(ex.Message);}
        }
        bool checkIfMemberExists()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {

                string str = "Select * from Tbl_member where member_id='" + txtMemberID.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }


        }
        void clear()
        {
            txtFullName.Text = "";
            txtAccStatus.Text = "";
            txtDOB.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            txtState.Text = "";
            txtCity.Text = "";
            txtPincode.Text = "";
            txtAddress.Text = "";
        }
        protected void btnDeletePermanently_Click(object sender, EventArgs e)
        {
            
                DeleteUserPermanentById();
                clear();
            
            GridView2.DataBind();
           

        }
    }
}