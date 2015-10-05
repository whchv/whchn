<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="newslist, App_Web_okhqlhfe" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.html" class="index">首页</a> <a href="newslist.aspx?tid=<%=tid %>" class="gy"><%=title %></a></div>
</div>
<div class="bg_nr">
<div class="box">
<div class="leftbox">
<div class="menu">
<h3><img src="images/xw_03.jpg" /></h3>
<ul id="type">
<li class="<%=style1 %>"><a href="newslist.aspx?tid=1">新闻资讯<span></span></a></li>
<li class="<%=style2 %>"><a href="newslist.aspx?tid=2">市场动态<span></span></a></li>
<li class="<%=style3 %>"><a href="newslist.aspx?tid=3">客户见证<span></span></a></li>
<li class="<%=style4 %>"><a href="newslist.aspx?tid=4">我在茶花女<span></span></a></li>
</ul>
</div>
<uc1:top ID="top1" runat="server" />
</div>
<div class="rightbox">
<div class="t_nr">
<ul>
<li class="left"><strong><%=entitle %><span><%=title %></span></strong></li>
<li class="right"><img src="images/about_11.jpg" /></li>
</ul>
</div>

<div class="bg_ny">
<div class="news_list">
<asp:Repeater ID="RepInfo" runat="server">
<ItemTemplate>
<dl>
<a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>">
<dt><ins class="png"></ins><img src="<%#Eval("LPhoto") %>" alt="<%#Eval("title") %>" width="97" height="98" /></dt>
<dd>
<strong><span>view :<%#Eval("ReadCount") %></span><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 40, true)%></strong>
<p><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("Description"), 140, true)%></p>
<font><b>DATE:<%#Eval("Publishtime", "{0:yyyy-MM-dd}")%></b><i>READ MORE</i></font>
</dd></a>
</dl>
</ItemTemplate>
</asp:Repeater>
</div>
<div class="pages">
<ul>
<li class="left"><a href="index.aspx">返回首页</a></li>
<li class="right">
<a href="?tid=<%=tid %>&pageindex=<%= pageindex - 1 > 0 ? ( pageindex - 1) : 1 %>">上一页</a>
<asp:Repeater ID="RepNum" runat="server">
<ItemTemplate>
<a href="?tid=<%=tid %>&pageindex=<%# Eval("PageIndex")%>" class="<%#Eval("style") %>"><%#Eval("PageIndex")%></a>
</ItemTemplate>
</asp:Repeater>
<a href="?tid=<%=tid %>&pageindex=<%= pageindex + 1 < pagecount ? ( pageindex + 1 ) : pagecount %>">下一页</a>
</li>
</ul>
</div>
</div>  
</div>
</div>

</asp:Content>