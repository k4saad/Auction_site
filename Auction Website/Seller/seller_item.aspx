<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/seller_masterpage.Master" AutoEventWireup="true" CodeBehind="seller_item.aspx.cs" Inherits="Auction_Website.Seller.seller_Item" %>
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

                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Item</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Item Name</label>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Category Name" required></asp:TextBox>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                 
                                                 <div class="form-group">
                                                    <label>Item Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuItemImage" runat="server" CssClass="form-control"/>
                                                    </div>
                                                </div>


                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click"/>
                                                    &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                                        CausesValidation="false" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-4 mobile-inputs">
                                            <h4 class="sub-title">Item List</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rItem" runat="server" OnItemCommand="rItem_ItemCommand" OnItemDataBound="rItem_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Category_id</th>
                                                                        <th>Name</th>
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Category_id") %> </td>
                                                                <td><%# Eval("name") %> </td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete" CssClass="badge bg-danger" CommandArgument='<%# Eval("Category_id") %>' OnClientClick="return confirm ('Do you want to delete this Category?');">
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
