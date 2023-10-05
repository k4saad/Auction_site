<%@ Page Title="" Language="C#" MasterPageFile="~/User/masterPage.Master" AutoEventWireup="true" CodeBehind="items.aspx.cs" Inherits="Auction_Website.User.items" %>

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
            <div class="row">

                <div class="col-12">
                    <h2 class="mb-5">All Items</h2>
                </div>

                <div class="col-lg-4 col-12 mb-3">
                    <div class="product-thumb">
                        <a href="item_detail.aspx">
                            <img src="../TemplateFiles/images/product/team-fredi-8HRKoay8VJE-unsplash.jpeg" class="img-fluid product-image" alt="">
                        </a>

                        <div class="product-top d-flex">
                            <span class="product-alert">Trending</span>

                            <a href="#" class="bi-heart-fill product-icon ms-auto"></a>
                        </div>

                        <div class="product-info d-flex">
                            <div>
                                <h5 class="product-title mb-0">
                                    <a href="item_detail.aspx" class="product-title-link">Package</a>
                                </h5>

                                <p class="product-p"><b>Owner :</b> Saad</p>
                                <small class="product-price text-muted ms-auto">Starting Price : ₹50</small>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-12 mb-3">
                    <div class="product-thumb">
                        <a href="item_detail.aspx">
                            <img src="../TemplateFiles/images/product/quokkabottles-kFc1_G1GvKA-unsplash.jpeg" class="img-fluid product-image" alt="">
                        </a>

                        <div class="product-top d-flex">
                            <a href="#" class="bi-heart-fill product-icon ms-auto"></a>
                        </div>

                        <div class="product-info d-flex">
                            <div>
                                <h5 class="product-title mb-0">
                                    <a href="item_detail.aspx" class="product-title-link">Bottle</a>
                                </h5>

                                <p class="product-p"><b>Owner :</b> Saad</p>
                                <small class="product-price text-muted ms-auto">Starting Price : ₹100</small>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-12 mb-3">
                    <div class="product-thumb">
                        <a href="item_detail.aspx">
                            <img src="../TemplateFiles/images/product/anis-m-WnVrO-DvxcE-unsplash.jpeg" class="img-fluid product-image" alt="">
                        </a>

                        <div class="product-top d-flex">
                            <a href="#" class="bi-heart-fill product-icon ms-auto"></a>
                        </div>

                        <div class="product-info d-flex">
                            <div>
                                <h5 class="product-title mb-0">
                                    <a href="item_detail.aspx" class="product-title-link">Medicine</a>
                                </h5>

                                <p class="product-p"><b>Owner :</b> Saad</p>
                                <small class="product-price text-muted ms-auto">Starting Price : ₹450</small>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
