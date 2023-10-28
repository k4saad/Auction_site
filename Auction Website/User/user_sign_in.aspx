<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_sign_in.aspx.cs" Inherits="Auction_Website.User.sign_in" %>

<!DOCTYPE html>
<script>
    //alert message
    window.onload = function () {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Bids Bay - User Sign In Page</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;700;900&display=swap" rel="stylesheet" />

    <link href="../TemplateFiles/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../TemplateFiles/css/bootstrap-icons.css" rel="stylesheet" />

    <link rel="stylesheet" href="../TemplateFiles/css/slick.css" />

    <link href="../TemplateFiles/css/tooplate-little-fashion.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="preloader">
                <div class="spinner">
                    <span class="sk-inner-circle"></span>
                </div>
            </section>
            <nav class="navbar navbar-expand-lg">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand" href="index.aspx">
                    <strong><span>Bids</span> Bay</strong>
                </a>
            </div>
        </nav>
            <main>

                <section class="sign-in-form section-padding">
                    <div class="container">
                         <div class="align-self-end">
                            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                        </div>
                        <div class="row">

                            <div class="col-lg-8 mx-auto col-12">

                                <h1 class="hero-title text-center mb-5">User Sign In</h1>

                                <div class="row">
                                    <div class="form-floating mb-4 p-0">
                                        <div>
                                            <div class="form-floating p-0">
                                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                                                    ToolTip="Username"></asp:TextBox>
                                                <label for="txtUsername">Username</label>
                                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <br />
                                            <div class="form-floating p-0">
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password"
                                                    ToolTip="Password" TextMode ="Password"></asp:TextBox>
                                                <label for="password">Password</label>
                                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                                            </div>
                                        </div>
                                </div>

                            </div>

                                 <asp:Button ID="btnLogin" runat="server" Text="Sign in" class="btn custom-btn form-control mt-4 mb-3" 
                                    OnClick="btnLogin_Click"/>

                                <p class="text-center">Don’t have an account? <a href="user_sign_up.aspx">Create One</a></p>
                                <div class="div-separator w-50 m-auto my-5"><span>or</span></div>
                                <p class="text-center"><a href="../Seller/seller_sign_in.aspx">Sign in as Seller</a></p>
                                </div>
                        </div>
                    </div>
                </section>

            </main>
        </div>
    </form>
    <!-- JAVASCRIPT FILES -->
    <script src="../TemplateFiles/js/jquery.min.js"></script>
    <script src="../TemplateFiles/js/bootstrap.bundle.min.js"></script>
    <script src="../TemplateFiles/js/Headroom.js"></script>
    <script src="../TemplateFiles/js/jQuery.headroom.js"></script>
    <script src="../TemplateFiles/js/slick.min.js"></script>
    <script src="../TemplateFiles/js/custom.js"></script>
</body>
</html>
