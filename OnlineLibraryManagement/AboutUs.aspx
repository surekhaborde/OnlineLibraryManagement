<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="OnlineLibraryManagement.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:indianred">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <h3 style="color:white">About Our Library Management System</h3>

            </div>
           
            <div class="row">

                <div class="card">
                    <div class="card-body" style="background-color:bisque">
                        <div class="row">


                            <img src="BookInventory/paul-melki-bByhWydZLW0-unsplash%20(2).jpg" height="200px" width="100%" class="img-fluid" />


                            <p class="text-left">
                A Library Management System is a project that tries to create an automated and computerised
            version for a library so that the daily work of a library can be managed and monitored easily 
            and efficiently. Earlier, the librarian used to manage the whole work in manual mode in the
            form of files and record books. Also, the process of adding new books, new Users, issuing 
            and returning books had to be managed in a manual manner which is very slow and inefficient.
            The library management system resolves this problem and provide a better solution to this.
            It provides a user-friendly interface application to the librarian where he can do all the 
            operations of a library very easily. The application mainly consists of two main modules which
            are Admin module, User module. The admin module will be managed by 
            the system administrator. He manages the overall functioning of the application.
            He can perform various operations inside the application 
            such as add new User, new books to the database, issuing and returning of books, updating
            Author and Publisher's details, book’s details,Track/Delete Defaulter User,Manage the book Inventory,
            generating weekly/monthly reports etc. 
            The User module can be accessed by the registered Users only. 
            The operations that can be performed by the User includes: view all books available
            in the library, search the availability of a particular book, number of books he has issued, 
            due date of the issued book etc. The who have not signUp can also see the available book details.
            These modules are interconnected with each other and also with the database.
            The application is built using C#,Asp.Net technology and MS-SQL database.



                            </p>

                        </div>
                </div>
            </div>
            </div>
        </div>
    </div>


</asp:Content>
