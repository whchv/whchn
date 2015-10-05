<%@ WebHandler Language="C#" Class="ediacinfo" %>

using System;
using System.Web;
using Infarts.Model;
using Infarts.DAL;
using Infarts.BLL;
using System.Web;

public class ediacinfo : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        HttpResponse Response = context.Response;
        if (Request.Form.Count > 0)
        {
            string name = Request.Form["name"].ToString();
            string phone = Request.Form["phone"].ToString();
            string extr = Request.Form["extr"].ToString();
            int pro = int.Parse(Request.Form["pro"].ToString());
            int city = int.Parse(Request.Form["city"].ToString());
            int id = int.Parse(Request.Form["id"].ToString());
            bool istop = bool.Parse(Request.Form["istop"].ToString());
            AreaContact AC = new AreaContact();
            AC.Id = id;
            AC.Name = name;
            AC.Phone = phone;
            AC.IsTop = istop;
            AC.ProvinceID = pro;
            AC.CityID = city;
            AC.Extr = extr;
            if (PublicMethod.GetUpdateSQLCommmand(AC) > 0)
            {
                Response.Write(1);
            }
            else
            {
                Response.Write(0);
            }
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