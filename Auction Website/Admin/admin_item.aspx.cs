using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Auction_Website.Admin
{
    public partial class admin_item1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["breadCrum"] = "Item";
            //if (Session["admin"] == null)
            //{
            //    Response.Redirect("../User/user_sign_in.aspx");
            //}
            //else
            //{
            //    getItem();
            //}
            Session["admin"] = "admin";
            getItem();
        }

        protected void rItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            con = new SqlConnection(Connection.GetConnectionString());
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
        private void getItem()
        {

            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Item_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECTAD");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rItem.DataSource = dt;
            rItem.DataBind();
        }
    }
}