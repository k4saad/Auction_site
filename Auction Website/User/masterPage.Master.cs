﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Auction_Website.User
{
    public partial class masterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["BuyerId"] == null)
            {
                Response.Redirect("user_sign_in.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("user_sign_in.aspx");
            }
        }
    }
}