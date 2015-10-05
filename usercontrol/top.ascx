<%@ control language="C#" autoeventwireup="true" inherits="usercontrol_top, App_Web_kw5qqjs0" %>
<%if(!Request.Url.ToString().Contains("brand")){ %>
<div class="news">
<h3><img src="images/about_18.jpg" /></h3>
<dl>
    <asp:Repeater ID="RepNew1" runat="server">
    <ItemTemplate>
<dt><img src="<%#Eval("TPhoto") %>" width="187" height="59" alt="<%#Eval("title") %>" /></dt>
<dd><strong><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 12, true)%></a></strong><span>POST TIME:<%#Eval("Publishtime", "{0:yyyy-MM-dd}").Replace("-", "/")%></span>
    </ItemTemplate>
    </asp:Repeater>
</dd>
</dl>
<ul>
    <asp:Repeater ID="RepNews2" runat="server">
    <ItemTemplate>
<li><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><span>0<%=count++ %></span><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 10, true)%></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
</div>
   <%} %>

<div class="lx">
<ul>
<li class="lx_l2"><a href="<%=weibo %>" target="_blank"><img src="images/about_42.jpg" /></a></li>
<li class="lx_l3"><a href="<%= wangwang %>" target="_blank"><img src="images/about_44.jpg" /></a></li>
<li class="lx_l4"><img src="images/lx_03.jpg" /></li>
</ul>.
</div>
   
<div class="dizhi">
<h3><img src="images/about_48.jpg" /></h3>
<dl>
<dt><img src="images/about_52.jpg" /></dt>
<dd>
<img src="images/about_13.jpg" /> 
<span>公司电话：
<b><%=Phone1 %></b>
</span>
<span>公司电话：
<font><%=Phone2 %></font>
</span>
</dd>
</dl>
</div>