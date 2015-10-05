<%@ Page Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true" CodeFile="brandlist.aspx.cs" Inherits="brandlist" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.aspx" class="index">首页</a> <a href="brandlist.aspx?tid=<%=tid %>" class="gy"><%=title %></a></div>
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
    <asp:Repeater ID="RepSmallType" runat="server">
    <ItemTemplate>
<dt><a href="brandlist.aspx?tid=<%#Eval("typeid") %>&ttid=<%#Eval("id") %>"><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 13, false)%></a></dt>
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
<div class="brand_list">
<asp:Repeater ID="RepType" runat="server" onitemdatabound="RepType_ItemDataBound">
<ItemTemplate>
<h3><%#Eval("title") %></h3>
<ul>
<asp:Repeater ID="RepInfo" runat="server">
<ItemTemplate>
<li>
<a href="branddetail.aspx?id=<%#Eval("id") %>&tid=<%=tid %>" title="<%#Eval("title") %>"><img src="<%#Eval("Photo") %>" width="148" height="90" alt="<%#Eval("title") %>" />
<font><b></b><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 10, false)%></font>
<p>查看更多系列产品</p>
</a>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</ItemTemplate>
</asp:Repeater>
    
</div>
<div class="pages">
<ul>
<li class="left"><a href="brand.aspx">返回品牌与产品</a></li>

<li class="right">
<a href="?tid=<%=tid %>&ttid=<%=ttid %>&pageindex=<%= pageindex - 1 > 0 ? ( pageindex - 1) : 1 %>">上一页</a>
<asp:Repeater ID="RepNum" runat="server">
<ItemTemplate>
<a href="?tid=<%=tid %>&ttid=<%=ttid %>&pageindex=<%# Eval("PageIndex")%>" class="<%#Eval("style") %>"><%#Eval("PageIndex")%></a>
</ItemTemplate>
</asp:Repeater>
<a href="?tid=<%=tid %>&ttid=<%=ttid %>&pageindex=<%= pageindex + 1 < pagecount ? ( pageindex + 1 ) : pagecount %>">下一页</a>
</li>
</ul>
</div>
</div>  
</div>
</div></asp:Content>