<%@ Page Title="" Language="C#" MasterPageFile="~/User/masterPage.Master" AutoEventWireup="true" CodeBehind="items.aspx.cs" Inherits="Auction_Website.User.items" %>
<%@ Import Namespace="Auction_Website" %>
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
                        <span class="d-block text-primary">Unlock Your Desire</span>
                        <span class="d-block text-dark">Place Your Bid</span>
                    </h1>
                </div>
            </div>
        </div>
    </header>

    <section class="products section-padding">
        <div class="container">
            <div class="col-12">
                    <h2 class="mb-5">All Items</h2>
                </div>
            <div class="row">
                <asp:Repeater ID="rItem" runat="server">
                    <ItemTemplate>
                    <div class="col-lg-4 col-12 mb-3">
                    <div class="product-thumb">
                        <a href="item_detail.aspx">
                            <img src="../<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" class="img-fluid product-image" alt="">
                        </a>                      
                        <div class="product-info d-flex">
                            <div>
                                <h5 class="product-title mb-0">
                                    <a href="item_detail.aspx" class="product-title-link"><%# Eval("Name") %></a>
                                </h5>

                                <p class="product-p"><b>Seller : </b><%# Eval("SellerName") %></p>
                                <small class="product-price text-muted ms-auto">Starting Bid : ₹<%#Eval("Starting_bid") %></small>
                            </div>

                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
