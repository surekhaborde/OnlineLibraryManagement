<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminAuthorManagement.aspx.cs" Inherits="OnlineLibraryManagement.AdminAuthorManagement" %>

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
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Author Details</h3>

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/Author.png" />

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtauthorId"
                                            runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary"
                                            ID="btnGo" runat="server" Text="GO" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-8">
                                <label>Author Name</label>
                                <asp:TextBox CssClass="form-control" ID="txtAutherNAme"
                                    runat="server" placeholder="Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button class="btn btn-lg btn-block btn-success" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button class="btn btn-lg btn-block btn-primary" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button class="btn btn-lg btn-block btn-danger" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="col-md-7">
                    <div class="card">
    <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                            <h3>Author List</h3>
                                <hr />
                                <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" DataKeyNames="author_id"  runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1">
                                   
                                    <Columns>
                                        
                              <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                              <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                           </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Tbl_Author]"></asp:SqlDataSource>
                                </div>
                                    
                                    </center>
                        </div>
                        </div>
                    </div>
                    <%--<div class="row">
                        <label>Show</label>
                    </div>
                </div>--%>
                        </div>
                    </div>
            </div></div>
      
</asp:Content>
