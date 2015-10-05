<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_LinkInformationAdd, App_Web_yijgkayn" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" runat="server">
    <div class="contentcontainer">
        <div class="headings altheading">
        <h2>新增友情链接信息</h2>
        </div>
        <div class="contentbox state">  
        <div class="clear"></div>

        <h3>是否显示：</h3>
        <asp:CheckBox ID="ckbChoose" runat="server" Checked="true" Text="显示信息" />
        <strong>tips:是否显示</strong>
        <div class="clear"></div>

        <h3>图片：</h3>
        <asp:TextBox ID="txtPath" runat="server" CssClass="inputbox" Width="90%"></asp:TextBox>
        <asp:Image ID="IPhoto" runat="server" Visible="False" Height="36"/><br />
        <asp:FileUpload ID="fu_Photo" runat="server" />
        <asp:Button ID="Button3" runat="server" onclick="btn_upphoto_Click" Text="上传" CssClass="btnalt" />
        <strong>tips:友情链接图片 大小为 不要超过400 X 36 (宽/高 单位:像素)</strong>
        <div class="clear"></div>

        <h3>友情链接标题：</h3>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" MaxLength="5" Width="200"></asp:TextBox>
        <strong>tips: 友情链接标题,当鼠标划过时图片显示的文字信息</strong>
        <div class="clear"></div>
            
        <h3>排序值：</h3>
        <asp:TextBox ID="txtSort" runat="server" CssClass="inputbox" MaxLength="5" Width="200">1</asp:TextBox>
        <strong>tips: 排序值,必须是数字</strong>
        <div class="clear"></div>

        <h3>链接地址：</h3>
        <asp:TextBox ID="txtlink" runat="server" MaxLength="100" CssClass="inputbox"></asp:TextBox>
        <strong>tips:链接地址(需要以http://开头)</strong>
        <div class="clear"></div>

        <asp:Button ID="Button2" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="保存" />
        </div>
    </div>
</asp:Content>