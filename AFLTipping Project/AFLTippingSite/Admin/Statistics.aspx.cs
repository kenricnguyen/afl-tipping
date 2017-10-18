using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;


namespace M06_Roles.Admin
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "2D")
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = false;
            }
            else
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = true;
            }
           
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selectedType = DropDownList1.SelectedValue;
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList1.SelectedValue); 
            Chart2.Series["Series2"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList1.SelectedValue);

        }
    }
}