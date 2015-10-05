<%@ WebHandler Language="C#" Class="display" %>

using System;
using System.Web;
using Infarts.DAL;
using Infarts.BLL;
using System.Data;

public class display : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;

        string id = context.Request.Form["id"];
        string title = "";

        System.Collections.Hashtable hl = new System.Collections.Hashtable();
        hl.Add("0", "新疆");
        hl.Add("1", "甘肃");
        hl.Add("2", "内蒙古");
        hl.Add("3", "黑龙江");
        hl.Add("4", "吉林");
        hl.Add("5", "辽宁");
        hl.Add("6", "河北");
        hl.Add("7", "天津");
        hl.Add("8", "山西");
        hl.Add("9", "陕西");
        hl.Add("10", "宁夏");
        hl.Add("11", "青海");
        hl.Add("12", "西藏");
        hl.Add("13", "四川");
        hl.Add("14", "重庆");
        hl.Add("15", "湖北");
        hl.Add("16", "河南");
        hl.Add("17", "山东");
        hl.Add("18", "江苏");
        hl.Add("19", "安徽");
        hl.Add("20", "江西");
        hl.Add("21", "湖南");
        hl.Add("22", "贵州");
        hl.Add("23", "云南");
        hl.Add("24", "广西");
        hl.Add("25", "广东");
        hl.Add("26", "福建");
        hl.Add("27", "浙江");
        hl.Add("28", "上海");
        hl.Add("29", "台湾");
        hl.Add("30", "海南");
        hl.Add("31", "北京");

        title = hl[id].ToString();

        int pid = 0;
        string sql = "select * from ProvinceInfo where title='{0}'";
        sql = string.Format(sql, title);
        DataTable dt_ = DB_Help.ExecuteSql(sql);

        string json = "[";

        if (dt_ != null && dt_.Rows.Count > 0)
        {
            pid = int.Parse(dt_.Rows[0]["id"].ToString());
        }

        string sql_ = @"
                        select *,
                        (select top 1 istop from AreaContact where CityID=CityInfo.id) as istop,
                        (select Title from ProvinceInfo where Id=CityInfo.TId) as ProvinceName from CityInfo where TId ={0} and isshow =1 order by Id";
        sql_ = string.Format(sql_, pid);
        DataTable dt = DB_Help.ExecuteSql(sql_);


        if (dt != null && dt.Rows.Count > 0)
        {
            string style = string.Empty;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (!string.IsNullOrEmpty(dt.Rows[i]["istop"].ToString()))
                {
                    style = (bool.Parse(dt.Rows[i]["istop"].ToString()) ? "white" : "");
                }
                if (i == (dt.Rows.Count - 1))
                {
                    json += "{name:'" + dt.Rows[i]["Title"].ToString() + "',id:'" + dt.Rows[i]["id"].ToString() + "',style:'" + style + "',pname:'" + dt.Rows[i]["ProvinceName"].ToString() + "'}";
                    break;
                }
                json += "{name:'" + dt.Rows[i]["Title"].ToString() + "',id:'" + dt.Rows[i]["id"].ToString() + "',style:'" + style + "',pname:'" + dt.Rows[i]["ProvinceName"].ToString() + "'},";
                style = "";
            }
        }
        json += "]";
        context.Response.Write(json);
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}