<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnlineLibraryManagement.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 233px;
        }
        .auto-style2 {
            height: 182px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
    <img src="images/books-1281581_640.jpg"    class="auto-style1" alt="Responsive image" width="100%"/>
          </section>
    <section>
        <div class="container">
            <div class="row">
            <div class="col-12">
                <center>
                    <h2>Our Features</h2>
                    <p><b>Our 3 primary features</b></p>
                </center>
            </div>
        </div>
            <div class ="row">
                <div class="col-md-4">
                    <center>
                    <img width="100px" height="100px" src="images/inventory.png" />
                    <h4>Digital Book Inventory</h4>
                    <p class="text-justify">An online portal, librarywala.com, that will bring your favourite reads to your doorstep at nominal charges.
                        It has over 75,000 books across categories, so you’ll be left spoilt for choice. </p>
               </center>
                    </div>
                 <div class="col-md-4">
     <center>
     <img width="100px" height="100px" src="images/search.png" />
     <h4>Search Books Online</h4>
     <p class="text-justify">If you’re a lazy bookworm who hates to step out to go to a bookstore or library,
         order your books without leaving your wormhole. These 
         online libraries in Pune have a lot of options and some give you the advantage of not paying the late
         fee either. </p>
</center>
     </div>
                 <div class="col-md-4">
     <center>
     <img width="100px" height="100px"  src="images/defaulter.jpeg" />
     <h4>Defaulters list</h4>
     <p class="text-justify">With a ‘no late fee’ policy, this library is apt for those who can’t read on a deadline.
         The library's reading plans exclude any kind of registration and refundable charges. The
         annual plans cost between INR 2,000 and INR 3,500 and let you borrow books for free for 
         the first two months.</p>
</center>
     </div>
            </div>
            </div>
    </section>
    <section>
        <center>
        <img src="images/banner.jpeg" width="50%" class="auto-style2" />
            </center>
         <div class="container">
     <div class="row">
     <div class="col-12">
         <center>
             <h2>Our Process</h2>
             <p><b>We have a Simple 3 Step Process</b></p>
         </center>
     </div>
 </div>
     <div class ="row">
         
         <div class="col-md-4">
             <center>
             <img width="100px" height="100px" src= "images/Signup.png" />
             <h4>Sign Up</h4>
             <p class="text-justify">Sign Up for to access online library resources including eBooks, 
                 Books and much more. Creating an account means you accept Libraries Business Terms of Service
                 and Privacy Policy . </p>
        </center>
             </div>
          <div class="col-md-4">
     <center>
     <img width="100px" height="100px" src= "images/SearchBooks.png" />
     <h4>Search Books</h4>
     <p class="text-justify">Searching books has made it easy to find any book at the best price.
         Whether you want the cheapest reading copy or a specific collectible edition, with BookFinder, 
         you'll find just the right book. Online Library  searches
         the inventories of over 100,000 booksellers worldwide, accessing millions of books in just one simple step.  </p>
</center>
     </div>
          <div class="col-md-4">
     <center>
     <img width="100px" height="100px" src= "images/building.png" />
     <h4>Visit us</h4>
     <p class="text-justify">Visit us To our Websites and Blogs.  </p>
</center>
     </div>
         
</div>
    </section>


</asp:Content>
