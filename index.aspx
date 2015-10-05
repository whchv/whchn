<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="index, App_Web_okhqlhfe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- head end-->
<div class="banner">
<div class="b_tabs">
    <asp:Repeater ID="RepSlideInfo" runat="server">
    <ItemTemplate>
<div class="ban_con"><a href="<%# Eval("Link").ToString()=="#" ? "javascript:;": Eval("Link")%>" title="<%#Eval("title") %>" target="<%# Eval("Link").ToString()=="#" ? "_self": "_blank"%>"><img src="<%#Eval("Photo") %>" alt="<%#Eval("title") %>" width="1680" height="408" /></a></div>
    </ItemTemplate>
    </asp:Repeater>

</div>
<div class="scroll">
<div class="block">
<div class="botton-scroll">
<ul class="featureUL">
    <asp:Repeater ID="RepSlideInfo1" runat="server">
    <ItemTemplate>
<li><a href="#"><span><img src="<%#Eval("SmallPhoto") %>" width="45" height="46" alt="<%#Eval("title") %>" /></span><p><%#Eval("title") %></p><font><%#Eval("extr") %></font></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
</div>
<a class="prev_show"></a>
<a class="next_show"></a>
</div>
</div>
</div>

<!-- banner end-->
<div class="bg">
<div class="main">
<div class="products">
<h3><span><a href="brand.aspx"></a></span><img src="images/sy_39.jpg" /></h3>
<ul>
<asp:Repeater ID="RepIndexType" runat="server">
<ItemTemplate>
<li>
<a href="brandlist.aspx?tid=<%#Eval("id") %>" title="<%#Eval("title") %>">
<img src="<%#Eval("Photo") %>" width="162" height="108" alt="<%#Eval("Title") %>" />
<strong><%#Eval("TypeTitle")%><b><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("Title"), 15, false)%></b></strong>
<p><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("Description"), 30, true)%></p>
<font></font>
</a>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
  
<div class="zixun">
<div class="topnews">
<h3><span><a href="news.aspx"></a></span><img src="images/sy_68.jpg" /></h3>
<div class="xwzx">
<ins><img src="images/jh_12.jpg" /></ins>
<div class="newslist">
<dl>
    <asp:Repeater ID="RepNews1" runat="server">
    <ItemTemplate>
<dd><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><font><%# Eval("Publishtime", "{0:yyyy-MM-dd}").Replace("-", ".")%></font><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 18, true)%></a></dd>
    </ItemTemplate>
    </asp:Repeater>
</dl>
</div>
     
<div class="newslist">
<dl>
    <asp:Repeater ID="RepNews2" runat="server">
    <ItemTemplate>
<dd><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><font><%# Eval("Publishtime", "{0:yyyy-MM-dd}").Replace("-", ".")%></font><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 18, true)%></a></dd>
    </ItemTemplate>
    </asp:Repeater>
</dl>
</div>
     
<div class="newslist">
<dl>
    <asp:Repeater ID="RepNews3" runat="server">
    <ItemTemplate>
<dd><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><font><%# Eval("Publishtime", "{0:yyyy-MM-dd}").Replace("-", ".")%></font><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 18, true)%></a></dd>
    </ItemTemplate>
    </asp:Repeater>
</dl>
</div>
     
<div class="newslist">
<dl>
    <asp:Repeater ID="RepNews4" runat="server">
    <ItemTemplate>
<dd><a href="newsdetail.aspx?id=<%#Eval("id") %>" title="<%#Eval("title") %>"><font><%# Eval("Publishtime", "{0:yyyy-MM-dd}").Replace("-", ".")%></font><%#Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 18, true)%></a></dd>
    </ItemTemplate>
    </asp:Repeater>
</dl>
</div>
</div>
<ul class="list_btn">
    <li><a href="newslist.aspx?tid=1">新闻资讯<span>TOP NEWS</span></a></li>
    <li><a href="newslist.aspx?tid=2">市场活动<span>MARKET</span></a></li>
    <li><a href="newslist.aspx?tid=3">客户见证<span>WITNESS</span></a></li>
    <li><a href="newslist.aspx?tid=4">我在茶花女<span>I AM IN CHN</span></a></li>
</ul>
</div>

<div class="cptj">
<h3><span><a href="brand.aspx"></a></span><img src="images/sy_71.jpg" /></h3>
<div class="cptj_list">
<div class="cp_nr">
<asp:Repeater ID="RepPro1" runat="server">
<ItemTemplate>
<dl><dt><img src="<%#Eval("DPhoto") %>" width="130" height="130" alt="<%#Eval("title") %>" /></dt><dd><span><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("entitle"), 20, false)%></span><b><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("title"), 9, false)%></b><p><%# Infarts.BLL.ShareInfoFactory.SubString(Eval("description"), 35, true)%><a href="branddetail.aspx?id=<%#Eval("id") %>&tid=<%#Eval("ttid") %>" title="<%#Eval("title") %>" class="detail">查看详细信息</a></p></dd></dl>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
<ul class="p_list">
    <asp:Repeater ID="RepPro2" runat="server">
    <ItemTemplate>
<li><a href="#"><span><%#Eval("title") %></span></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
    
<script>
    $(document).ready(function () {
        $(".p_list li").hover(function () {
            $(this).width(223);
        });
    });
</script>
    
</div>
<div class="lxfs">
<h3><img src="images/sy_73.jpg" /></h3>
<div class="tel">
<p>TELEPHONE<span>电话</span>
<strong><%=phone %></strong>
</p>
<p>FAX HOTLINE<span>传真</span>
<strong><%=phone1 %></strong>
</p>
</div>
<div class="address">
<dl>
<dt><img src="images/sy_92.jpg" /></dt>
<dd><strong>联系地址<span>ADDRESS</span></strong>
<p>武汉市东西湖区慈惠办事处九通路11号</p>

</dd>
</dl>
</div>
</div>
</div>
  
<!--友情链接 end-->
</div>
</asp:Content>