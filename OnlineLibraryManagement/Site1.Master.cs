using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"]==null)
                {
                    LnkbtnUserlogin.Visible = true;
                    LnkbtnSignUp.Visible = true;

                    LnkbtnLogout.Visible=false;
                    LnkbtnAuthorManagemnt.Visible=false;

                    LnkbtnMemberMngmnt.Visible=false;
                    LnkbtnAdminLogin.Visible=true;
                    LnkbtnHelloUser.Visible=false;
                    LnkbtnPublishermngmnt.Visible=false;
                    LnkbtnBookInventory.Visible=false;
                    LnkbtnBookIssuing.Visible=false;

                }
                else if (Session["role"].Equals("user"))
                {
                    LnkbtnUserlogin.Visible = false;
                    LnkbtnSignUp.Visible = false;

                    LnkbtnLogout.Visible = true;
                    LnkbtnAuthorManagemnt.Visible = false;

                    LnkbtnMemberMngmnt.Visible = false;
                    LnkbtnAdminLogin.Visible = true;
                    LnkbtnHelloUser.Visible = true;
                    LnkbtnHelloUser.Text = "Hello " + Session["username"].ToString();

                    LnkbtnPublishermngmnt.Visible = false;
                    LnkbtnBookInventory.Visible = false;
                    LnkbtnBookIssuing.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    LnkbtnUserlogin.Visible = false;
                    LnkbtnSignUp.Visible = false;

                    LnkbtnLogout.Visible = true;
                    LnkbtnAuthorManagemnt.Visible = true;

                    LnkbtnMemberMngmnt.Visible = true;
                    LnkbtnAdminLogin.Visible = false;
                    LnkbtnHelloUser.Visible = true;
                    LnkbtnHelloUser.Text = "Hello Admin" ;

                    LnkbtnPublishermngmnt.Visible = true;
                    LnkbtnBookInventory.Visible = true;
                    LnkbtnBookIssuing.Visible = true;
                }
            }
            catch(Exception ex) {
            }
        }

        protected void Linkbutton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLOgin.aspx");
        }

        protected void Linkbutton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void Linkbutton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void Linkbutton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookInventory.aspx");
        }

        protected void Linkbutton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookIssuing.aspx");
        }

        protected void Linkbutton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookList.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }

        protected void LnkbtnLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["full_name"] ="";
            Session["role"] = "";
            Session["status"] = "";

            LnkbtnUserlogin.Visible = true;
            LnkbtnSignUp.Visible = true;

            LnkbtnLogout.Visible = false;
            LnkbtnAuthorManagemnt.Visible = false;

            LnkbtnMemberMngmnt.Visible = false;
            LnkbtnAdminLogin.Visible = true;
            LnkbtnHelloUser.Visible = false;
            LnkbtnPublishermngmnt.Visible = false;
            LnkbtnBookInventory.Visible = false;
            LnkbtnBookIssuing.Visible = false;

            Response.Redirect("HomePage.aspx");
        }

        //protected void LnkbtnHelloUser_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("UserProfile.aspx");
        //}

        protected void LnkbtnHelloUser_Click1(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}