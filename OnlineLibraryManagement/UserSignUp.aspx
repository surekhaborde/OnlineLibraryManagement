<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="OnlineLibraryManagement.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/profile.png" />

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Sign Up</h4>

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
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtFullName"
                                        runat="server" placeholder="Full Name"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">

                                <label>Date of Birth</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtDateofBirth"
                                        runat="server" TextMode="Date"></asp:TextBox>


                                </div>

                            </div>
                        </div>
                      
                                           <div class="row">
<div class="col-md-6">
    <label>Contact No.</label>
    <div class="form-group">

        <asp:TextBox CssClass="form-control" ID="txtContactNo"
            runat="server" placeholder="Contact number" TextMode="Number"></asp:TextBox>

    </div>
</div>
                         
<div class="col-md-6">
    <label>Email</label>
    <div class="form-group">

        <asp:TextBox CssClass="form-control" ID="txtEmail"
            runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>

    </div>
</div>
        </div>
                                                 <div class="row">
     <div class="col-md-4">
         <label>State</label>
         <div class="form-group">
             <asp:DropDownList CssClass="form-control"
                 ID="DropDownListState" runat="server">

                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                 <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>

                                 <asp:ListItem Text="Karnataka" Value="Karnataka"></asp:ListItem>
                <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                                 <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh"></asp:ListItem>
                                 <asp:ListItem Text="Gujrat" Value="Gujrat"></asp:ListItem>
                                 <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>




             </asp:DropDownList>
             

         </div>
     </div>
                             <div class="col-md-4">
    <label>City</label>
    <div class="form-group">

        <asp:TextBox CssClass="form-control" ID="txtCity"
            runat="server" placeholder="City"></asp:TextBox>

    </div>
</div>
                         
                              
     <div class="col-md-4">
         <label>Pincode</label>
         <div class="form-group">

             <asp:TextBox CssClass="form-control" ID="txtPincode"
                 runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>

         </div>
     </div>
                        
                    </div>
                         <div class="row">
     <div class="col">
         <label>Full Address</label>
         <div class="form-group">

             <asp:TextBox CssClass="form-control" ID="txtFullAddress"
                 runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>

         </div>
     </div>
                             </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                <span class="badge badge-pill badge-info">Login Credentials</span></center>
                            </div>
                        </div>
                                                                   <div class="row">
<div class="col-md-6">
    <label>User Id</label>
    <div class="form-group">

        <asp:TextBox CssClass="form-control" ID="txtUserid"
            runat="server" placeholder="User Id" ></asp:TextBox>

    </div>
</div>
                         
<div class="col-md-6">
    <label>Password</label>
    <div class="form-group">

        <asp:TextBox CssClass="form-control" ID="txtPassword"
            runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
</div></div></div>
                        <div class="row">
                            <div class="col">

                           
                         <div class="form-group">
                             <asp:Button class="btn btn-success btn-block btn-lg " ID="btnSignup" runat="server" Text="Sign Up" OnClick="btnSignup_Click" />
    
         
                                 </div>
</div>

 </div>  </div>
                    
                     </div>
    <a href="HomePage.aspx"><< Back To home</a>
                <br />
                <br />
           
        </div>
        </div>
        </div>
</asp:Content>
