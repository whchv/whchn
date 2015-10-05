<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="newsdetail, App_Web_okhqlhfe" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.html" class="index">首页</a> <a href="news.html" class="gy">新闻资讯</a></div>
</div>
<div class="bg_nr">
<div class="box">
<div class="leftbox">
<div class="menu">
<h3><img src="images/xw_03.jpg" /></h3>
<ul>
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
<li class="left"><strong><%=entitle %><span><%=typetitle%></span></strong></li>
<li class="right"><img src="images/about_11.jpg" /></li>
</ul>
</div>
   
<div class="bg_ny">
<div class="news_ny">
<asp:Repeater ID="RepDetail" runat="server">
<ItemTemplate>
<h3><%#Eval("title") %>
<b>post time : <%#Eval("Publishtime", "{0:yyyy-MM-dd}").Replace("-",".") %> <font>浏览次数</font>:<%#Eval("ReadCount") %></b>
</h3>
<%#Eval("Content") %>
</ItemTemplate>
</asp:Repeater>
</div>
<div class="next">
<ul>
<li class="left"><a class="return" href="index.aspx">返回首页</a><a class="liebiao" href="newslist.aspx?tid=<%=tid %>">返回列表</a></li>
<li class="right"><a class="syp" href="<%=preurl %>" title="<%=pretitle %>">上一篇</a><a class="xyp" href="<%=nexturl %>" title="<%=nexttitle %>">下一篇</a></li>
</ul>
    
</div>
</div>  
</div>
</div>

</asp:Content>