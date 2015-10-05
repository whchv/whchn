<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_ProductTopInformation, App_Web_yijgkayn" %>
<asp:Content ID="Content1"  ContentPlaceHolderID="mainCP" Runat="Server">
<div class="contentcontainer">
<div class="headings altheading">
<h2>产品其它系列信息推荐管理</h2>
</div>
<div class="contentbox">  
<table width="100%">
<tbody>
    <asp:Repeater ID="RepIndexInfo" runat="server">
        <HeaderTemplate>
            <tr>
                <th>编号</th>
                <th>标题</th>
                <th>排序值( 数字 )</th>
                <th>是否推荐显示</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td style="width: 100px">
                    <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                </td>
                <td style="width: 200px">
                    <%# Eval("title") %>
                </td>
                <td style="width: 200px">
                    <asp:TextBox ID="txtTipsSort" runat="server" CssClass="inputbox" Text='<%# Eval("TopSort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
                </td>
                <td style="width: 100px">
                    <%# bool.Parse(Eval("IsTop").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "  <img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                    <asp:CheckBox ID="ckbIsTips" Checked='<%# Eval("IsTop") %>' runat="server" />
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
                    <asp:TextBox ID="txtTipsSort" runat="server" CssClass="inputbox" Text='<%# Eval("TopSort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
                </td>
                <td style="width: 100px">
                    <%# bool.Parse(Eval("IsTop").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "  <img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                    <asp:CheckBox ID="ckbIsTips" Checked='<%# Eval("IsTop") %>' runat="server" />
                </td>
            </tr>
        </AlternatingItemTemplate>
    </asp:Repeater>
</tbody>
</table>
<div class="extrabottom">
<div class="bulkactions">
<asp:DropDownList ID="DDL_NewsType" runat="server" AutoPostBack="True" Width="160" onselectedindexchanged="DDL_NewsType_SelectedIndexChanged"></asp:DropDownList>
<asp:Button ID="btn_save" runat="server" onclick="btn_save_Click" Text="保存" CssClass="btnalt" Height="30px" Width="80px" />
</div>
</div>
</div>
</div>
</asp:Content>