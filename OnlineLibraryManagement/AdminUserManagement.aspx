<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminUserManagement.aspx.cs" Inherits="OnlineLibraryManagement.AdminUserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Details</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="images/Signup.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox class="form-control" ID="txtMemberID" runat="server" placeholder="ID"></asp:TextBox>
                                <asp:LinkButton class="btn btn-primary" ID="LinkButtonGo" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                            </div>
                            </div>
                            <div class="col-md-4">
                                <label>FullName</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtFullNAme" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control mr-1" ID="txtAccountStatus" runat="server" placeholder=""></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButtonActive" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButtonPending" runat="server"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButtonDelete" runat="server"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>DOB</label>
                                    <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Contact No.</label>
                                    <asp:TextBox CssClass="form-control" ID="txtContactNumber" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Email </label>

                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>State</label>
                                    <asp:TextBox CssClass="form-control" ID="txtState" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>City</label>
                                    <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Pincode </label>

                                    <asp:TextBox CssClass="form-control" ID="txtPinCode" runat="server" placeholder="Pincode" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <label>Full Postal Address</label>
                            <div class="form-group">

                                <asp:TextBox class="form-control" ID="txtAddress" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button class="btn btn-block btn-lg btn-danger mx-auto"
                                ID="btnDelete" runat="server" Text="Delete User Permanently" />
                        </div>
                    </div>
</div>
                    </div>
                    <a href="HomePage.aspx"><< Back to Home</a><br>
                
        </div>
        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Member List</h4>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    </div>
</asp:Content>
