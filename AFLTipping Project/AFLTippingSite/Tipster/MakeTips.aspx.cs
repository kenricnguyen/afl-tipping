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
using Microsoft.AspNet.Identity;

namespace M06_Roles.Tipster
{
    public partial class MakeTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = Context.User.Identity.GetUserName();

            lblResult.Text = "";

           


            if (IsPostBack)
            {
                try
                {
                    System.Text.StringBuilder table = new System.Text.StringBuilder();
                    string round = ddlTippingRounds.SelectedValue;
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AFLTipping"].ToString()))
                    {
                        con.Open();
                        string getFixture = "SELECT * From fixtures where roundID = @round";
                        SqlCommand cmd = new SqlCommand(getFixture, con);
                        cmd.Parameters.AddWithValue("@round", round);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            table.Append("<table class=\"table\">");
                            table.Append("<tr><th>Game</th><th>Home team</th><th>Away team</th><th>Tips</th><th>Margin</th></tr>");
                            table.Append("</tr>");
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
                                    table.Append("<td><select required class='form-control' name='tipResult" + rowCount + "'" + ">");
                                    table.Append("<option value=\"\">Please select</option>");
                                    table.Append("<option value=\"Win\">Win</option>");
                                    table.Append("<option value=\"Lose\">Lose</option>");
                                    table.Append("<option value=\"Draw\">Draw</option>");
                                    table.Append("</select></ td>");

                                    //input must be a whole number between 0 and 200
                                    table.Append("<td><input required name='margin" + rowCount + "'" + "type='number' min='0' max='200' step='1' class='form-control'  placeholder='0-200' ></ td>");

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
            else
            {
                //try to populate data to ddl control for round
                ddlTippingRounds.DataBind();
                //if there is no data a message will be shown and the view 1 control will be disabled
                if (ddlTippingRounds.SelectedValue == "")
                {
                    lblResult.Text = "You have tipped them all !";
                    lblResult.ForeColor = Color.Green;
                    panelSelectRound.Visible = false;
                }
                else
                {
                    lblRoundId.Text = "Round " + ddlTippingRounds.SelectedValue;
                }
            }
        }

        protected void btnSelectRound_Click(object sender, EventArgs e)
        {
            // load view 2: tippingView
            mtvMakeTips.ActiveViewIndex = 1;
            //enable submit button
            btnSubmitTips.Enabled = true;

            //change Round id based on current selected value from ddlTippingRounds
            if (ddlTippingRounds.SelectedValue != "")
            {
                lblRoundId.Text ="Round "+ ddlTippingRounds.SelectedValue;
            }

        }



        protected void btnSelectRound2_Click(object sender, EventArgs e)
        {
            //return to view one for more tipping
            mtvMakeTips.ActiveViewIndex = 0;
            ddlTippingRounds.DataBind();
        }

        protected void btnSubmitTips_Click(object sender, EventArgs e)
        {
            btnSubmitTips.Enabled = false;

            int[] game = new int[10];
            bool check = false;
            lblResult.ForeColor = Color.Red;
            string err = "Please enter a whole number between 0 and 200 for Margin of Game ";
            for (int i = 1; i < 10; i++)
            {
                string tipResult = Request["tipResult" + i];
                string marginTemp = Request.Form["margin" + i];//get margin input in string format
                check = int.TryParse(marginTemp, out game[i]); // try to parse it to ensure if it's proper int
                                                               // check if margin is a int, if not exit function and show error
                if (!check) { lblResult.Text = err + i; return; }
                //check if margin is between 0 & 200, if not exit function and show error
                else if (game[i] > 200 && game[i] < 0) { lblResult.Text = err + i; return; }
                switch (tipResult)
                {
                    case "Win":
                        //do nothing because by default margin is kept the same
                        break;
                    case "Lose":
                        game[i] = -game[i];
                        break;
                    case "Draw":
                        game[i] = 0;
                        break;
                }
            }
            if (Page.IsValid)
            {
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
            if (ddlTippingRounds.SelectedValue != "")
            {
                lblRoundId.Text ="Round "+ ddlTippingRounds.SelectedValue;
            }
        }


    }
}