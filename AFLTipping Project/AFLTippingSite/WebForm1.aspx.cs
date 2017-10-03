using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M06_Roles
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Text.StringBuilder table = new System.Text.StringBuilder();
            if (IsPostBack)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AFLTipping"].ToString()))
                    {
                        con.Open();
                        string getFixture = "SELECT * From fixtures where roundID = 1";
                        SqlCommand cmd = new SqlCommand(getFixture, con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        table.Append("<table border='1'>");
                        table.Append("<tr><th>round</th><th>home team</th><th>away team</th></tr>");
                        table.Append("</tr>");
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                table.Append("<tr>");
                                table.Append("<td>" + reader[0] + "</td>");
                                table.Append("<td>" + reader[1] + "</td>");
                                table.Append("<td>" + reader[2] + "</td>");
                            }
                        }
                        table.Append("</table>");
                        PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
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
    }
}