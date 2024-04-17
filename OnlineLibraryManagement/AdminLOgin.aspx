<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLOgin.aspx.cs" Inherits="OnlineLibraryManagement.AdminLOgin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <img width="150px" src="images/Admin.png" />

                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Admin Login</h3>

                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <hr />

                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="col">
                                <label>Admin ID</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtAdminId"
                                        runat="server" placeholder="Member ID"></asp:TextBox>


                                </div>
                                <label>Password</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtPass"
                                        runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>


                                </div>
                                <div class="form-group">

                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />


                                </div>
                                
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <a href="HomePage.aspx"> << Back To home</a>
        <br />
            <br />
        </div>
    </div>
    </div>
</asp:Content>
