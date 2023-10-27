<%@ Page Title="" Language="C#" MasterPageFile="~/User/masterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Auction_Website.User.index" %>
<%@ Import Namespace="Auction_Website" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="preloader">
        <div class="spinner">
            <span class="sk-inner-circle"></span>
        </div>
    </section>
    <section class="about section-padding">
        <div class="container">
            <div class="row">

                <div class="col-12 text-center">
                    <h2 class="mb-5">Welcome to <span>Bids</span> Bay</h2>
                </div>

                <div class="col-lg-2 col-12 mt-auto mb-auto">
                    <ul class="nav nav-pills mb-5 mx-auto justify-content-center align-items-center" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Introduction</button>
                        </li>

                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-youtube-tab" data-bs-toggle="pill" data-bs-target="#pills-youtube" type="button" role="tab" aria-controls="pills-youtube" aria-selected="true">How we work?</button>
                        </li>

                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-skill-tab" data-bs-toggle="pill" data-bs-target="#pills-skill" type="button" role="tab" aria-controls="pills-skill" aria-selected="false">Capabilites</button>
                        </li>
                    </ul>
                </div>

                <div class="col-lg-10 col-12">
                    <div class="tab-content mt-2" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

                            <div class="row">
                                <div class="col-lg-7 col-12">
                                    <img src="../TemplateFiles/images/christies-auction.jpg" class="img-fluid" alt="">
                                </div>

                                <div class="col-lg-5 col-12">
                                    <div class="d-flex flex-column h-100 ms-lg-4 mt-lg-0 mt-5">
                                        <h4 class="mb-3"><span>Bid</span>, Win, Repeat<br>
                                            – Bids <span>Bay's </span></h4>

                                        <p>Welcome to Bids Bay, your premier online auction. At Bids Bay, we've curated a diverse range of auctions, featuring everything from rare collectibles to cutting-edge technology, fine art to vintage treasures. </p>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="pills-youtube" role="tabpanel" aria-labelledby="pills-youtube-tab">

                            <div class="row">
                                <div class="col-lg-7 col-12">
                                    <div class="ratio ratio-16x9">
                                        <img src="../TemplateFiles/images/auction_work.png" class="img-fluid" alt="">
                                    </div>
                                </div>

                                <div class="col-lg-5 col-12">
                                    <div class="d-flex flex-column h-100 ms-lg-4 mt-lg-0 mt-5">
                                        <h4 class="mb-3">Join Bids Bay</h4>

                                        <p>Join our passionate community of bidders and sellers, and immerse yourself in the excitement of auctions where every bid counts.</p>

                                        <p>With Bids Bay, you're not just a participant; you're part of a dynamic community of auction enthusiasts.</p>

                                        <div class="mt-2 mt-lg-auto">
                                            <a href="../Seller/seller_sign_up.aspx" class="custom-link mb-2">Work with us
                                            <i class="bi-arrow-right ms-2"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="pills-skill" role="tabpanel" aria-labelledby="pills-skill-tab">
                            <div class="row">
                                <div class="col-lg-7 col-12">
                                    <img src="../TemplateFiles/images/Auction_seller.jpeg" class="img-fluid" alt="">
                                </div>

                                <div class="col-lg-5 col-12">
                                    <div class="d-flex flex-column h-100 ms-lg-4 mt-lg-0 mt-5">
                                        <h4 class="mb-3">What can help you?</h4>

                                        <p>Our platform unites passionate sellers seeking top value for their treasures with enthusiastic buyers on the hunt for remarkable deals. Dive into a dynamic world of spirited auctions</p>

                                        <div class="mt-2 mt-lg-auto">
                                            <a href="items.aspx" class="custom-link mb-2">Explore Items
                                            <i class="bi-arrow-right ms-2"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="featured-product section-padding">
        <div class="container">
            <div class="col-12 text-center">
                <h2 class="mb-5">Live Items</h2>
            </div>
            <div class="row">
                <asp:Repeater ID="rItem" runat="server">
                    <ItemTemplate>
                    <div class="col-lg-4 col-12 mb-3">
                    <div class="product-thumb">
                        <a href="item_detail.aspx">
                            <img src="../<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" class="img-fluid product-image" alt="">
                        </a>

                        <div class="product-top d-flex">
                            <span class="product-alert me-auto">Live</span>
                        </div>

                        <div class="product-info d-flex">
                            <div>
                                <h5 class="product-title mb-0">
                                    <a href="item_detail.aspx" class="product-title-link"><%# Eval("Name") %></a>
                                </h5>

                                <p class="product-p"><b>Seller : </b><%# Eval("SellerName") %></p>
                                <small class="product-price text-muted ms-auto mt-auto mb-5">Starting Bid : ₹<%#Eval("Starting_bid") %></small>
                            </div>
                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:Repeater>
                
                <div class="col-12 text-center">
                    <a href="items.aspx" class="view-all">View All Items</a>
                </div>

            </div>
        </div>
    </section>

</asp:Content>


