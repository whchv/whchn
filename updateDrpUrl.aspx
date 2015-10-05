<%@ Page Language="C#" AutoEventWireup="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<%
    string ip = Request.QueryString["ip"];
    Regex regex = new Regex(@"^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$");
    if (regex.IsMatch(ip.Trim()))
    {
        string html = "<!DOCTYPE html><html lang=\"zh-cn\"><head><meta charset=\"utf-8\" /><meta http-equiv=\"refresh\" content=\"0; url=#drpAddress\"></head><body></body></html>";

        Response.Write(Server.UrlDecode(ip));
        System.IO.StreamWriter f2 = new System.IO.StreamWriter(Server.MapPath("drp.html"), false, System.Text.Encoding.UTF8);
        f2.Write(html.Replace("#drpAddress", "http://" + ip + ":9090/drp"));
        f2.Flush();
        f2.Close();
        f2.Dispose();
        f2 = null;
        html = null;
    }
    regex = null;
%>
</body>
</html>
