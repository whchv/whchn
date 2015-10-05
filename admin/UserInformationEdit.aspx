<%@ page language="C#" autoeventwireup="true" inherits="admin_UserInformationEdit, App_Web_yijgkayn" masterpagefile="~/admin/master/Master.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" runat="server">
    <div class="contentcontainer">
        <div class="headings altheading">
            <h2>编辑管理员信息</h2>
        </div>
        <div class="contentbox state">
            <h3>管理员名：</h3>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
            <strong>tips:管理员名不能为空 </strong>
            <div class="clear"></div>

            <h3>密码：</h3>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="inputbox" MaxLength="256" TextMode="Password"></asp:TextBox>
            <strong>tips:密码长度不能小于6位 </strong>
            <div class="clear"></div>

            <h3>确认密码：</h3>
            <asp:TextBox ID="txtConPassword" runat="server" CssClass="inputbox" MaxLength="256" TextMode="Password"></asp:TextBox>
            <strong>tips:两次密码输入一致</strong>
            <div class="clear"></div>
            <asp:Button ID="Button1" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="保存" />
        </div>
    </div>
</asp:Content>
