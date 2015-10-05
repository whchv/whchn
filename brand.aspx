<%@ Page Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true" CodeFile="brand.aspx.cs" Inherits="brand" %>
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
<li>
<h4><a href="javascript:void(0)"><%#Eval("typetitle") %><span></span></a></h4>
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

<script type="text/javascript">
    $(function () {
        $(".flk").click(function () {
            $(".flk").removeClass("select");
            $(this).addClass("select");
        });
    });
</script>
</div>
   
<uc1:top ID="top1" runat="server" />

</div>

<div class="rightbox">
<div class="t_nr">
<ul>
<li class="left"><strong>BRAND<span>品牌与产品</span></strong></li>
<li class="right"><img src="images/about_11.jpg" /></li>
</ul>
</div>
   
<div class="bg_ny">
<div class="product_zt">
<h3><img src="images/zt_03.jpg" /></h3>
<div class="zt_nr">
<div class="block_zt">
<div class="botton_zt">
<ul>
<asp:Repeater ID="RepInfo" runat="server">
<ItemTemplate>
<li>
<a href="branddetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>">
<img src="<%#Eval("MPhoto") %>" width ="285" height="185" alt="<%#Eval("title") %>"/>
<strong><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 15, true)%></strong>
<font><img src="images/zt_04.jpg" /></font>
</a>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
<a class="prev_btn"></a>
<a class="next_btn"></a> 
</div>
</div>
</div>
<div class="brand">
<a id="1"></a>
<h3 class="b_title2"><span><a href="brandlist.aspx?tid=1"><img src="images/brand_01.jpg" /></a></span>婴儿护理用品系列产品</h3>
<ul>
    <asp:Repeater ID="RepPro1" runat="server">
    <ItemTemplate>
<li><a href="branddetail.aspx?id=<%#Eval("id") %>&tid=1" title="<%#Eval("title") %>"><img src="<%#Eval("Photo") %>" alt="<%#Eval("title") %>" /><font class="b_txt1"><b></b><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 10, false)%></font><p class="p_t1">查看更多系列产品</p></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>

<a id="2"></a> 
<h3 class="b_title1"><span><a href="brandlist.aspx?tid=2"><img src="images/brand_02.jpg" /></a></span>女性护理用品系列产品</h3>
<ul>
    <asp:Repeater ID="RepPro2" runat="server">
    <ItemTemplate>
<li><a href="branddetail.aspx?id=<%#Eval("id") %>&tid=2" title="<%#Eval("title") %>"><img src="<%#Eval("Photo") %>" alt="<%#Eval("title") %>" /><font class="b_txt1"><b></b><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 10, false)%></font><p class="p_t2">查看更多系列产品</p></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
<a id="3"></a>
<h3 class="b_title3"><span><a href="brandlist.aspx?tid=3"><img src="images/brand_03.jpg" /></a></span>成人护理用品系列产品</h3>
<ul>
    <asp:Repeater ID="RepPro3" runat="server">
    <ItemTemplate>
<li><a href="branddetail.aspx?id=<%#Eval("id") %>&tid=3" title="<%#Eval("title") %>"><img src="<%#Eval("Photo") %>" alt="<%#Eval("title") %>" /><font class="b_txt1"><b></b><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 10, false)%></font><p class="p_t3">查看更多系列产品</p></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
<a id="4"></a>
<h3 class="b_title4"><span><a href="brandlist.aspx?tid=4"><img src="images/brand_04.jpg" /></a></span>生活用品系列产品</h3>
<ul>
    <asp:Repeater ID="RepPro4" runat="server">
    <ItemTemplate>
<li><a href="branddetail.aspx?id=<%#Eval("id") %>&tid=4" title="<%#Eval("title") %>"><img src="<%#Eval("Photo") %>" alt="<%#Eval("title") %>" /><font class="b_txt1"><b></b><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 10, false)%></font><p class="p_t4">查看更多系列产品</p></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
</div>
</div>  
</div>
</div>
</asp:Content>