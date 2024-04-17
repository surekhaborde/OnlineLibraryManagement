using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_book;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
            GridView1.DataBind();
        }
        protected void LinkButtonGo_Click(object sender, EventArgs e)
        {
            GetBookByID();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('The book ID or name is already exists. Try some other book ID or name')</script>");
            }
            else
            {
                AddNewBook();

                clear();
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateBookDetails();
            GridView1.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            deleteBookByID();
            GridView1.DataBind();
        }
        bool checkIfBookExists()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            try
            {

                string str = "Select * from Tbl_book where book_id='" + txtBookID.Text.Trim() + "'";
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
        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Tbl_book WHERE book_id='" + txtBookID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully');</script>");

                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }


        void UpdateBookDetails()
        {
            if (checkIfBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(txtActualStock.Text.Trim());
                    int current_stock = Convert.ToInt32(txtCurrentStock.Text.Trim());
                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_book)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_book;
                            txtCurrentStock.Text = "" + current_stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/BookInventory/book";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("BookInventory/" + filename));
                        filepath = "~/BookInventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();

                    string str = "Update Tbl_book SET book_name=@book_name,genre=@genre,author_name=@author_name," +
                        "publisher_name=@publisher_name,publish_date=@publish_date,language=@language," +
                        "edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages," +
                        "book_desscription=@book_desscription,actual_stock=@actual_stock," +
                        "current_stock=@current_stock,book_img_link=@book_img_link where book_id='"
                        + txtBookID.Text.Trim() + "'";

                    SqlCommand cmd = new SqlCommand(str, con);
                    cmd.Parameters.AddWithValue("@book_name", txtBookNAme.Text.Trim());
                    //cmd.Parameters.AddWithValue("@book_name", .Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", DropDownListAuthorName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownListPubName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", txtdate.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownListLanguage.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", txtPages.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_desscription", txtBookDes.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully');</script>");
                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);

                }
                
            }
            else
            {
                Response.Write("<script>alert('Book Does not exists');</script>");

            }

        }
        void GetBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select * from Tbl_book where book_id='" + txtBookID.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtBookNAme.Text = dt.Rows[0][1].ToString();
                    txtdate.Text = dt.Rows[0][5].ToString();
                    txtEdition.Text = dt.Rows[0][7].ToString();
                    txtBookCost.Text = dt.Rows[0][8].ToString().Trim();
                    txtCurrentStock.Text = dt.Rows[0][12].ToString().Trim();
                    txtPages.Text = dt.Rows[0][9].ToString().Trim();
                    txtActualStock.Text = dt.Rows[0][11].ToString().Trim();
                    txtBookDes.Text = dt.Rows[0][10].ToString();
                    txtIssuedbooks.Text = "" + (Convert.ToInt32(dt.Rows[0][11].ToString()) - Convert.ToInt32(dt.Rows[0][12].ToString()));


                    DropDownListLanguage.SelectedValue = dt.Rows[0][6].ToString().Trim();
                    DropDownListPubName.SelectedValue = dt.Rows[0][4].ToString().Trim();
                    DropDownListAuthorName.SelectedValue = dt.Rows[0][3].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0][2].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0][11].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0][12].ToString().Trim());
                    global_issued_book = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0][13].ToString();


                }
                else
                {
                    Response.Write("<script>alert('Book ID does not exists');</script>");
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
        //bool checkIfBookExists()
        //{
        //    SqlConnection con = new SqlConnection(strcon);
        //    con.Open();
        //    try
        //    {

        //        string str = "Select * from Tbl_book where book_id='" + txtBookID.Text.Trim() + "' OR book_name  ='"+txtBookNAme.Text.Trim()+"'";
        //        SqlCommand cmd = new SqlCommand(str, con);
        //        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        dataAdapter.Fill(dt);
        //        if (dt.Rows.Count > 0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }


        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //        return false;
        //    }


        //}
        void clear()
        {
            txtBookID.Text = "";
            txtActualStock.Text = "";
            txtBookCost.Text = "";
            txtBookDes.Text = "";
            txtBookNAme.Text = "";
            txtCurrentStock.Text = "";
            txtdate.Text = "";
            txtEdition.Text = "";
            txtIssuedbooks.Text = "";
            txtPages.Text = "";
        }
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                string str = "Select author_name from Tbl_Author";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownListAuthorName.DataSource = dt;
                DropDownListAuthorName.DataValueField = "author_name";
                DropDownListAuthorName.DataBind();


                string str1 = "Select publisher_name from Tbl_Publisher";

                cmd = new SqlCommand(str1, con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownListPubName.DataSource = dt;
                DropDownListPubName.DataValueField = "publisher_name";
                DropDownListPubName.DataBind();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
        void AddNewBook()
        {
            try { 
            string genres = "";
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                genres = genres + ListBox1.Items[i] + ",";
            }
             genres=genres.Remove(genres.Length - 1);

            string filepath = "~/BookInventory/book.png";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("BookInventory/" + filename));
            filepath = "~/BookInventory/" + filename;



            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            
                string str = "Insert into Tbl_book (book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_desscription,actual_stock,current_stock,book_img_link)values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_desscription,@actual_stock,@current_stock,@book_img_link)";
                SqlCommand cmd = new SqlCommand(str, con);

                cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txtBookNAme.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", DropDownListAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownListPubName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txtdate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownListLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txtActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txtPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_desscription", txtBookDes.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txtActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book details Added successfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }


    }
}