using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Auction_Website.Seller
{
    public partial class seller_item : System.Web.UI.Page
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
            cmd = new SqlCommand("Item_Crud", con);
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
            lblMsg.Visible = false;
            con = new SqlConnection(Connection.GetConnectionString());
            if (e.CommandName == "edit")
            {
                cmd = new SqlCommand("Item_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@Item_id", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
                txtStartingBid.Text = dt.Rows[0]["Starting_bid"].ToString();
                txtMinimumBidIncrease.Text = dt.Rows[0]["Minimum_bid_increase"].ToString();
                ddlCategory.SelectedValue = dt.Rows[0]["Category_id"].ToString();
                ddlSellerName.SelectedValue = dt.Rows[0]["Seller_id"].ToString();


                imgItem.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imgItem.Height = 200;
                imgItem.Width = 200;
                hdnId.Value = dt.Rows[0]["Item_id"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";
            }
            else if (e.CommandName == "delete")
            {
                cmd = new SqlCommand("Item_Crud", con);

                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@Item_id", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Item deleted successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getItem();
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

        //protected void rItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Label lblActive = e.Item.FindControl("lblIsActive") as Label;
        //        if(calStart.)
        //    }
        //}

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}