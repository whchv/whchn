<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_PageSizeInformation, App_Web_yijgkayn" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" Runat="Server">
<div class="contentcontainer">
<div class="headings altheading">
    <h2>前台页数信息管理</h2>
</div>
<div class="contentbox state">
    <h3>新闻页数：</h3>
    <asp:TextBox ID="txtNewsSize" runat="server" MaxLength="3" CssClass="inputbox" Width="40%"></asp:TextBox>
    <strong>tips:新闻页数</strong>
    <div class="clear"></div>

    <h3>产品页数：</h3>
    <asp:TextBox ID="txtProductSize" runat="server" MaxLength="3" CssClass="inputbox" Width="40%"></asp:TextBox>
    <strong>tips:产品页数 </strong>
    <div class="clear"></div>

    <h3>发展大事记页数：</h3>
    <asp:TextBox ID="txtEventsSize" runat="server" MaxLength="3" CssClass="inputbox" Width="40%"></asp:TextBox>
    <strong>tips:发展大事记页数 </strong>
    <div class="clear"></div>
            
    <asp:Button ID="btnUpdateSizeInfo" runat="server" Text="保存" CssClass="btn" Width="80" onclick="btnUpdateSizeInfo_Click" />
</div>
</div>
</asp:Content>