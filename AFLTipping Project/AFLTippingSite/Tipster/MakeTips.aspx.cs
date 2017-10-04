using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Drawing;

namespace M06_Roles.Tipster
{
    public partial class MakeTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlTippingRounds.DataBind();
            lblResult.Text = "";
            System.Text.StringBuilder table = new System.Text.StringBuilder();
            if (IsPostBack)
            {
                try
                {
                    string round = ddlTippingRounds.SelectedValue;
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AFLTipping"].ToString()))
                    {
                        con.Open();
                        string getFixture = "SELECT * From fixtures where roundID = @round";
                        SqlCommand cmd = new SqlCommand(getFixture, con);
                        cmd.Parameters.AddWithValue("@round", round);
                        SqlDataReader reader = cmd.ExecuteReader();
                        table.Append("<table class=\"table\">");
                        table.Append("<tr><th>Game</th><th>Home team</th><th>Away team</th><th>Tips</th><th>Margin</th></tr>");
                        table.Append("</tr>");
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                int rowCount = 0;
                                for (int i = 1; i < 18; i += 2)
                                {
                                    rowCount++;
                                    table.Append("<tr>");
                                    table.Append("<td>" + rowCount + "</td>"); //show game OR row number
                                    table.Append("<td>" + reader[i] + "</td>"); //show home team
                                    table.Append("<td>" + reader[i + 1] + "</td>"); //show away team

                                    //show ddl of win, lose or draw options
                                    table.Append("<td><select name='tipResult" + rowCount + "'" + ">");
                                    table.Append("<option value=\"Win\">Win</option>");
                                    table.Append("<option value=\"Lose\">Lose</option>");
                                    table.Append("<option value=\"Draw\">Draw</option>");
                                    table.Append("</select></ td>");

                                    table.Append("<td><input name='margin" + rowCount + "'" + "type='text' class='form-control' value='8'></ td>");

                                    //table.Append("<td><select id=\"tipResult\">");
                                    //table.Append("<option value=\"Win\">Win</option>");
                                    //table.Append("<option value=\"Lose\">Lose</option>");
                                    //table.Append("<option value=\"Draw\">Draw</option>");
                                    //table.Append("</select></ td>");

                                    //table.Append("<td><input id=\"margin\" type=\"text\" class=\"form - control\"></ td>");
                                    table.Append("</tr>");
                                }
                            }
                        }
                        table.Append("</table>");
                        tableHolder.Controls.Add(new Literal { Text = table.ToString() });
                        reader.Close();
                        con.Close();
                    }

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }

            }

        }

        protected void btnSelectRound_Click(object sender, EventArgs e)
        {

            mtvMakeTips.ActiveViewIndex = 1;

        }


        protected void viewSelectTippingRound_Activate(object sender, EventArgs e)
        {
            //if (SqlDataSource1.SelectCommand.Contains(String.Empty))
            //{
            //    ddlTippingRounds.Visible = false;
            //    btnSelectRound.Visible = false;
            //    lblResult.Text="You have tipped all rounds!";
            //}
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSelectRound2_Click(object sender, EventArgs e)
        {
            //return to view one for more tipping
            mtvMakeTips.ActiveViewIndex = 0;
        }

        protected void btnSubmitTips_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int[] game= new int[10];

                for (int i = 1; i < 10; i++)
                {
                    string tipResult = Request["tipResult"+i];
                    switch (tipResult)
                    {
                        case "Win":
                            game[i]=int.Parse( Request.Form["margin" + i]);
                            break;
                        case "Lose":
                            game[i] = -int.Parse(Request.Form["margin" + i]);
                            break;
                        case "Draw":
                            game[i] = 0;
                            break;
                    }
                }

                // If everything Validated according to specs
                //Do the following
                // read the entire connection string from Web.config
                string connectionString = WebConfigurationManager.ConnectionStrings["AFLTipping"].ConnectionString;
                // create the connection based on the connection string
                SqlConnection con = new SqlConnection(connectionString);
                string sql;
                sql = "insert tips (username,roundID, game1, game2, game3, game4,game5,game6,game7,game8,game9,tiptime) values (@Username, @RoundID, @Game1, @Game2, @Game3, @Game4,@Game5,@Game6,@Game7,@Game8,@Game9,@Tiptime)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Username", Session["username"]);
                cmd.Parameters.AddWithValue("@RoundID", ddlTippingRounds.SelectedValue);
                cmd.Parameters.AddWithValue("@Game1", game[1]);
                cmd.Parameters.AddWithValue("@Game2", game[2]);
                cmd.Parameters.AddWithValue("@Game3", game[3]);
                cmd.Parameters.AddWithValue("@Game4", game[4]);
                cmd.Parameters.AddWithValue("@Game5", game[5]);
                cmd.Parameters.AddWithValue("@Game6", game[6]);
                cmd.Parameters.AddWithValue("@Game7", game[7]);
                cmd.Parameters.AddWithValue("@Game8", game[8]);
                cmd.Parameters.AddWithValue("@Game9", game[9]);

                cmd.Parameters.AddWithValue("@Tiptime", System.DateTime.Now);

                using (con)
                {
                    con.Open();
                    int rowCount = cmd.ExecuteNonQuery();
                    string msg = "";
                    if (rowCount > 0)
                    {
                        msg = "\nYour tip has been submitted successfully";
                        lblResult.Focus();
                        lblResult.Text = msg;
                        lblResult.ForeColor = Color.Green;
                    }
                    else
                    {
                        msg = "Your tip cannot be submitted. Please contact your administrator";
                        lblResult.Focus();
                        lblResult.Text = msg;
                        lblResult.ForeColor = Color.Red;
                    }
                }
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
        {

        }
    }
}