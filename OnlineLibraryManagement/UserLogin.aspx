<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="OnlineLibraryManagement.UserLogin" %>

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
                                    <img width="150px" src="images/profile.png" />

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>

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
                                    <label>Member ID</label>
                                    <div class="form-group">

                                        <asp:TextBox CssClass="form-control" ID="txtMemberId"
                                            runat="server" placeholder="Member ID"></asp:TextBox>


                                    </div>
                                    <label>Member Password</label>
                                    <div class="form-group">

                                        <asp:TextBox CssClass="form-control" ID="txtPassword"
                                            runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>


                                    </div>
                                    <div class="form-group">

                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />


                                    </div>
                                    <div class="form-group">

                                        <a href="UserSignUp.aspx"><input class="btn btn-primary btn-block btn-lg" id="btnsignup" type="button" value="Sign Up" />
                                            </a>

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
