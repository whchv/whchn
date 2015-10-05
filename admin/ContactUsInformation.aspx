<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_ContactUsInformation, App_Web_yijgkayn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
<div class="contentcontainer">
    <div class="headings altheading">
        <h2>联系我们信息管理</h2>
    </div>
    <div class="contentbox state">
        <h3>公司电话：</h3>
        <asp:TextBox ID="txtPhone1" runat="server" MaxLength="50" CssClass="inputbox"></asp:TextBox>
        <strong>tips:公司电话</strong>
        <div class="clear"></div>

        <h3>公司传真：</h3>
        <asp:TextBox ID="txtPhone2" runat="server" MaxLength="50" CssClass="inputbox"></asp:TextBox>
        <strong>tips:公司传真</strong>
        <div class="clear"></div>

        <h3>微博：</h3>
        <asp:TextBox ID="txtWeiBo" runat="server" MaxLength="50" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的微博 </strong>
        <div class="clear"></div>

        <h3>阿里旺旺：</h3>
        <asp:TextBox ID="txtWangwang" runat="server" MaxLength="150" CssClass="inputbox"></asp:TextBox>
        <strong>tips:阿里旺旺 </strong>
        <div class="clear"></div>

        <asp:Button ID="Button1" runat="server" OnClick="btnSave_Click" Text="保存" CssClass="btn" Width="80" />
        </div>
    </div>
</asp:Content>