<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_ProductIndexTypeInformationEdit, App_Web_yijgkayn" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" runat="server">
    <div class="contentcontainer">
    <div class="headings altheading">
        <h2>编辑产品首页类别信息</h2>
    </div>
    <div class="contentbox state">  
    <div class="clear"></div>
        <h3>类别名称：</h3>
        <asp:TextBox ID="txttypetitle" CssClass="inputbox" MaxLength="100" Width="400" runat="server"></asp:TextBox>
        <strong>tips:类别名称</strong>
        <div class="clear"></div>
        
        <h3>英文标题：</h3>
        <asp:TextBox ID="txttitle" CssClass="inputbox" MaxLength="100" Width="400" runat="server"></asp:TextBox>
        <strong>tips:英文标题</strong>
        <div class="clear"></div>

        <h3>图片：</h3>
        <asp:Image ID="imgList" runat="server" Visible="False" Width="162" Height="108" />
        <asp:TextBox ID="txtListPath" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
        <asp:FileUpload ID="FuList" runat="server" />
        <img alt="Loading" src="img/loading.gif" />
        <asp:Button ID="btnList" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnList_Click" /><br />
        <strong>tips:产品首页类别 图片 大小为 162 X 108  (高/宽 单位:像素)</strong>
        <div class="clear"></div>
        <h3>描述：</h3>
        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" CssClass="inputbox" Height="150px" MaxLength="220"></asp:TextBox>
        <strong>tips: 描述</strong>
        <div class="clear"></div>

        <asp:Button ID="Button2" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="保存" />
    </div>
</div>
</asp:Content>