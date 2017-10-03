using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M06_Roles
{
    public partial class ShowRanks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = Context.User.Identity.GetUserName();
        }

        protected void ddlTippedRounds_SelectedIndexChanged(object sender, EventArgs e)
        {
            //// read the entire connection string from Web.config
            //string connectionString = WebConfigurationManager.ConnectionStrings["PizzaOrdersConnection"].ConnectionString;
            //// create the connection based on the connection string
            //SqlConnection con = new SqlConnection(connectionString);
            //string sql;
            //sql = "select orders (username,pizzaID, pizzasize, quantity, totalcost, ordertime) values (@Username, @pizzaID, @pizzaSize, @quantity, @totalCost, @orderTime)";
            //SqlCommand cmd = new SqlCommand(sql, con);
            //cmd.Parameters.AddWithValue("@Username", Session["username"]);
            //cmd.Parameters.AddWithValue("@pizzaID", int.Parse(((Label)TotalCostFormView.FindControl("lblPizzaID")).Text));
            //cmd.Parameters.AddWithValue("@pizzaSize", txtSize.Text);
            //cmd.Parameters.AddWithValue("@quantity", int.Parse(txtQuantitySummary.Text));
            //cmd.Parameters.AddWithValue("@totalCost", float.Parse(txtTotalCostSummary.Text));
            //cmd.Parameters.AddWithValue("@orderTime", System.DateTime.Now);

            //using (con)
            //{
            //    con.Open();
            //    int rowCount = cmd.ExecuteNonQuery();
            //    string msg = "";
            //    if (rowCount > 0)
            //    {
            //        msg = "\nOrder is submitted";
            //        lblResult.Text = msg;
            //        lblResult.ForeColor = Color.Green;
            //    }
            //    else
            //    {
            //        msg = "Order has some issues. Some data cannot be sent";
            //        lblResult.Text = msg;
            //        lblResult.ForeColor = Color.Red;
            //    }
            //}

        }
    }
}