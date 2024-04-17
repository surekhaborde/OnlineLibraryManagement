using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class AdminLOgin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select * from Tbl_admin_login where username= '" + txtAdminId.Text.Trim() + "' and password='" + txtPass.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["full_name"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                      

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