<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_DataExport, App_Web_yijgkayn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" runat="Server">
    <div class="contentcontainer">
        <div class="headings altheading">
            <h2>备份数据库</h2>
        </div>
        <div class="contentbox state">
            <h3>下载备份数据库脚本信息</h3>
            <asp:Literal ID="litCreate" runat="server"></asp:Literal>
            <asp:Literal ID="litProcedure" runat="server"></asp:Literal>
            <asp:Literal ID="litInsert" runat="server"></asp:Literal>
            <asp:Label ID="databasemeg" runat="server" Text="" ForeColor="Red"></asp:Label>
            <strong>tips:下载备份数据库脚本信息链接 </strong>
            <div class="clear"></div>

            <h3>是否开启 SET IDENTITY_INSERT ON</h3>
            <asp:CheckBox ID="sii" runat="server" Checked="true" Text="是否开启 SET IDENTITY_INSERT ON" />
            <strong>tips: 是否开启 SET IDENTITY_INSERT ON </strong>
            <div class="clear"></div>

            <h3>是否开启 TRUNCATE TABLE</h3>
            <asp:CheckBox ID="ckbTruncate" runat="server" Checked="true" Text=" 是否开启 TRUNCATE TABLE" />
            <strong>tips: 是否清空数据库表中数据 </strong>
            <div class="clear"></div>

            <h3>是否导出数据库创建脚本 EXPORT DATABASE</h3>
            <asp:CheckBox ID="ckbCreateDatabase" runat="server" Checked="true" Text="是否导出数据库创建脚本 EXPORT DATABASE" />
            <strong>tips: 是否导出数据库创建脚本</strong>
            <div class="clear"></div>

            <h3>是否导出存储过程脚本 EXPORT PROC</h3>
            <asp:CheckBox ID="ckbCreateProc" runat="server" Checked="true" Text="是否导出存储过程脚本 EXPORT PROC" />
            <strong>tips: 是否导出存储过程脚本</strong>
            <div class="clear"></div>

            <h3>备份结果</h3>
            <asp:Literal ID="litResult" runat="server"></asp:Literal>
            <strong>tips: 备份结果</strong>
            <div class="clear"></div>

            <asp:Button ID="Export" runat="server" CssClass="btn" Text="确定" Width="80" OnClick="Export_Click" />
        </div>
    </div>
</asp:Content>
