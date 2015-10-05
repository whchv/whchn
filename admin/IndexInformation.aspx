<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_IndexInformation, App_Web_yijgkayn" %>
<asp:Content ID="Content1"  ContentPlaceHolderID="mainCP" Runat="Server">
<div class="contentcontainer">
<div class="headings altheading">
<h2>首页推荐信息管理</h2>
</div>
<div class="contentbox">  
<table style="width:100%">
<tbody>
<asp:Repeater ID="RepIndexInfo" runat="server">
<HeaderTemplate>
<tr>
<th>编号</th>
<th>标题</th>
<th>排序值( 数字 )</th>
<th>是否首页推荐显示</th>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr>
<td style="width:100px">
<asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
</td>
<td style="width: 200px">
<%# Eval("title") %>
</td>
<td style="width: 200px">
<asp:TextBox ID="txtIndexSort" runat="server" CssClass="inputbox" Text='<%# Eval("IndexSort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
</td>
<td style="width: 100px">
<%# bool.Parse(Eval("isindex").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
<asp:CheckBox ID="ckbisindex" Checked='<%# Eval("isindex") %>' runat="server" />
</td>
</tr>
</ItemTemplate>
<AlternatingItemTemplate>
<tr class="alt">
<td style="width: 100px">
<asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
</td>
<td style="width: 200px">
<%# Eval("title") %>
</td>
<td style="width: 200px">
<asp:TextBox ID="txtIndexSort" runat="server" CssClass="inputbox" Text='<%# Eval("IndexSort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
</td>
<td style="width: 100px">
<%# bool.Parse(Eval("isindex").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
<asp:CheckBox ID="ckbisindex" Checked='<%# Eval("isindex") %>' runat="server" />
</td>
</tr>
</AlternatingItemTemplate>
</asp:Repeater>
</tbody>
</table>
<div class="extrabottom">
<div class="bulkactions">
<asp:Button ID="btn_save" runat="server" onclick="btn_save_Click" Text="保存" CssClass="btnalt" Height="30px" Width="80px" />
</div>
</div>
</div>
</div>
</asp:Content>