using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using AFLTippingSite.Models;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace AFLTippingSite.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                // Add the registered user to the role of "consumers"
                IdentityResult resultAdd = manager.AddToRole(manager.FindByEmail(Email.Text).Id, "tipster");

                //Insert tipster data starting here ...
                if (Page.IsValid)
                {
                    // read the entire connection string from Web.config
                    string connectionString = WebConfigurationManager.ConnectionStrings["AFLTipping"].ConnectionString;
                    // create the connection based on the connection string
                    SqlConnection con = new SqlConnection(connectionString);
                    string sql;
                    sql = "insert tipsters (username, gname, sname, birthday, address, suburb, state, postcode, phone) values (@Username, @Gname, @Sname, @Birthday, @Address, @Suburb, @State, @Postcode, @Phone)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@Username", Email.Text);
                    cmd.Parameters.AddWithValue("@Gname", txtGivenName.Text);
                    cmd.Parameters.AddWithValue("@Sname", txtFamilyName.Text);
                    cmd.Parameters.AddWithValue("@Birthday", DateTime.Parse(txtBirthday.Text));
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Suburb", txtSuburb.Text);
                    cmd.Parameters.AddWithValue("@State", ddlState.Text);
                    cmd.Parameters.AddWithValue("@Postcode", txtPostCode.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtMobilePhone.Text);

                    using (con)
                    {
                        con.Open();
                        int rowCount = cmd.ExecuteNonQuery();
                        string msg = "";
                        if (rowCount > 0)
                        {
                            msg = "Registration is successful. You can log in now.";
                            ErrorMessage.Text += "\n" + msg;

                        }
                        else
                        {
                            msg = "Registration has some issues. Some data cannot be saved";
                            ErrorMessage.Text += "\n" + msg;
                        }
                    }

                }



                if (resultAdd.Succeeded)
                {
                    // on success, sign in this user and redirect this user to ReturnUrl
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    // display the error message otherwise
                    ErrorMessage.Text = resultAdd.Errors.FirstOrDefault();
                }
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}