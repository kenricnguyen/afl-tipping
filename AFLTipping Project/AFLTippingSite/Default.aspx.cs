using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AFLTippingSite
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("tipster"))
            {
                tipsterDiv.Visible = true;
            }
            else if (HttpContext.Current.User.IsInRole("admin"))
            {
                adminDiv.Visible = true;
            }
            else
            {
                anonymousDiv.Visible = true;
            }
        }
    }
}