using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class UserProfile : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
              //  if (Session["username"].ToString() == "" || Session["username"] == null)
              if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    getUserBookData();
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }
        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select * from Tbl_book_issue where member_id='" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewBooks.DataSource = dt;
                GridViewBooks.DataBind();
            
            
            
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        void updateUserPersonalDetails()
        {
            string password = "";
            if (txtNewPassword.Text.Trim() == "")
            {
                password = txtOldPassword.Text.Trim();
            }
            else
            {
                password = txtNewPassword.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update Tbl_member set full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status WHERE member_id='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob",txtDateofBirth.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownListState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtPincode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                    getUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Tbl_member where member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtFullName.Text = dt.Rows[0]["full_name"].ToString();
                txtDateofBirth.Text = dt.Rows[0]["dob"].ToString();
                txtContactNo.Text = dt.Rows[0]["contact_no"].ToString();
                TextBox2.Text = dt.Rows[0]["email"].ToString();
                DropDownListState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                txtCity.Text = dt.Rows[0]["city"].ToString();
                txtPincode.Text = dt.Rows[0]["pincode"].ToString();
                txtFullAddress.Text = dt.Rows[0]["full_address"].ToString();
                txtUserid.Text = dt.Rows[0]["member_id"].ToString();
                txtOldPassword.Text = dt.Rows[0]["password"].ToString();
                lblstatus.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-info");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

            protected void GridViewBooks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}