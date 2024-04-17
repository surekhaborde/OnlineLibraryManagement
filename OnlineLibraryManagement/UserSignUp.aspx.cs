using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class UserSignUp : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists())
            {
                Response.Write("<script>alert('User ID already exists')</script>");
            }
            else
            {
                SignUpMember();
            }
        }

        bool CheckMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select * from Tbl_member where member_id= '"+txtUserid.Text.Trim()+"'";
                SqlCommand cmd = new SqlCommand(str, con);
               
                SqlDataAdapter da=new SqlDataAdapter(cmd); 
                DataTable dt= new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                   // Response.Write("<script>alert('User ID is already exists');</script>");
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
            }
            
            return false;
        }
        void SignUpMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Insert into Tbl_member (full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status)" +
                    "values (@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtDateofBirth.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownListState.SelectedItem.Value.Trim());
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtPincode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", txtUserid.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Sigup successful. Go to User login')</script>");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
    }
}