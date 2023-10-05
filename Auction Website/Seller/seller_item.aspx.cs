using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Auction_Website.Admin;

namespace Auction_Website.Seller
{
    public partial class seller_Item : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Item";
                getItem();
                
            }
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int ItemId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Item_Crud", con);
            cmd.Parameters.AddWithValue("@Action", ItemId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@Item_id", ItemId);
            cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@seller_id", ddlSellerName.SelectedValue);
            cmd.Parameters.AddWithValue("@starting_bid", txtStartingBid.Text.Trim());
            cmd.Parameters.AddWithValue("@minimum_bid_increase", txtMinimumBidIncrease.Text.Trim());
            cmd.Parameters.AddWithValue("@start_date", calStart.SelectedDate.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@end_date", calEnd.SelectedDate.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@category_id", ddlCategory.SelectedValue);

            cmd.CommandType = CommandType.StoredProcedure;
            if (fuItemImage.HasFile)
            {
                if (Utils.IsValidExtension(fuItemImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuItemImage.FileName);
                    imagePath = "Images/Item/" + obj.ToString() + fileExtension;
                    fuItemImage.PostedFile.SaveAs(Server.MapPath("~/Images/Item/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = true;
                }                    
            }
            else
            {
                isValidToExecute = true;
            }

            if (isValidToExecute)
            {
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = ItemId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Item " + actionName + " successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getItem();
                    clear();
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

        }

        private void clear()
        {
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ddlCategory.ClearSelection();
            ddlSellerName.ClearSelection();
            txtMinimumBidIncrease.Text = string.Empty;
            txtStartingBid.Text = string.Empty;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
            imgItem.ImageUrl = String.Empty;
        }

        private void getItem()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Item  _Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rItem.DataSource = dt;
            rItem.DataBind();
        }
        protected void rItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}