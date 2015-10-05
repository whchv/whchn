using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infarts.BLL;
using System.Data;
using Infarts.DAL;

public partial class branddetail : System.Web.UI.Page
{

    public string sql = string.Empty;
    public string title = string.Empty;
    public string entitle = string.Empty;
    public int id = 0;
    public int tid = 0;
    public int ttid = 0;
    public string preurl = string.Empty;
    public string pretitle = string.Empty;
    public string nexturl = string.Empty;
    public string nexttitle = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        ViewInfo();
        ViewBigType();
        ((master_MasterPage)Master).id = 3;
        ViewOhter();
    }

    private void ViewInfo()
    {
        ShareInfoFactory.OutID(Request, Response, "brand.aspx", out id);
        DataTable Info = ShareInfoFactory.GetDetailInfo(Request, "ProductInfo", "ProductType", "branddetail.aspx", RepDetail, out ttid, out title);
        if (ShareInfoFactory.CheckTableIsNullOrEmpty(Info))
        {
            preurl = Info.Rows[0]["preurl"].ToString();
            pretitle = Info.Rows[0]["pretitle"].ToString();
            nexturl = Info.Rows[0]["nexturl"].ToString();
            nexttitle = Info.Rows[0]["nexttitle"].ToString();
            Page.Title = title;
        }
    }

    // 绑定大类别
    public void ViewBigType()
    {
        tid = ShareInfoFactory.GetRequst(Request, "tid");
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

    protected void RepSmallType_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater RepChild = (Repeater)e.Item.FindControl("RepInfo");
            DataRowView rowv = (DataRowView)e.Item.DataItem;
            int id = 1;
            if (int.TryParse(rowv["id"].ToString(), out id))
            {
                sql = string.Format("select *,(select tid from ProductType where id = ProductInfo.tid) as TypeID from ProductInfo where isshow = 1 and tid = {0} order by Publishtime desc", id);
                DataTable Info = DB_Help.ExecuteSql(sql);
                if (ShareInfoFactory.CheckTableIsNullOrEmpty(Info))
                {
                    Info.Columns.Add("style", typeof(string));
                    if (string.Equals(ttid.ToString(), id.ToString()))
                    {
                        DataRow[] dr = Info.Select("id=" + this.id);
                        if (dr.Length > 0)
                        {
                            dr[0]["style"] = "class='sel_p'";
                        }
                        else
                        {
                            Info.Rows[0]["style"] = "class='sel_p'";
                        }
                    }
                }
                ShareInfoFactory.ViewInfoToRepeater(Info, RepChild);
            }
        }
    }

    private void ViewOhter()
    {
        DataTable Info = ProductInfoFactory.ViewOhterInfo(id, tid, ttid);
        ShareInfoFactory.ViewInfoToRepeater(Info, RepOhterInfo);
    }
}