<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_EventsInformationAdd, App_Web_yijgkayn" %>
<%@ Register Src="~/admin/usercontrol/Ckeditor.ascx" TagPrefix="u1" TagName="Ckeditor" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" runat="server">
<div class="contentcontainer">
    <div class="headings altheading">
        <h2>新增发展大事记信息</h2>
    </div>
    <div class="contentbox state">
    <div class="clear"></div>

    <h3>是否显示：</h3>
    <asp:CheckBox ID="ckbIsShow" runat="server" Text="是否显示" Checked="true"/>
    <strong>tips:是否显示 </strong>
    <div class="clear"></div>

<%--    <h3>标题：</h3>
    <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:发展大事记标题长度最多100个字符 </strong>
    <div class="clear"></div>--%>
            
    <h3>发布者：</h3>
    <asp:TextBox ID="txtUserName" runat="server" CssClass="inputbox" MaxLength="50" Width="200" Text="茶花女"></asp:TextBox>
    <strong>tips: 发布者的名称</strong>
    <div class="clear"></div>
            
    <h3>发布时间：</h3>
    <asp:TextBox ID="txtPublishtime" runat="server" CssClass="inputbox" MaxLength="50" Width="200"></asp:TextBox>
    <strong>tips: 时间格式如：<%=DateTime.Now.ToString() %></strong>
    <div class="clear"></div>

    <h3>内容：</h3>
    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="inputbox" Height="200"></asp:TextBox>
    <div class="clear"></div>

    <asp:Button ID="Button2" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="保存" />
</div>
</div>

<script type="text/javascript" src="editor/ckeditor/ckeditor.js"></script>
<u1:ckeditor ID="ck1" runat="server" />
</asp:Content>