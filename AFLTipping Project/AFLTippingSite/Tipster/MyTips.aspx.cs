using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace M06_Roles
{
    public partial class MyTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TipsTable.Visible = false;
            String usernameString = Page.User.Identity.Name;
            SqlDataSource1.SelectParameters["username"].DefaultValue = usernameString;
            string connectionString = WebConfigurationManager.ConnectionStrings["AFLTipping"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            String sql = "SELECT COUNT(tipsetID) FROM tips WHERE username = @username";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@username", usernameString);
            Int32 number = -1;
            using (con)
            {
                con.Open();
                number = (Int32)cmd.ExecuteScalar();
            }
            if (number == 0)
            {
                DropDownList1.Visible = false;
                PageText.Text = "You have no tips, please make a tip before viewing this page";
                TipsTable.Visible = false;
            }
            else if (number > 0)
            {
                DropDownList1.Visible = true;
            }
            else
            {
                Console.WriteLine("Database error");
            }
        }

        protected void Button1_Press(object sender, EventArgs e)
        {
            TipsTable.Visible = true;
            String usernameString = Page.User.Identity.Name;
            String connectionString = WebConfigurationManager.ConnectionStrings["AFLTipping"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            String sql = "SELECT fixtures.home1, results.game1, fixtures.away1 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@username", usernameString);
            cmd.Parameters.AddWithValue("@roundID", Int32.Parse(DropDownList1.SelectedValue));
            using (con)
            {
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        rowNumber1.Text = "1";
                        homeTeam1.Text = reader["home1"].ToString();
                        if ((Int32)reader["game1"] > 0)
                        {
                            winorloss1.Text = "wins";
                        }
                        else if ((Int32)reader["game1"] == 0)
                        {
                            winorloss1.Text = "draws with";
                        }
                        else if ((Int32)reader["game1"] < 0)
                        {
                            winorloss1.Text = "loses to";
                        }

                        awayTeam1.Text = reader["away1"].ToString();

                        margin1.Text = "by " + Convert.ToString(Math.Abs((Int32)reader["game1"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home2, results.game2, fixtures.away2 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader2 = cmd.ExecuteReader())
                {
                    while (reader2.Read())
                    {
                        rowNumber2.Text = "2";
                        homeTeam2.Text = reader2["home2"].ToString();
                        if ((Int32)reader2["game2"] > 0)
                        {
                            winorloss2.Text = "wins";
                        }
                        else if ((Int32)reader2["game2"] == 0)
                        {
                            winorloss2.Text = "draws with";
                        }
                        else if ((Int32)reader2["game2"] < 0)
                        {
                            winorloss2.Text = "loses to";
                        }

                        awayTeam2.Text = reader2["away2"].ToString();

                        margin2.Text = "by " + Convert.ToString(Math.Abs((Int32)reader2["game2"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home3, results.game3, fixtures.away3 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader3 = cmd.ExecuteReader())
                {
                    while (reader3.Read())
                    {
                        rowNumber3.Text = "3";
                        homeTeam3.Text = reader3["home3"].ToString();
                        if ((Int32)reader3["game3"] > 0)
                        {
                            winorloss3.Text = "wins";
                        }
                        else if ((Int32)reader3["game3"] == 0)
                        {
                            winorloss3.Text = "draws with";
                        }
                        else if ((Int32)reader3["game3"] < 0)
                        {
                            winorloss3.Text = "loses to";
                        }

                        awayTeam3.Text = reader3["away3"].ToString();

                        margin3.Text = "by " + Convert.ToString(Math.Abs((Int32)reader3["game3"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home4, results.game4, fixtures.away4 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader4 = cmd.ExecuteReader())
                {
                    while (reader4.Read())
                    {
                        rowNumber4.Text = "4";
                        homeTeam4.Text = reader4["home4"].ToString();
                        if ((Int32)reader4["game4"] > 0)
                        {
                            winorloss4.Text = "wins";
                        }
                        else if ((Int32)reader4["game4"] == 0)
                        {
                            winorloss4.Text = "draws with";
                        }
                        else if ((Int32)reader4["game4"] < 0)
                        {
                            winorloss4.Text = "loses to";
                        }

                        awayTeam4.Text = reader4["away4"].ToString();

                        margin4.Text = "by " + Convert.ToString(Math.Abs((Int32)reader4["game4"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home5, results.game5, fixtures.away5 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader5 = cmd.ExecuteReader())
                {
                    while (reader5.Read())
                    {
                        rowNumber5.Text = "5";
                        homeTeam5.Text = reader5["home5"].ToString();
                        if ((Int32)reader5["game5"] > 0)
                        {
                            winorloss5.Text = "wins";
                        }
                        else if ((Int32)reader5["game5"] == 0)
                        {
                            winorloss5.Text = "draws with";
                        }
                        else if ((Int32)reader5["game5"] < 0)
                        {
                            winorloss5.Text = "loses to";
                        }

                        awayTeam5.Text = reader5["away5"].ToString();

                        margin5.Text = "by " + Convert.ToString(Math.Abs((Int32)reader5["game5"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home6, results.game6, fixtures.away6 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader6 = cmd.ExecuteReader())
                {
                    while (reader6.Read())
                    {
                        rowNumber6.Text = "6";
                        homeTeam6.Text = reader6["home6"].ToString();
                        if ((Int32)reader6["game6"] > 0)
                        {
                            winorloss6.Text = "wins";
                        }
                        else if ((Int32)reader6["game6"] == 0)
                        {
                            winorloss6.Text = "draws with";
                        }
                        else if ((Int32)reader6["game6"] < 0)
                        {
                            winorloss6.Text = "loses to";
                        }

                        awayTeam6.Text = reader6["away6"].ToString();

                        margin6.Text = "by " + Convert.ToString(Math.Abs((Int32)reader6["game6"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home7, results.game7, fixtures.away7 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader7 = cmd.ExecuteReader())
                {
                    while (reader7.Read())
                    {
                        rowNumber7.Text = "7";
                        homeTeam7.Text = reader7["home7"].ToString();
                        if ((Int32)reader7["game7"] > 0)
                        {
                            winorloss7.Text = "wins";
                        }
                        else if ((Int32)reader7["game7"] == 0)
                        {
                            winorloss7.Text = "draws with";
                        }
                        else if ((Int32)reader7["game7"] < 0)
                        {
                            winorloss7.Text = "loses to";
                        }

                        awayTeam7.Text = reader7["away7"].ToString();

                        margin7.Text = "by " + Convert.ToString(Math.Abs((Int32)reader7["game7"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home8, results.game8, fixtures.away8 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader8 = cmd.ExecuteReader())
                {
                    while (reader8.Read())
                    {
                        rowNumber8.Text = "8";
                        homeTeam8.Text = reader8["home8"].ToString();
                        if ((Int32)reader8["game8"] > 0)
                        {
                            winorloss8.Text = "wins";
                        }
                        else if ((Int32)reader8["game8"] == 0)
                        {
                            winorloss8.Text = "draws with";
                        }
                        else if ((Int32)reader8["game8"] < 0)
                        {
                            winorloss8.Text = "loses to";
                        }

                        awayTeam8.Text = reader8["away8"].ToString();

                        margin8.Text = "by " + Convert.ToString(Math.Abs((Int32)reader8["game8"])) + " points";
                    }
                }
                cmd.CommandText = "SELECT fixtures.home9, results.game9, fixtures.away9 FROM fixtures INNER JOIN results ON fixtures.roundID = results.roundID INNER JOIN tips ON fixtures.roundID = tips.roundID WHERE tips.username = @username AND tips.roundID = @roundID";
                using (SqlDataReader reader9 = cmd.ExecuteReader())
                {
                    while (reader9.Read())
                    {
                        rowNumber9.Text = "9";
                        homeTeam9.Text = reader9["home9"].ToString();
                        if ((Int32)reader9["game9"] > 0)
                        {
                            winorloss9.Text = "wins";
                        }
                        else if ((Int32)reader9["game9"] == 0)
                        {
                            winorloss9.Text = "draws with";
                        }
                        else if ((Int32)reader9["game9"] < 0)
                        {
                            winorloss9.Text = "loses to";
                        }

                        awayTeam9.Text = reader9["away9"].ToString();

                        margin9.Text = "by " + Convert.ToString(Math.Abs((Int32)reader9["game9"])) + " points";
                    }
                }
            }
        }
    }
}