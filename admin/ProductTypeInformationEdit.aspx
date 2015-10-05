<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_ProductTypeInformationEdit, App_Web_yijgkayn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
 <div class="contentcontainer">
        <div class="headings altheading">
            <h2>编辑产品类型信息</h2>
        </div>
        <div class="contentbox state">
            <h3>是否显示：</h3>
            <asp:CheckBox ID="ckbChoose" runat="server" Text="显示信息" />
            <strong>tips:是否显示该类型 </strong>
            <div class="clear"></div>

            <h3>所属类型：</h3>
            <asp:DropDownList ID="ddltype" runat="server">
            </asp:DropDownList>
            <strong>tips:所属类型 </strong>
            <div class="clear"></div>

            <h3>类型名：</h3>
            <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" CssClass="inputbox"></asp:TextBox>
            <strong>tips:产品类型名长度最多50字符 </strong>
            <div class="clear"></div>

            <h3>英文类型名：</h3>
            <asp:TextBox ID="txtEnTitle" runat="server" MaxLength="50" CssClass="inputbox"></asp:TextBox>
            <strong>tips:产品英文类型名长度最多50字符 </strong>
            <div class="clear"></div>

            <h3>排序值：</h3>
            <asp:TextBox ID="txtSort" runat="server" MaxLength="5" CssClass="inputbox"></asp:TextBox>
            <strong>tips:排序值只能为数字</strong>
            <div class="clear"></div>
            
            <asp:Button ID="Button1" runat="server" OnClick="btnSave_Click" Text="保存" CssClass="btn" Width="80" />
        </div>
    </div>
</asp:Content>