<%@ page language="C#" autoeventwireup="true" inherits="admin_ForgottenPassword, App_Web_yijgkayn" masterpagefile="~/admin/master/MasterFP.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" runat="Server">
<div class="contentcontainer">
    <div class="headings">
        <h2>找回密码</h2>
    </div>
    <div class="contentbox state">
        <h3>登录用户名：</h3>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
        <strong>tips:用于登录网站的用户名</strong>
        <div class="clear"></div>
    </div>
    <asp:Button ID="Button2" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="找回密码" />
</div>
</asp:Content>
