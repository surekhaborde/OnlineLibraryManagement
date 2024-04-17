<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookIssuing.aspx.cs" Inherits="OnlineLibraryManagement.BookIssuing" %>

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
                                    <h3>Book Issuing</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/book.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtMemberID" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="form-group">
                                     <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" placeholder="Book ID"></asp:TextBox>
                                <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                                    </div>
                                         </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                 <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtMemberName" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                            </div>
                                </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                 <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                            </div>
                      
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                <label>start Date</label>
                                <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox>
</div>
                            </div>
                            <div class="col-md-6">
                                 <div class="form-group">
                                <label>End Date</label>
                                <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date"></asp:TextBox>
</div>
                            </div>
                        </div>
                        
                        <br />
                        
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Button class="btn btn-block btn-lg btn-success" ID="btnIssue" runat="server" Text="Issue" OnClick="btnIssue_Click" />
                            </div>
                            <div class="col-md-6">
                                <asp:Button class="btn btn-block btn-lg btn-primary" ID="btnReturn" runat="server" Text="Return" OnClick="btnReturn_Click" />

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
                           <h4>Issued Book List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [Tbl_book_issue]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                <asp:BoundField DataField="member_name" HeaderText="Name" SortExpression="member_name" />
                                <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                <asp:BoundField DataField="book_name" HeaderText="Book Name" />
                                <asp:BoundField DataField="issue_date" HeaderText="Issued Date" SortExpression="issue_date" />
                                <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
