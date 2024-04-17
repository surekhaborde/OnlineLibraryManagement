using System;
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
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select * from Tbl_member where member_id= '" + txtMemberId.Text.Trim() + "' and password='" + txtPassword.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);

                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["username"] = dr.GetValue(8).ToString();
                        Session["full_name"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Session["status"]=dr.GetValue(10).ToString();


                    }
                    Response.Redirect("HomePage.aspx");

                }
                else
                {
                    dr = null;
                }
                
                

            }
            catch (Exception ex)
            {
                    Console.WriteLine(ex.Message);
            }
        }
    }
}