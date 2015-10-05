<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="Jobs, App_Web_okhqlhfe" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.aspx" class="index">首页</a> <a href="Jobs.aspx" class="gy">招聘信息</a></div>
</div>
<div class="bg_nr">
<div class="box">

<div class="leftbox">
<div class="menu">
<h3><img src="images/px_04.jpg" /></h3>
<ul>
<li><a href="training.aspx">培训与发展<span></span></a></li>
<li class="select"><a href="Jobs.aspx">招聘信息<span></span></a></li>
<%--<li><a href="http://camellia.iaviva.com/newslist.aspx?tid=4">我在茶花女<span>I AM IN CAMELLIA</span></a></li>
--%></ul>
</div>
   
<uc1:top ID="top1" runat="server" />
</div>

<div class="rightbox">
<div class="t_nr">
<ul>
<li class="left"><img src="images/wz_04.jpg" /></li>
<li class="right"><img src="images/about_11.jpg" /></li>
</ul>
</div>
   
<div class="bg_ny">
<div class="events">
<h3><span>日期</span><font>标题</font></h3>
<ul>
    <asp:Repeater ID="RepInfo" runat="server">
    <ItemTemplate>
<li><a href="JobDetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title")%>"><b><%# Eval("Publishtime","{0:yyyy-MM-dd}") %></b><span><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"),40,true)%></span></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
</div>
<div class="pages">
<ul>
<li class="left"><a href="index.aspx">返回首页</a></li>
<li class="right">
<a href="?pageindex=<%= pageindex - 1 > 0 ? ( pageindex - 1) : 1 %>">上一页</a>
<asp:Repeater ID="RepNum" runat="server">
<ItemTemplate>
<a href="?pageindex=<%# Eval("PageIndex")%>" class="<%#Eval("style") %>"><%#Eval("PageIndex")%></a>
</ItemTemplate>
</asp:Repeater>
<a href="?pageindex=<%= pageindex + 1 < pagecount ? ( pageindex + 1 ) : pagecount %>">下一页</a>
</li>
</ul>
</div>
</div>  
</div>
</div>
</asp:Content>