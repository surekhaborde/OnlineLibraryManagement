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
    public partial class AdminPublisherManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();

        }
        protected void btnGo_Click(object sender, EventArgs e)
        {
           
                GetPublisherById();
                clear();
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher already exists');</script>");
                clear();
            }
            else
            {
              AddPublisherDetails();
                Response.Write("<script>alert('Publisher Added Successfully');</script>");
                clear();
                GridView1.DataBind();
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                UpdatePublisher();
                clear();
                Response.Write("<script>alert('Publisher updated successfully');</script>");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exists ');</script>");
                clear();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if(checkIfPublisherExists())
            {
                DeletePublisher();
                Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
                clear() ;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Publisher Does not exists ');</script>");
            }

        }

        void GetPublisherById()
        {

            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            try
            {
                string str = "Select * from Tbl_publisher where publisher_id='" + txtPubId.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader dr = cmd.ExecuteReader();
                
                if (dr.HasRows) {
                    while (dr.Read()) { 
                    txtPubNAme.Text = dr.GetValue(1).ToString();
                }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Publisher ID.');</script>");

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            con.Close();
        }
        void DeletePublisher()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Delete from Tbl_publisher where publisher_id='" + txtPubId.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            con.Close();
        }
        void UpdatePublisher()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Update Tbl_publisher SET publisher_name=@publisher_name where publisher_id='"+txtPubId.Text.Trim()+"'";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@publisher_name", txtPubNAme.Text.Trim());
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            con.Close();
        }
       void clear()
        {
            txtPubId.Text= string.Empty;
            txtPubNAme.Text= string.Empty;
        }
        void AddPublisherDetails()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Insert into Tbl_publisher (publisher_id,publisher_name) values (@publisher_id,@publisher_name)";
                SqlCommand cmd = new SqlCommand(str, con);
               
                cmd.Parameters.AddWithValue("@publisher_id", txtPubId.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", txtPubNAme.Text.Trim());
                cmd.ExecuteNonQuery();
                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            con.Close();

        }

        bool checkIfPublisherExists()
        {
            SqlConnection con= new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Select * from Tbl_publisher where publisher_id='" + txtPubId.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
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

       
    }
}