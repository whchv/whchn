<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="news, App_Web_okhqlhfe" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.aspx" class="index">首页</a> <a href="news.aspx" class="gy">新闻中心</a></div>
</div>
<div class="bg_nr">
<div class="box">
<div class="leftbox">
<div class="menu">
<h3><img src="images/xw_03.jpg" /></h3>
<ul>
<li class="select"><a href="newslist.aspx?tid=1">新闻资讯<span></span></a></li>
<li><a href="newslist.aspx?tid=2">市场动态<span></span></a></li>
<li><a href="newslist.aspx?tid=3">客户见证<span></span></a></li>
<li><a href="newslist.aspx?tid=4">我在茶花女<span></span></a></li>
</ul>
</div>
   
<uc1:top ID="top1" runat="server" />

</div>
<div class="rightbox">
<div class="t_nr">
<ul>
<li class="left"><strong>TOP NEWS<span>新闻中心</span></strong></li>
<li class="right"><img src="images/about_11.jpg" /></li>
</ul>
</div>
   
<div class="bg_ny">
<div class="news_jh">
    <asp:Repeater ID="RepNews1" runat="server">
    <ItemTemplate>
<dl><dt><span><ins class="png"></ins></span><img src="<%#Eval("ZXPhoto") %>" width="350" height="175" alt="<%#Eval("title") %>" /></dt><dd><strong><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 20, true)%></strong><font>DATE :<b><%#Eval("Publishtime", "{0:yyyy-MM-dd}")%></b></font><p><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("Description"), 140, true)%></p><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>" class="tail"></a></dd></dl>
    </ItemTemplate>
    </asp:Repeater>

<h3><img src="images/news_02.jpg" /><a href="newslist.aspx?tid=1"><img src="images/news_03.jpg" /></a></h3>
<div class="hot_n"><div class="hot_m"><font><img src="images/jh_12.jpg" /></font></div></div>
<ul>
<li class="x_left">
<asp:Repeater ID="RepNews2" runat="server">
<ItemTemplate>
<p><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><span><%#Eval("Publishtime", "{0:yyyy-MM-dd}")%></span><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 15, true)%></a></p>
</ItemTemplate>
</asp:Repeater>
</li>
<li class="x_right">
<asp:Repeater ID="RepNews3" runat="server">
<ItemTemplate>
<p><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><span><%#Eval("Publishtime", "{0:yyyy-MM-dd}")%></span><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 15, true)%></a></p>
</ItemTemplate>
</asp:Repeater>
</li>
</ul>
</div>
   
<div class="market">
<h3><img src="images/jh_24.jpg" /></h3>
<h4><img src="images/news_02.jpg" /><a href="newslist.aspx?tid=2"><img src="images/news_03.jpg" /></a></h4>
<dl>
<asp:Repeater ID="RepNews4" runat="server">
<ItemTemplate>
<dt><strong><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 15, true)%></strong>
<font>DATE:<%#Eval("Publishtime", "{0:yyyy-MM-dd}")%> VIEW:<%#Eval("ReadCount") %></font>
<a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>">
<p><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("Description"), 160, true)%></p></a>
</dt>
</ItemTemplate>
</asp:Repeater>

<dd>
<ul>
    <asp:Repeater ID="RepNews5" runat="server">
    <ItemTemplate>
<li><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><img src="<%#Eval("SCPhoto") %>" width="189" height="48" alt="<%#Eval("title") %>" /><p><strong><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 12, true)%></strong><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("description"), 14, true)%></p></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
</dd>
</dl>
</div>
   
<div class="kehu">
<h2><img src="images/jh_39.jpg" /></h2>
<h3><img src="images/news_02.jpg" /><a href="newslist.aspx?tid=3"><img src="images/news_03.jpg" /></a></h3>
</h3>
<div class="kh_list">
<asp:Repeater ID="RepNews6" runat="server">
<ItemTemplate>
<dl>
<a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>">
<img src="<%#Eval("LPhoto") %>" width="90" height="91" alt="<%#Eval("title") %>" class="k_img" />
<dd>
<strong><%#Eval("style") %><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 12, true)%></strong>
<p><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("description"), 35, true)%></p>
<font>查看详细信息</font>
</dd>
</a>
</dl>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
   
<div class="notice">
<h2><img src="images/jh_22.jpg" /></h2>
<h3><img src="images/news_02.jpg" /><a href="newslist.aspx?tid=4"><img src="images/news_03.jpg" /></a></h3></h3>
<div class="hot"><div class="h_img"><img src="images/jh_12.jpg" /></div></div>
<ul>
<li class="n_left">
    <asp:Repeater ID="RepNews7" runat="server">
    <ItemTemplate>
<p><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><span><%#Eval("Publishtime", "{0:yyyy-MM-dd}")%></span><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 18, true)%></a></p>
    </ItemTemplate>
    </asp:Repeater>
</li>
<li class="n_right">
    <asp:Repeater ID="RepNews8" runat="server">
    <ItemTemplate>
<p><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><span><%#Eval("Publishtime", "{0:yyyy-MM-dd}")%></span><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 18, true)%></a></p>
    </ItemTemplate>
    </asp:Repeater>
<div class="clear"></div>
<font><img src="images/jh_68.jpg" /></font>
</li>
</ul>
</div>
</div>  
</div>
</div>
</asp:Content>