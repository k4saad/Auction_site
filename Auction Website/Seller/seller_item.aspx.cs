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
            }
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int ItemId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Item_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "INSERT");
            cmd.Parameters.AddWithValue("@Category_id", ItemId);
            cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
            cmd.CommandType = CommandType.StoredProcedure;
            if (fuItemImage.HasFile)
            {
                if (Utils.IsValidExtension(fuItemImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuItemImage.FileName);
                    imagePath = "Images/Item/" + obj.ToString() + fileExtension;
                    fuItemImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + obj.ToString() + fileExtension);
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
                    actionName = "inserted";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Category " + actionName + " successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    //getItems();
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
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
        }

        protected void rItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}