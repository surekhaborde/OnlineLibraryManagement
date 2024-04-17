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

    public partial class AdminAuthorManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {


            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID is already exists.');</script>");
                clear();
               
            }
            else
            {
              AddnewAuthor();
                clear();
                GridView1.DataBind();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e) { 
        
            if (checkIfAuthorExists())
            {
                UpdateAuthor();
                Response.Write("<script>alert('Author with this ID is updated successfully.');</script>");
                clear();
                GridView1.DataBind();

            }
            else
            {
                Response.Write("<script>alert('Author with this ID does not exists.');</script>");

            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                DeleteAuthor();
                Response.Write("<script>alert('Author with this ID is deleted successfully.');</script>");
                clear();
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Author with this ID does not exists.');</script>");

            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            GetAuthorByID();
            clear();
            GridView1.DataBind();

        }
        void GetAuthorByID()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            try
            {
                string str = "Select * from Tbl_Author where author_id='" + txtauthorId.Text+ "'";
                SqlCommand cmd = new SqlCommand(str,con);
                SqlDataAdapter DA=new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DA.Fill(dt);
                //SqlDataReader dr = cmd.ExecuteReader();
                //if (dr.HasRows)
                //{
                //    while (dr.Read())
                //    {
                                if (dt.Rows.Count > 0)
                        {
                        txtAutherNAme.Text = dt.Rows[0][1].ToString();
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author ID.');</script>");

                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            con.Close();
        }

        void DeleteAuthor()
        {
            SqlConnection con =new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Delete from Tbl_Author where author_id='" + txtauthorId.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            con.Close();
        }
        void UpdateAuthor()
        {
            SqlConnection con= new SqlConnection(strcon);
            con.Open();
            try
            {
                string str = "Update Tbl_Author SET author_name=@author_name where author_id='" + txtauthorId.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@author_name", txtAutherNAme.Text.Trim());
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                   Response.Write(ex.Message);

            }
            con.Close();
        }
        void AddnewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Insert into Tbl_Author ( author_id,author_name) values( @author_id,@author_name)";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@author_id", txtauthorId.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", txtAutherNAme.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());

            }


        }
        bool checkIfAuthorExists()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {
                
                string str = "Select * from Tbl_Author where author_id='" + txtauthorId.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dt= new DataTable();
                dataAdapter.Fill(dt);
                if(dt.Rows.Count > 0)
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
            txtAutherNAme.Text = "";
            txtauthorId.Text= string.Empty;
        }
    }
}