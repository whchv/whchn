<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="eventsdetail, App_Web_okhqlhfe" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.aspx" class="index">首页</a> <a href="events.aspx" class="gy">发展大事记</a></div>
</div>
<div class="bg_nr">
<div class="box">
<div class="leftbox">
<div class="menu">
<h3><img src="images/about_09.jpg" /></h3>
<ul>
<li><a href="about.aspx">茶花女简介<span></span></a></li>
<li><a href="aboutculture.aspx">企业文化<span></span></a></li>
<li class="select"><a href="aboutevents.aspx">发展大事记<span></span></a></li>
</ul>
</div>
   
<uc1:top ID="top1" runat="server" />
</div>

<div class="rightbox">
<div class="t_nr">
<ul>
<li class="left"><img src="images/dsj_03.jpg" /></li>
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
<li class="left"><a class="return" href="index.aspx">返回首页</a><a class="liebiao" href="aboutevents.aspx">返回列表</a></li>
<li class="right"><a class="syp" href="<%=preurl %>" title="<%=pretitle %>">上一篇</a><a class="xyp" href="<%=nexturl %>" title="<%=nexttitle %>">下一篇</a></li>
</ul>
    
</div>
</div>  
</div>
</div>

</asp:Content>