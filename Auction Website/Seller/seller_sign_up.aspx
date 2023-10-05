<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seller_sign_up.aspx.cs" Inherits="Auction_Website.Seller.seller_sign_up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bids Bay - Seller Sign Up Page</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;700;900&display=swap" rel="stylesheet">

    <link href="../TemplateFiles/css/bootstrap.min.css" rel="stylesheet">
    <link href="../TemplateFiles/css/bootstrap-icons.css" rel="stylesheet">

    <link rel="stylesheet" href="../TemplateFiles/css/slick.css" />

    <link href="../TemplateFiles/css/tooplate-little-fashion.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <section class="preloader">
            <div class="spinner">
                <span class="sk-inner-circle"></span>
            </div>
        </section>
        <div>
            <main>

                <section class="sign-in-form section-padding">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-8 mx-auto col-12">

                                <h1 class="hero-title text-center mb-5">Seller Sign Up</h1>

                                <div class="row">
                                    <div class="col-lg-8 col-11 mx-auto">
                                        <form role="form" method="post">

                                            <div class="form-floating">
                                                <input type="email" name="email" id="email" class="form-control" placeholder="Email address">

                                                <label for="email">Email address</label>
                                            </div>

                                            <div class="form-floating my-4">
                                                <input type="password" name="password" id="password" class="form-control" placeholder="Password">

                                                <label for="password">Password</label>

                                                <p class="text-center">* shall include 0-9 a-z A-Z in 4 to 10 characters</p>
                                            </div>

                                            <div class="form-floating">
                                                <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Password">

                                                <label for="confirm_password">Password Confirmation</label>
                                            </div>

                                            <button type="submit" class="btn custom-btn form-control mt-4 mb-3">
                                                Create account
                                            </button>

                                            <p class="text-center">Already have an account? Please <a href="seller_sign_in.aspx">Sign In</a></p>
                                            <div class="div-separator w-50 m-auto my-5"><span>or</span></div>
                                            <p class="text-center"><a href="../User/user_sign_up.aspx">User Sign Up</a></p>

                                        </form>
                                    </div>
                                </div>

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
