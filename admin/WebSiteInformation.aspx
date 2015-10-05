<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_websiete, App_Web_yijgkayn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" runat="server">
<div class="contentcontainer">
    <div class="headings altheading">
        <h2>站点基本信息</h2>
    </div>
    <div class="contentbox state">
        <h3>站点名称：</h3>
        <asp:TextBox ID="txtsiteName" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:站点名称显示在浏览器顶部
        </strong>
        <div class="clear"></div>

        <h3>站点URL：</h3>
        <asp:TextBox ID="txtSiteUrl" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的域名信息</strong>
        <div class="clear"></div>

        <h3>站点备案信息：</h3>
        <asp:TextBox ID="txtSiteCert" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的备案信息</strong>
        <div class="clear"></div>
            
        <h3>站点E-Mail：</h3>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips网站的邮箱,可用于找回密码</strong>
        <div class="clear"></div>

        <h3>开发团队：</h3>
        <asp:TextBox ID="txtTeam" runat="server" CssClass="inputbox" ReadOnly="true"></asp:TextBox>
        <strong>tips:网站的开发团队</strong>
        <div class="clear"></div>

        <h3>版权信息：</h3>
        <asp:TextBox ID="txtCopyRight" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips网站的版权信息</strong>
        <div class="clear"></div>

        <h3>站点建立时间：</h3>
        <asp:TextBox ID="txtBuildDate" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的描述建立时间</strong>
        <div class="clear"></div>

        <h3>站点描述：</h3>
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="8" Columns="88" CssClass="inputbox"></asp:TextBox>
        <strong>tips: 此处信息关系到网站的描述，请认真考虑后填写，不建议经常更换</strong>
        <div class="clear"></div>

        <h3>站点关键字：</h3>
        <asp:TextBox ID="txtSiteKeyword" runat="server" TextMode="MultiLine" Rows="8" Columns="88" CssClass="inputbox"></asp:TextBox>
        <strong>tips: 此处信息关系到网站的关键词，请认真考虑后填写，不建议经常更换</strong>
        <div class="clear"></div>

        <h3>站点版本：</h3>
        <asp:TextBox ID="txtEdition" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的版本信息</strong>
        <div class="clear"></div>

    </div>
    <div class="headings altheading">
        <h2>站点联系信息</h2>
    </div>
    <div class="contentbox state">
        <h3>联系人地址：</h3>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips: 网站的联系人地址</strong>
        <div class="clear"></div>

        <h3>联系人电话：</h3>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的联系人电话(可以是客服电话)</strong>
        <div class="clear"></div>

        <h3>联系人邮箱：</h3>
        <asp:TextBox ID="txtUEmail" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips: 网站的联系人邮箱</strong>
        <div class="clear"></div>

        <h3>联系人姓名：</h3>
        <asp:TextBox ID="txtName" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的联系人姓名</strong>
        <div class="clear"></div>

        <h3>联系人手机：</h3>
        <asp:TextBox ID="txtMobile" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的联系人手机</strong>
        <div class="clear"></div>

        <h3>QQ：</h3>
        <asp:TextBox ID="txtQQ" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips: 网站负责人的QQ</strong>
        <div class="clear"></div>

        <h3>MSN：</h3>
        <asp:TextBox ID="txtMSN" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips:网站的MSN</strong>
        <div class="clear"></div>
        <a name="here"></a>

    </div>

    <div class="headings altheading">
        <h2>
            外部JS信息</h2>
    </div>
    <div class="contentbox state">
        <div style="display: none;">
            <h3>每页显示行数：</h3>
            <asp:TextBox ID="txtPageSize" runat="server" CssClass="inputbox"></asp:TextBox>
            <strong>tips: </strong>
            <div class="clear"></div>
        </div>
        <h3>统计代码：</h3>
        <asp:TextBox ID="txtStat" runat="server" CssClass="inputbox"></asp:TextBox>
        <strong>tips: 网站的统计代码</strong>
        <div class="clear"></div>

        <h3>TQ 代码：</h3>
        <asp:TextBox ID="txtTQInfo" runat="server" TextMode="MultiLine" Height="100" CssClass="inputbox" Rows="8" Columns="88"></asp:TextBox>
        <strong>tips: 网站的TQ 代码</strong>
        <div class="clear"></div>
    </div>
         
    <div class="headings alt">
    <h2>占用空间信息</h2>
    </div>
    <div class="contentbox state">
        <h3>占用空间信息：</h3>
        <asp:Literal ID="litSpace" runat="server"></asp:Literal>
        <div class="clear"></div>
    </div>
    <asp:Button ID="submit" runat="server" Text="保存" CssClass="btn" OnClick="submit_Click" Width="80" />
    <asp:Button ID="btnclean" runat="server" Text="清空数据库日志文件" CssClass="btn" onclick="btnclean_Click" />
</div>
</asp:Content>