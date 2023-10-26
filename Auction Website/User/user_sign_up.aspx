<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_sign_up.aspx.cs" Inherits="Auction_Website.User.sign_up" %>

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

    <title>Bids Bay - User Sign Up Page</title>

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
        <section class="preloader">
            <div class="spinner">
                <span class="sk-inner-circle"></span>
            </div>
        </section>
        <div>
            <main>

                <section class="sign-in-form section-padding">
                    <div class="container">
                        <div class="align-self-end">
                            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                        </div>
                        <div class="row">
                         <div class="col-lg-8 mx-auto col-12"> 
                           
                            
                                <h1 class="hero-title text-center mb-5">User Sign Up</h1>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div>
                                            <div>
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name"
                                                    ToolTip="Full Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name must be characters"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" controlToValidate="txtName"></asp:RegularExpressionValidator>
                                            </div>
                                            <br />
                                            <div>
                                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                                                    ToolTip="Username"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                                            </div>
                                             <br />
                                            <div>
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"
                                                    ToolTip="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator> 

                                            </div>
                                            <br />
                                            <div>
                                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter Phone Number"
                                                    ToolTip="Phone Number" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Phone Number is required" ControlToValidate="txtPhone"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Phone Number must have 10 digits"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" controlToValidate="txtPhone"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div>
                                            <div>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address"
                                                    ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                           </div>
                                            <br />
                                            <div>
                                                <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Enter Post Code"
                                                    ToolTip="Post/Zip Code" TextMode ="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage="Post/Zip Code is required" ControlToValidate="txtPostCode"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                                                <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="Post/Zip Code must have 6 digits"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{6}$" controlToValidate="txtPostCode"></asp:RegularExpressionValidator>
                                           
                                            </div>
                                            <br />
                                            <div>
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password"
                                                    ToolTip="/Password" TextMode ="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"
                                                    foreColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator> 
                                            </div>

                                                                                     

                                        </div>
                                    </div>
                                </div>
                                       
                                <asp:Button ID="btnRegister" runat="server" Text="Create account" class="btn custom-btn form-control mt-4 mb-3" 
                                    OnClick="btnRegister_Click"/>

                                <p class="text-center">Already have an account? Please <a href="user_sign_in.aspx">Sign In</a></p>
                                <div class="div-separator w-50 m-auto my-5"><span>or</span></div>
                                <p class="text-center"><a href="../Seller/seller_sign_up.aspx">Seller Sign Up</a></p>
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
