<%@ WebHandler Language="C#" Class="DeleteInfo" %>
using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using Infarts.DAL;
using Infarts.BLL;
using Infarts.Model;

public class DeleteInfo : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        HttpResponse Response = context.Response;
        HttpSessionState Session = context.Session;

        UserInfoService.CheckLogin(Request, Response, Session);

        int t = ShareInfoFactory.ToInt(Request.Form["t"]);
        int id = ShareInfoFactory.ToInt(Request.Form["id"]);
        string table = string.Empty;
        int fg = 0;
        //如果是负数,就说明是删除详细
        if (t < 1)
        {
            switch (t)
            {
                case -1:
                    table = "NewsInfo";
                    break;
                case -2:
                    table = "ProductInfo";
                    break;
                case -3:
                    table = "Events";
                    break;
                case -4:
                    table = "AreaContact";
                    break;
                case -5:
                    table = "Hotel";
                    break;
                case -6:
                    table = "SlideInfo";
                    break;
                case -7:
                    table = "LinkInfo";
                    break;
                case -8:
                    table = "Jobs";
                    break;
                case -9:
                    table = "InChaHuanv";
                    break;
            }
            string sql = "select * from {0} where id={1}";
            sql = string.Format(sql, table, id);
            DataTable dt = DB_Help.ExecuteSql(sql);
            //如果是作品,则要删除对应的图册信息
            ShareInfoFactory.ForDeletePhoto(dt, context.Server);
            string delsql = "delete {0} where id = {1}";
            delsql = string.Format(delsql, table, id);
            fg = DB_Help.ExecuteSqlCommand(delsql);
        }
        //如果是正数,就是删除类别
        if (t >= 1)
        {
            string infoTableName = "";
            switch (t)
            {
                case 1:
                    table = "ProductType";
                    infoTableName = "ProductInfo";
                    break;
            }

            //获取对应类别ID的详细信息
            DataTable dt = PublicMethod.GetInfoByTID(infoTableName, id);
            //在以此删除点图片信息
            ShareInfoFactory.ForDeletePhoto(dt, context.Server);
            fg = PublicMethod.DeleteTypeInfo(table, infoTableName, id.ToString());
        }
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