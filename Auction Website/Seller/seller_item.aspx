<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/seller_masterpage.Master" AutoEventWireup="true" CodeBehind="seller_item.aspx.cs" Inherits="Auction_Website.Seller.seller_item" %>
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
        <script>
            function ImagePreview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=imgItem.ClientID %>').prop('src', e.target.result)
                            .width(200)
                            .height(200);
                    };
                    reader.readAsDataURL(input.files[0]);

                }
            }
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
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Item Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>

                                                 <div class="form-group">
                                                    <label>Item Description</label>
                                                    <div>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Item Description" TextMode="MultiLine" ></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                                                        
                                                    </div>
                                                </div> 

                                                <div class="form-group">
                                                    <label>Starting Bid</label>
                                                    <div>
                                                        <asp:TextBox ID="txtStartingBid" runat="server" CssClass="form-control" placeholder="Enter Item Starting Bid"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Startin Bid is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtStartingBid"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Starting Bid must be in number" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtStartingBid" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Minimum Bid Increase</label>
                                                    <div>
                                                        <asp:TextBox ID="txtMinimumBidIncrease" runat="server" CssClass="form-control" placeholder="Enter Item Minimum Bid Increase"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Minimum Bid Increase is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMinimumBidIncrease"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Minimum Bid Increase must be in number" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMinimumBidIncrease" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                                                    
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Item Category</label>
                                                    <div>
                                                   
                                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Category_id" AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Category is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCategory" InitialValue="0"></asp:RequiredFieldValidator>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [Category_id], [name] FROM [Category]"></asp:SqlDataSource>
                                                    </div>
                                                </div>

                                                
                                                 <div class="form-group">
                                                    <label>Start Date</label>
                                                    <div>
                                                        <asp:Calendar ID="calStart" runat="server" CssClass="form-control" ></asp:Calendar>
                                                        
                                                    </div>
                                                </div>

                                                   <div class="form-group">
                                                    <label>End Date</label>
                                                    <div>
                                                        <asp:Calendar ID="calEnd" runat="server" CssClass="form-control" ></asp:Calendar>
                                                        
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Item Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuItemImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);"/>

                                                    </div>
                                                </div>


                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click"/>
                                                    &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                                        CausesValidation="false" OnClick="btnClear_Click"/>
                                                </div>
                                                <div>
                                                    <asp:Image ID="imgItem" runat="server" CssClass="img-thumbnail" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-8 mobile-inputs">
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
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CausesValidation="false" CommandArgument='<%# Eval("Item_id") %>' CommandName="edit">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
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



