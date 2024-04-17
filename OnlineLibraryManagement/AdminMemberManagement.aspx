<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="OnlineLibraryManagement.AdminMemberManagement" %>

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
                                    <h3>Member Details</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/profile.png" />
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
                                        <asp:TextBox CssClass="form-control mr-1" ID="txtMemberID" runat="server" placeholder=" ID">

                                        </asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary mr-1" ID="btnOK" runat="server" OnClick="btnOK_Click">
                                  <i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full name" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="txtAccStatus" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="btnActive" runat="server" OnClick="btnActive_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="btnPending" runat="server" OnClick="btnPending_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="btnDelete" runat="server" OnClick="btnDelete_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact No.</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtContact" runat="server" placeholder="Contact" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtState" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pincode</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPincode" runat="server" placeholder="Pincode" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">

                                <label>Full Postal Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" ReadOnly="True" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button class="btn btn-block btn-lg btn-danger" ID="btnDeletePermanently" runat="server" Text="Delete User Permanently" OnClick="btnDeletePermanently_Click" />
                            </div>

                        </div>
                    </div>
                    <a href="HomePage.aspx"><< Back to Home</a><br>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member's List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [Tbl_member]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="GridView2" class="table table-striped table-bordered"
                                    AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="member_id" DataSourceID="SqlDataSource1" >
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                  
                                   <%-- <Columns>
                                        <asp:DynamicField DataField="member_id" HeaderText="ID" />
                                        <asp:DynamicField DataField="full_name" HeaderText="Name" />
                                        <asp:DynamicField DataField="account_status" HeaderText="Status" />
                                        <asp:DynamicField DataField="contact_no" HeaderText="Contact" />
                                        <asp:DynamicField DataField="email" HeaderText="Email" />
                                        <asp:DynamicField DataField="state" HeaderText="State" />
                                        <asp:DynamicField DataField="city" HeaderText="City" />
                                    </Columns>--%>
                                  
                                    <Columns>
                                        <asp:BoundField  DataField="member_id" HeaderText="ID" />
                                        <asp:BoundField  DataField="full_name" HeaderText="Name" />
                                        <asp:BoundField  DataField="account_status" HeaderText="Status" />
                                        <asp:BoundField  DataField="contact_no" HeaderText="Contact" />
                                        <asp:BoundField  DataField="email" HeaderText="Email" />
                                        <asp:BoundField  DataField="state" HeaderText="State" />
                                        <asp:BoundField  DataField="city" HeaderText="City" />
                                    </Columns>
                                  
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                  
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>




</asp:Content>
