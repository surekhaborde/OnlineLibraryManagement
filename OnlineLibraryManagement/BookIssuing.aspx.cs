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
    public partial class BookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GridView1.DataBind();
            }catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            GetNames();
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            
            if (checkIfBookExixts() && CheckIfMemberExists())
            {
                //Response.Write("<script>alert('Member already has a book.');</script>");
                //}
                //else
                //{
                if (checkIfIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already has a book');</script>");
                }
                else
                {
                    IssueBook();
                    clear();
                    GridView1.DataBind();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
                clear();
            }
            
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (checkIfBookExixts() && CheckIfMemberExists())
            {

                if (checkIfIssueEntryExist())
                {
                    returnBook();
                    clear();
                }
                else
                {
                    Response.Write("<script>alert('This Entry does not exist');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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

        void IssueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Insert into Tbl_book_issue (member_id,member_name,book_id,book_name,issue_date,due_date) values (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@member_id",txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name",txtMemberName.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id",txtBookId.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name",txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date",txtStartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date",txtEndDate.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("Update Tbl_book set current_stock = current_stock-1 where book_id ='" + txtBookId.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Issued Successfully');</script>");
                
                GridView1.DataBind();



            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("Delete from Tbl_book_issue WHERE book_id='" + txtBookId.Text.Trim() + "' AND member_id='" + txtMemberID.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {

                    cmd = new SqlCommand("update Tbl_book set current_stock = current_stock+1 WHERE book_id='" + txtBookId.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book Returned Successfully');</script>");
                    GridView1.DataBind();

                    con.Close();

                }
                else
                {
                    Response.Write("<script>alert('Error - Invalid details');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Tbl_book_issue WHERE member_id='" + txtMemberID.Text.Trim() + "' AND book_id='" + txtBookId.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        bool checkIfBookExixts()
        {
            try
            {
                SqlConnection con= new SqlConnection(strcon);   
                con.Open();
                string str="Select * from Tbl_book Where book_id='"+txtBookId.Text.Trim()+ "'And Current_stock > 0";
                SqlCommand cmd= new SqlCommand(str, con);
                SqlDataAdapter da= new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count > 0 )
                {
                   return true;
                }
                else
                {
                    Response.Write("<script>alert('Book Does not exists');</script>");
                    return false;
                }

            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return false;
        }

        void clear()
        {
            txtBookId.Text = "";
            txtBookName.Text = "";
            txtEndDate.Text = "";
            txtStartDate.Text = "";
            txtMemberID.Text = "";
            txtMemberName.Text = "";
        }
        bool CheckIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select * from Tbl_member Where member_id='" + txtMemberID.Text.Trim() +"'";
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
                    Response.Write("<script>alert('Book Does not exists');</script>");
                    return false;
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return false;
        }

        void GetNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select book_name from Tbl_book Where book_id='" + txtBookId.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter da= new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count > 0)
                {
                    txtBookName.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book ID');</script>");
                }

                string str1 = "Select full_name from Tbl_member Where member_id ='" + txtMemberID.Text.Trim() + "'";
                cmd= new SqlCommand(str1, con);
                da= new SqlDataAdapter(cmd);
                dt= new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    txtMemberName.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong User ID');</script>");
                }

            }
            catch(Exception ex)
            {

            }
        }
    }
}