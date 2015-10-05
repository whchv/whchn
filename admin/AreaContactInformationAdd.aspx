<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_AreaContactInformationAdd, App_Web_yijgkayn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
    <div class="contentcontainer">
        <div class="headings altheading">
            <h2>添加地区联系人信息</h2>
        </div>
        <div class="contentbox state">  
        <div class="clear"></div>           
           
        <h3>省市：</h3>
        <asp:DropDownList ID="DDLProv" runat="server" Width="15%" Height="30px" onselectedindexchanged="DDLProv_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>&nbsp;省
        <asp:DropDownList ID="DDLCity" runat="server" Width="15%" Height="30px"></asp:DropDownList>
        <strong>tips省市  </strong>
        <div class="clear"></div>

        <h3>是否高亮显示：</h3>
        <asp:CheckBox ID="ckbIsTop" runat="server" Text="是否高亮显示"/>
        <strong>tips:带有星星图案的样式</strong>
        <div class="clear"></div>

        <h3>联系人：</h3>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" MaxLength="50" Width="400"></asp:TextBox>
        <strong>tips:联系人姓名.长度最多10个字符  </strong>
        <div class="clear"></div>

        <h3>联系人地区：</h3>
        <asp:TextBox ID="txtExtr" runat="server" CssClass="inputbox" MaxLength="50" Width="400"></asp:TextBox>
        <strong>tips:联系人地区信息 </strong>
        <div class="clear"></div>

        <h3>联系电话：</h3>
        <asp:TextBox ID="txtTele" runat="server" CssClass="inputbox" MaxLength="30" Width="400"></asp:TextBox>
        <strong>tips:联系电话长度最多30个字符  </strong>
        <div class="clear"></div>

        <asp:Button ID="btnSave" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click"  Text="保存" />
        </div>
   </div>
   
</asp:Content>