using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Auction_Website.Seller
{
    public partial class seller_sign_in : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SellerId"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Seller_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4LOGIN");
            cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                Session["username"] = txtUsername.Text.Trim();
                Session["SellerId"] = dt.Rows[0]["Seller_id"];
                Session["SellerName"] = dt.Rows[0]["Name"];
                Session["SellerImage"] = dt.Rows[0]["ImageUrl"];
                Response.Redirect("seller_dashboard.aspx");
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Invalid Credentials..";
                lblMsg.CssClass = "alert alert-danger";
            }
        }
    }
}