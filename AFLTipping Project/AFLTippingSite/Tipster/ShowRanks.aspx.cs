﻿using Microsoft.AspNet.Identity;
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
           

        }
    }
}