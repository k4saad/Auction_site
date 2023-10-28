<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_masterpage.Master" AutoEventWireup="true" CodeBehind="admin_buyer.aspx.cs" Inherits="Auction_Website.Admin.admin_buyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        //alert message
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">                                       
                                        <div class="col-md-12 mobile-inputs">
                                            <h4 class="sub-title">Buyer List</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rBuyer" runat="server" OnItemCommand="rBuyer_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">SrNo</th>
                                                                        <th>Name</th>
                                                                        <th>Username</th>
                                                                        <th>Email</th>
                                                                        <th class="datatable-nosort">Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                 <td class="table-plus"><%# Eval("SrNO") %> </td>
                                                                <td><%# Eval("Name") %> </td>
                                                                <td><%# Eval("Username") %> </td>
                                                                <td><%# Eval("Email") %> </td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete" CssClass="badge bg-danger" CommandArgument='<%# Eval("Buyer_id") %>' OnClientClick="return confirm ('Do you want to delete this Buyer?');">
                                                                        <i class="ti-trash"></i>
                                                                    </asp:LinkButton></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                         </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
