﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="OnlineLibraryManagement.BookList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
 $(document).ready(function()
 {
 $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
 });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <center>
                    <h3>Book Inventory List</h3>
<%--                    <img src="images/book.png" style="height:150px;" />--%>
                    <hr />
<%--                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
                    
                </center>
<%--                <a href="HomePage.aspx" > << Back to Home </a>--%>
            </div>
           </div>
        <div class="row">
            <div class="col-md-12">
                 <div class="card">
     <div class="card-body">
        <%-- <div class="row">
             <div class="col">
                 <center>
                     <h4>Book Inventory List</h4>
                 </center>
             </div>
         </div>--%>
       <%--  <div class="row">
             <div class="col">
                 <hr>
             </div>
         </div>--%>
         <div class="row">
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [Tbl_book]"></asp:SqlDataSource>
             <div class="col">
                 <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                     <Columns>
                         <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" >
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                         <asp:TemplateField>
                             <ItemTemplate>
                                 <div class="container-fluid">
                                     <div class="row">
                                         <div class="col-lg-10">
                                             <div class="row">
                                                 <div class="col-12">

                                                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                 </div>
                                             </div>
                                             <div class="row">
                                                 <div class="col-12">
                                                     Author-<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                     &nbsp;| Genre-<asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                     &nbsp;| Language-<asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                 </div>
                                             </div>
                                             <div class="row">
                                                 <div class="col-12">
                                                     Publisher-<asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                     &nbsp;| Published Date-<asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                     &nbsp;| Pages-<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                     &nbsp;| Edition-<asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                 </div>
                                             </div>
                                             <div class="row">
                                                 <div class="col-12">
                                                     Cost-<asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                     &nbsp;| Actual Stock -<asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                     &nbsp;| Available-<asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                 </div>
                                             </div>
                                             <div class="row">
                                                 <div class="col-12">

                                                     Book Description -<asp:Label ID="Label12" runat="server" Text='<%# Eval("book_desscription") %>'></asp:Label>

                                                 </div>
                                             </div>
                                         </div>
                                         <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                         </div>
                                     </div>
                                 </div>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
             </div>
         </div>
     </div>
 </div>

        </div>
                
            </div>
        <div class="row">
            <center>
                 <a href="HomePage.aspx" > << Back to Home </a>
            </center>
        </div>
        </div>
    
</asp:Content>
