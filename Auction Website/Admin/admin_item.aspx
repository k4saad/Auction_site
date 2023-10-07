<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_masterpage.Master" AutoEventWireup="true" CodeBehind="admin_item.aspx.cs" Inherits="Auction_Website.Admin.admin_item1" %>
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
                                            <h4 class="sub-title">Item List</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                        <asp:Repeater ID="rItem" runat="server" OnItemCommand="rItem_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Item_id</th>
                                                                        <th>Name</th>
                                                                        <th>Description</th>
                                                                        <th>Image</th>
                                                                        <th>Category Name</th>
                                                                        <th>Starting Bid</th>
                                                                        <th>Current Bid</th>
                                                                        <th>Min Bid Increase</th>
                                                                        <th>Highest Bidder</th>
                                                                        <th>Start Date</th>
                                                                        <th>End Date</th>
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                    <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"> <%# Eval("Item_id") %></td>
                                                                <td> <%# Eval("Name") %></td>
                                                                <td> <%# Eval("Description") %></td>
                                                                <td>
                                                                    <img alt ="" width ="40" src="<%# Auction_Website.Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                                                                </td>
                                                                <td> <%# Eval("CategoryName") %></td>      
                                                                <td> <%# Eval("Starting_bid") %></td>
                                                                <td> <%# Eval("Current_bid") %></td>
                                                                <td> <%# Eval("Minimum_bid_increase") %></td>
                                                                <td> <%# Eval("Current_highest_bidder") %></td>
                                                                <td> <%# Eval("Start_date") %></td>
                                                                <td> <%# Eval("End_date") %></td>
                                                                <td>

                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server"  CssClass="badge bg-danger" CausesValidation="false" CommandArgument='<%# Eval("Item_id") %>' CommandName="delete" OnClientClick="return confirm ('Do you want to delete this Item?');">
                                                                        <i class="ti-trash"></i>
                                                                    </asp:LinkButton>

                                                                </td>
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
