<%@ Page Title="" Language="C#" MasterPageFile="~/User/masterPage.Master" AutoEventWireup="true" CodeBehind="item_detail.aspx.cs" Inherits="Auction_Website.User.item_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="preloader">
        <div class="spinner">
            <span class="sk-inner-circle"></span>
        </div>
    </section>
    <header class="site-header section-padding d-flex justify-content-center align-items-center">
        <div class="container">
            <div class="row">

                <div class="col-lg-10 col-12">
                    <h1>
                        <span class="d-block text-primary">We provide you</span>
                        <span class="d-block text-dark">Fashionable Stuffs</span>
                    </h1>
                </div>
            </div>
        </div>
    </header>
    <section class="product-detail section-padding">
         <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rItem" runat="server" OnItemCommand="rItem_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-6 col-12">
                            <div class="product-thumb">
                                <img src="../<%# Auction_Website.Utils.GetImageUrl(Eval("ImageUrl")) %>" class="img-fluid product-image" alt="">
                            </div>
                        </div>

                        <div class="col-lg-6 col-12">
                            <div class="product-info d-flex">
                                <div>
                                    <h2 class="product-title mb-0"><%# Eval("Name") %></h2>
                                </div>
                            </div>
                                <small class="product-price text-muted ms-auto mt-auto mb-5">Starting Bid : ₹<%#Eval("Starting_bid") %></small>
                                <br />
                                <small class="product-price text-muted ms-auto mt-auto mb-5">Current Bid : ₹<%#Eval("Current_bid") %></small>
                                <br />
                                <small class="product-price text-muted ms-auto mt-auto mb-5">Minimum Bid Increase : ₹<%#Eval("Minimum_bid_increase") %></small>

                            <div class="product-description">

                                <strong class="d-block mt-4 mb-2">Description</strong>

                                <p class="lead mb-5"><%# Eval("Description") %></p>
                            </div>

                            <div class="product-cart-thumb row">

                                <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                    <asp:LinkButton ID="btnBid" runat="server" CausesValidation="false" OnClick="btnBid_Click" CommandArgument='<%# Convert.ToInt32(Eval("Current_bid")) + Convert.ToInt32(Eval("Minimum_bid_increase")) %>'>
                                        <i class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Bid <%# Convert.ToInt32(Eval("Current_bid")) + Convert.ToInt32(Eval("Minimum_bid_increase")) %></i>
                                    </asp:LinkButton>
                                    </div>

                                <%--<p>
                                    <a href="#" class="product-additional-link">Details</a>

                                    <a href="#" class="product-additional-link">Delivery and Payment</a>
                                </p>--%>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
