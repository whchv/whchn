<%@ WebHandler Language="C#" Class="DelePhoto" %>

using System;
using System.Web;
using Infarts.DAL;
using System.Data;
using System.Web.SessionState;
using Infarts.BLL;

public class DelePhoto : IHttpHandler, IReadOnlySessionState
{
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        HttpResponse Response = context.Response;
        HttpServerUtility Server = context.Server;

        int id = ShareInfoFactory.ToInt(Request.Form["Id"]);
        string tablename = Request.Form["T"];
        string photos = Request.Form["P"];
        
        if (id != 0)
        {
            ShareInfoFactory.deletePhotos(Server, photos);
            int flag = PublicMethod.DeleteInfo(tablename, id.ToString());
            if (flag > 0)
            {
                Response.Write(1);
            }
            else
            {
                Response.Write(0);
            }
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