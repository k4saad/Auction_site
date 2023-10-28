using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Policy;

namespace Auction_Website.User
{
    public partial class item_detail : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        int itemIdValue;
        int currentBid = 4000;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ItemId = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(ItemId))
                {
                    itemIdValue = Convert.ToInt32(ItemId);
                    getItem();
                }
                
               
            }
            
        }

        private void getItem()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Item_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@Item_id", itemIdValue);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rItem.DataSource = dt;
            rItem.DataBind();
        }

        protected void btnBid_Click(object sender, EventArgs e)
        {
            if (Session["BuyerId"] != null)
            {

                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Item_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "BIDBUYER");
                cmd.Parameters.AddWithValue("@Item_id", itemIdValue);
                cmd.Parameters.AddWithValue("@current_bid", currentBid);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Bid Placed successfully!";
                    lblMsg.CssClass = "alert alert-success";
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error - " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }

            }
            {
                Response.Redirect("user_sign_in.aspx");
            }
        }

        protected void rItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            currentBid = Convert.ToInt32(e.CommandArgument);
        }
    }
}