<%@ WebHandler Language="C#" Class="getArea" %>

using System;
using System.Web;
using System.Data;
using Infarts.BLL;
using Infarts.DAL;

public class getArea : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        HttpResponse Response = context.Response;

        string id = Request.Form["id"];

        string sql = string.Format("select *,(select Title from CityInfo where id = {0}) as CName from AreaContact where CityID = {0}", id);
        DataTable Info = DB_Help.ExecuteSql(sql);
        string json = "[";

        if (ShareInfoFactory.CheckTableIsNullOrEmpty(Info))
        {
            for (int i = 0; i < Info.Rows.Count; i++)
            {
                if (i == (Info.Rows.Count - 1))
                {
                    json += "{cname:'" + Info.Rows[i]["Extr"] + "',name:'" + Info.Rows[i]["Name"] + "',phone:'" + Info.Rows[i]["Phone"] + "'}";
                    break;
                }
                json += "{cname:'" + Info.Rows[i]["Extr"] + "',name:'" + Info.Rows[i]["Name"] + "',phone:'" + Info.Rows[i]["Phone"] + "'},";
            }
        }
        json += "]";
        Response.Write(json);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}