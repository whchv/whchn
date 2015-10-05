<%@ page language="C#" autoeventwireup="true" inherits="admin_SearchInformation, App_Web_yijgkayn" masterpagefile="~/admin/master/Master.master" %>

<asp:Content ContentPlaceHolderID="mainCP" runat="server">
    <div class="contentcontainer">
        <div class="headings altheading">
            <h2>
                站内搜索</h2>
        </div>
<style type="text/css">
    .fl
    {
        float: left;
    }
            
    .box { margin: 10px 0;}
    .box h2 { font-weight:normal;} 
    .box  a {color:#0063B7; text-decoration:none;}
</style>
<div class="contentbox state">
<asp:TextBox ID="txtSearch" runat="server" CssClass="inputbox fl" MaxLength="100" Width="80%"></asp:TextBox>
<asp:Button ID="btnSerch" runat="server" Text="搜索" CssClass="fl btnalt" OnClick="btnSave_Click" Width="80" />
<div class="clear"></div>
<a name="here"></a>
<asp:Repeater ID="RepList" runat="server">

    <ItemTemplate>
    <div class="box">
        <h2>
            <a href="<%# Eval("linkurl") %>" target="_blank" title="<%# Eval("title") %>"><%# Eval("title") %></a></h3>
        <p>
            <%# Infarts.BLL.ShareInfoFactory.SubString(Infarts.BLL.ShareInfoFactory.trimDescreption(Eval("description").ToString()), 80, true)%></p>
    </div>
    </ItemTemplate>
    </asp:Repeater>
<ul class="pagination" style="float:none; height:30px;">

  <li class="text">
  <%if (PageIndex!=1)
    {%>
      <a title="第一页" <%="href=?wd="+  Server.UrlEncode(wd)+"&PageIndex=1#here" %>>Frist</a>
    <%}
    else
        { %>
          Frist
        <% } %>
  </li>
<li class="text">
<% if (PageIndex != 1)
{ %>
<a <%= PageIndex <= 1 ? "" : "href=?wd=" + Server.UrlEncode(wd) + "&PageIndex=" + (PageIndex - 1)+"#here"%>
title="上一页">Previous</a>
<% }
else
{ %>
Previous
<% } %>
</li>
<asp:Repeater ID="RepPage" runat="server">
<ItemTemplate>
<li class="<%#Eval("style") %>"><a href="?wd=<%=  Server.UrlEncode(wd) %>&PageIndex=<%#Eval("PageIndex") %>#here" >
<%#Eval("PageIndex")%></a></li>
</ItemTemplate>
</asp:Repeater>
<li class="text">
<% if (PageIndex != PageCount)
{ %>
<a <%= PageIndex>=PageCount?"":"href=?wd="+  Server.UrlEncode(wd)+"&PageIndex="+(PageIndex+1)+"#here" %>
title="下一页">Next</a>
<% }
else
{ %>
Next
<% } %>
  <li class="text">
  <%if (PageIndex!=PageCount)
    {%>
      <a title="最后一页" <%="href=?wd="+  Server.UrlEncode(wd)+"&PageIndex="+PageCount+"#here" %>>Frist</a>
    <%}
    else
        { %>
          Last
        <% } %>
  </li>
</li>
<li style="margin-left:120px; font-size:16px;"><ins>找到相关结果<%=k %>个</ins></li>
</ul>
</div>
    </div>
</asp:Content>
