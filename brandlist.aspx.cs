using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infarts.DAL;
using Infarts.BLL;
using System.Data;
using Infarts.Model;

public partial class brandlist : System.Web.UI.Page
{
    public int tid = 0;
    public int pageindex = 0;
    public int pagecount = 0;
    public int pagesize = PageSizeInfoFactory.GetPageSizeInfo("ProductSize");//显示条数
    public string title = string.Empty;
    public string entitle = string.Empty;
    public string sql = string.Empty;
    public int ttid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewBigType();
        ViewType();
        ViewNum();
        ((master_MasterPage)Master).id = 3;
    }

    // 绑定大类别
    public void ViewBigType()
    {
        tid = ShareInfoFactory.GetRequst(Request, "tid");
        ttid = ShareInfoFactory.GetRequst(Request, "ttid");
        DataTable Type = PublicMethod.GetInfoByTablename("ProductIndexType");
        Type.Columns.Add("Style", typeof(string));
        DataRow[] dr = Type.Select("id=" + tid);
        if (dr.Length > 0)
        {
            dr[0]["Style"] = "select";
            this.title = dr[0]["typetitle"].ToString();
            this.entitle = dr[0]["title"].ToString();
        }
        else
        {
            this.title = "女性护理用品";
            this.entitle = "FEMALE CARE";
            Type.Rows[0]["style"] = "select";
        }
        ShareInfoFactory.ViewInfoToRepeater(Type, RepBigType);
    }


    private void ViewType()
    {
        ShareInfoFactory.OutPageField(Request, pagesize, tid, "ProductInfo", "qian", out pageindex, out pagecount, out pagesize);
        if (ttid < 1)
        {
            sql = string.Format("select * from ProductType where isshow = 1 and tid = {0}", tid);
            Page.Title = title;
        }
        else
        {
            sql = string.Format("select * from ProductType where isshow = 1 and id = {0} and tid = {1}", ttid, tid);
        }
        DataTable type = DB_Help.ExecuteSql(sql);
        if (ShareInfoFactory.CheckTableIsNullOrEmpty(type))
        {
            if (!(ttid < 1))
            {
                Page.Title = type.Rows[0]["title"].ToString();
            }
        }
        ShareInfoFactory.ViewInfoToRepeater(type, RepType);
    }

        
    protected void RepType_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater RepChild = (Repeater)e.Item.FindControl("RepInfo");
            DataRowView rowv = (DataRowView)e.Item.DataItem;
            int id = 1;
            if (int.TryParse(rowv["id"].ToString(), out id))
            {
                DataTable Info = PublicMethod.GetPageing("ProductInfo", id, pagesize, pageindex, "ProductType", "qian");
                ProductService.ViewNum(Info);
                ShareInfoFactory.ViewInfoToRepeater(Info, RepChild);
            }
        }
    }

    private void ViewNum()
    {
        DataTable Info = ShareInfoFactory.GetInfoNum(pageindex, pagecount, "hover");
        ShareInfoFactory.ViewInfoToRepeater(Info, RepNum);
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
                    Info.Columns.Add("style", typeof(string));
                    DataRow[] dr = Info.Select("id=" + ttid);
                    if (dr.Length > 0)
                    {
                        dr[0]["style"] = "sel_m";
                    }
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
}