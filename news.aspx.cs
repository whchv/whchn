using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Infarts.DAL;
using Infarts.BLL;

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ViewInfo();
        ((master_MasterPage)Master).id = 2;
    }

    private void ViewInfo()
    {
        Page.Title = "新闻中心";
        DataSet ds = NewsInfoFactory.GetNewsInfo();

        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[0], RepNews1);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[1], RepNews2);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[2], RepNews3);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[3], RepNews4);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[4], RepNews5);
        DataTable Info = ds.Tables[5];
        if (ShareInfoFactory.CheckTableIsNullOrEmpty(Info))
        {
            Info.Columns.Add("style", typeof(string));
            for (int i = 0; i < Info.Rows.Count; i++)
            {
                if (i == 0)
                {
                    Info.Rows[i]["style"] = "<span><img src='images/jh_12.jpg' /></span>";
                    break;
                }
            }
        }
        ShareInfoFactory.ViewInfoToRepeater(Info, RepNews6);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[6], RepNews7);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[7], RepNews8);
    }
}