<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_MenuPhotoInformationEdit, App_Web_yijgkayn" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" runat="server">
    <div class="contentcontainer">
    <div class="headings altheading">
        <h2>编辑板块图片信息</h2>
    </div>
    <div class="contentbox state">  
    <div class="clear"></div>
        <h3>图片：</h3>
        <asp:Image ID="imgList" runat="server" Visible="False" Width="1364" Height="225" />
        <asp:TextBox ID="txtListPath" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
        <asp:FileUpload ID="FuList" runat="server" />
        <img alt="Loading" src="img/loading.gif" />
        <asp:Button ID="btnList" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnList_Click" /><br />
        <strong>tips:板块图片 大小为 1680 X 277  (高/宽 单位:像素 由于图片过大,图片按比例缩小大小为 1364 X 225 )</strong>
        <div class="clear"></div>

        <a href="MenuPhotoInformation.aspx" class="btn">返回</a>

    </div>

</div>
</asp:Content>