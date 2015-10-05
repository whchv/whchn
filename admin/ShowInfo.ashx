<%@ WebHandler Language="C#" Class="ShowInfo" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using Infarts.DAL;
using Infarts.BLL;

public class ShowInfo : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        HttpResponse Response = context.Response;
        HttpSessionState Session = context.Session;

        UserInfoService.CheckLogin(Request, Response, Session);

        int t = ShareInfoFactory.ToInt(Request.Form["t"]);
        int id = ShareInfoFactory.ToInt(Request.Form["id"]);
        string s = Request.Form["s"];

        string table = string.Empty;
        switch (t)
        {
            case 0:
                table = "NewsInfo"; break;
            case 1:
                table = "ProductInfo"; break;
            case 2:
                table = "Events"; break;
            case 3:
                table = "Jobs"; break;
            case 4:
                table = "InChaHuanv"; break;
        }
        string sql = string.Format("update {0} set isshow='{1}' where id={2}", table, s, id);
        int fg = DB_Help.ExecuteSqlCommand(sql);
        if (fg > 0)
        {
            Response.Write(1);
        }
        else
        {
            Response.Write(0);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}