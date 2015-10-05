<%@ Page  Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true" CodeFile="branddetail.aspx.cs" Inherits="branddetail" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.aspx" class="index">首页</a> <a href="brand.aspx" class="gy">品牌与产品</a></div>
</div>
<div class="bg_nr">
<div class="box">
<div class="leftbox">
<div class="menu_ny">
<h3><img src="images/hl_03.jpg" /></h3>
<ul>
<asp:Repeater ID="RepBigType" runat="server" onitemdatabound="RepBigType_ItemDataBound">
<ItemTemplate>
<li class="<%#Eval("style") %>"><h4><a href="javascript:void(0)"><%#Eval("typetitle")%><span></span></a></h4>
<dl>
<asp:Repeater ID="RepSmallType" runat="server" onitemdatabound="RepSmallType_ItemDataBound" >
<ItemTemplate>
<dt><a href="javascript:void(0)"><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 13, false)%></a></dt>
<dd>
    <asp:Repeater ID="RepInfo" runat="server">
    <ItemTemplate>
<p <%#Eval("style") %>><a href="branddetail.aspx?id=<%#Eval("id") %>&tid=<%#Eval("TypeID") %>"><%# Eval("title") %></a></p>
    </ItemTemplate>
    </asp:Repeater>
</dd>
</ItemTemplate>
</asp:Repeater>
</dl>
</li>
</ItemTemplate>
</asp:Repeater>
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
<div class="brand_xx">
<dl>
<asp:Repeater ID="RepDetail" runat="server">
<ItemTemplate>
<dt>
<strong><%#Eval("title") %></strong>
<span><img src="<%#Eval("DPhoto") %>" width="280" height="280" alt="<%#Eval("title") %>" /></span>
</dt>
<dd>
<font><img src="images/b_03.jpg" /></font>
<p><i>品&nbsp;&nbsp;&nbsp;&nbsp;牌：</i><span><%#Eval("Brand")%></span></p>
<p><i>货&nbsp;&nbsp;&nbsp;&nbsp;号：</i><b><%#Eval("GoodsID")%></b></p>
<p><i>系&nbsp;&nbsp;&nbsp;&nbsp;列：</i><span><%#Eval("extr")%></span></p>
<p><i>产品名称：</i><span><%#Eval("ProductName")%></span></p>
<p><i>表面材质：</i><span><%#Eval("Caizhi")%></span></p>
<p><i>主要成分：</i><span><%#Eval("Chengfen")%></span></p>
<p><i>产品规格：</i><span><%#Eval("Guige")%></span></p>
<p><i>数&nbsp;&nbsp;&nbsp;&nbsp;量：</i><span><%#Eval("Shuliang")%></span></p>
<p><i>产品卖点：</i><span><%#Eval("Description")%></span></p>
</dd>
</ItemTemplate>
</asp:Repeater>
</dl>
    
<h3>茶花女其他系列<span>OTHER SERIES OF THE CAMELLIA HEALTH PRODUCTS</span></h3>
<ul>
    <asp:Repeater ID="RepOhterInfo" runat="server">
    <ItemTemplate>
<li><a href="branddetail.aspx?id=<%#Eval("id") %>&tid=<%=tid %>" title="<%#Eval("title") %>"><img src="<%#Eval("DPhoto") %>" width="95" height="95" alt="<%#Eval("title") %>" /><p><strong><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 10, false)%></strong> <b><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("entitle"), 15, false)%></b><font>点击查看</font> </p></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
</div>
   
<div class="next" style="border-top:none;">
<ul>
<li class="left"><a class="return" href="brandlist.aspx?tid=<%=tid %>&ttid=<%=ttid %>">返回列表</a></li>
<li class="right"><a class="syp" href="<%=preurl %>&tid=<%=tid %>" title="<%=pretitle %>">上一篇</a><a class="xyp" href="<%=nexturl %>&tid=<%=tid %>" title="<%=nexttitle %>">下一篇</a></li>
</ul>
</div>
</div>  
</div>
</div>
</asp:Content>