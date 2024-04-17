<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="OnlineLibraryManagement.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

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
                                    <img width="100px" src="images/profile.png" />

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account status -</span>
                                    <asp:Label class="badge badge-pill badge-info" ID="lblstatus" runat="server" Text="Your status"></asp:Label>
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

                                    <asp:TextBox class="form-control" ID="txtFullName"
                                        runat="server" placeholder="Full Name"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">

                                <label>Date of Birth</label>
                                <div class="form-group">

                                    <asp:TextBox class="form-control" ID="txtDateofBirth"
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

                                    <asp:TextBox CssClass="form-control" ID="TextBox2"
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
                                          <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                              <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                              <asp:ListItem Text="Assam" Value="Assam" />
                              <asp:ListItem Text="Bihar" Value="Bihar" />
                              <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Goa" Value="Goa" />
                              <asp:ListItem Text="Gujarat" Value="Gujarat" />
                              <asp:ListItem Text="Haryana" Value="Haryana" />
                              <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                              <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                              <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                              <asp:ListItem Text="Karnataka" Value="Karnataka" />
                              <asp:ListItem Text="Kerala" Value="Kerala" />
                              <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                              <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                              <asp:ListItem Text="Manipur" Value="Manipur" />
                              <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                              <asp:ListItem Text="Mizoram" Value="Mizoram" />
                              <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                              <asp:ListItem Text="Punjab" Value="Punjab" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Sikkim" Value="Sikkim" />
                              <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                              <asp:ListItem Text="Telangana" Value="Telangana" />
                              <asp:ListItem Text="Tripura" Value="Tripura" />
                              <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                              <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                              <asp:ListItem Text="West Bengal" Value="West Bengal" />
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
                            <div class="col-md-4">
                                <label>User Id</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtUserid"
                                        runat="server" placeholder="User Id" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtOldPassword"
                                        runat="server" placeholder="User Id" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtNewPassword"
                                        runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8 mx-auto">


                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block btn-lg " ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />


                                </div>
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

                                    <img width="100px" src="images/booksimg.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your issued Books</h4>
                                    <asp:Label class="badge badge-pill badge-info" ID="lblBookDuedate" runat="server" Text="Info about book due date"></asp:Label>

                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [Tbl_book_issue]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridViewBooks" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridViewBooks_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="member_name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
