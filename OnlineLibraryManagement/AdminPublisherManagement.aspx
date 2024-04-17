﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPublisherManagement.aspx.cs" Inherits="OnlineLibraryManagement.AdminPublisherManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <%--<script type="text/javascript">
     $(document).ready(function () {
         $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
     });
     </script>--%>
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
                                    <h3>Publisher Details</h3>

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/publsher1.png" />

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
                                <label>Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPubId"
                                            runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary"
                                            ID="btnGo" runat="server" Text="GO" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-8">
                                <label>Publisher Name</label>
                                <asp:TextBox CssClass="form-control" ID="txtPubNAme"
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
                                    <h3>Publisher List</h3>
                                      <hr />
                                </center>
                            </div>
                            </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                            <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [Tbl_publisher]"></asp:SqlDataSource>
                                </center>
                            </div>
                        </div>
                       
                  </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
