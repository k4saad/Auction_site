using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Auction_Website.Admin;

namespace Auction_Website.User
{
    public partial class items : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getItem();
            }
        }
        //private void getCategories()
        //{
        //    con = new SqlConnection(Connection.GetConnectionString());
        //    cmd = new SqlCommand("Category_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "SELECT");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //    rItem.DataSource = dt;
        //    rItem.DataBind();
        //}
        private void getItem()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Item_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ALLITEM");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rItem.DataSource = dt;
            rItem.DataBind();
        }
    }
}