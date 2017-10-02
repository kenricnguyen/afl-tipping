using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M06_Roles.Tipster
{
    public partial class MakeTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                // If everything Validated according to specs
                //Do the following
            }
        }
    }
}