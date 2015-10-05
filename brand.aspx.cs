using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infarts.DAL;
using Infarts.BLL;
using System.Data;

public partial class brand : System.Web.UI.Page
{
    public int i = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ViewInfo();
        ((master_MasterPage)Master).id = 3;
        ViewBigType();
    }


    // 绑定大类别
    public void ViewBigType()
    {
        DataTable Type = PublicMethod.GetInfoByTablename("ProductIndexType");
        ShareInfoFactory.ViewInfoToRepeater(Type, RepBigType);
    }


    protected void RepBigType_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater RepChild = (Repeater)e.Item.FindControl("RepSmallType");
            DataRowView rowv = (DataRowView)e.Item.DataItem;
            int id = 1;
            if (int.TryParse(rowv["id"].ToString(), out id))
            {
                string sql = string.Format("select * from ProductType where isshow = 1 and tid = {0} order by sort,id", id);
                DataTable Info = DB_Help.ExecuteSql(sql);
                if (ShareInfoFactory.CheckTableIsNullOrEmpty(Info))
                {
                    Info.Columns.Add("typeid", typeof(int));
                    for (int i = 0; i < 4; i++)
                    {
                        for (int j = 0; j < Info.Rows.Count; j++)
                        {
                            if (id == int.Parse(Info.Rows[j]["tid"].ToString()))
                            {
                                Info.Rows[j]["typeid"] = id.ToString();
                            }
                        }
                    }
                }
                ShareInfoFactory.ViewInfoToRepeater(Info, RepChild);
            }
        }
    }


    private void ViewInfo()
    {
        //
        Page.Title = "品牌与产品";
        DataSet ds = ProductInfoFactory.GetProductInfo();
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[0], RepPro1);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[1], RepPro2);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[2], RepPro3);
        ShareInfoFactory.ViewInfoToRepeater(ds.Tables[3], RepPro4);

        DataTable Info = ds.Tables[4];
        //if (ShareInfoFactory.CheckTableIsNullOrEmpty(Info))
        //{
        //    Info.Columns.Add("Pre", typeof(string));
        //    Info.Columns.Add("Next", typeof(string));
        //    Info.Columns.Add("all", typeof(string));
        //    for (int i = 0; i < Info.Rows.Count; i++)
        //    {
        //        if (i == 0)
        //        {
        //            Info.Rows[i]["pre"] = "<ul>";
        //        }
        //        else if ((i + 1) % 3 == 0 && i != Info.Rows.Count - 1)
        //        {
        //            Info.Rows[i]["Next"] = "</ul><ul>";
        //        }
        //        if (i == Info.Rows.Count - 1)
        //        {
        //            Info.Rows[i]["Next"] = "</ul>";
        //        }
        //        if (i % 3 == 0 || i % 3 == 2)
        //        {
        //            Info.Rows[i]["all"] = "<li><a href=\"branddetail.aspx?id=" + Info.Rows[i]["id"] + "&tid=" + Info.Rows[i]["ttid"] + "\"><p>" + Info.Rows[i]["title"] + "</p></a></li>";
        //        }
        //        else if (i % 3 == 1)
        //        {
        //            Info.Rows[i]["all"] = "<li><a href=\"branddetail.aspx?id=" + Info.Rows[i]["id"] + "&tid=" + Info.Rows[i]["ttid"] + "\"><span><img src=\"" + Info.Rows[i]["dphoto"] + "\"  width=\"180\" height=\"180\" alt=\"" + Info.Rows[i]["title"] + "\" /></span><strong>" + Info.Rows[i]["title"] + "</strong><font><img src=\"images/zt_04.jpg\" /></font></a></li>";
        //        }
        //    }
        //}
        ShareInfoFactory.ViewInfoToRepeater(Info, RepInfo);
    }
}