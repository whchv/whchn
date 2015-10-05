<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_LinkInformation, App_Web_yijgkayn" %>
<%@ Register Src="~/admin/usercontrol/AdminPage.ascx" TagPrefix="u1" TagName="BPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
    <div class="contentcontainer">
    <div class="headings altheading"><h2>友情链接信息管理</h2></div>
    <div class="contentbox">
      <table style="width:100%">
        <tbody>
        <asp:Repeater ID="RpLink" runat="server">
        <HeaderTemplate>
            <tr>
                <th>编号</th>
                <th>标题</th>
                <th>链接地址(需要以http://开头)</th>
                <th>排序值( 数字 )</th>
                <th>是否显示</th>
                <th>操作</th>
            <th><asp:CheckBox ID="ckbChooseAll" runat="server" AutoPostBack="true" OnCheckedChanged="ckbChoseAll_OnCheckedChanged" />全选</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
        <tr>
            <td style="width: 100px">
                <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
            </td>
            <td style="width: 300px">
                <%# Eval("title") %>
            </td>
            <td style="width: 300px">
                <a href="<%# Eval("LinkUrl") %>" target="_blank"><%# Eval("LinkUrl") %></a>
            </td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSort" runat="server" Text='<%# Eval("sort") %>' CssClass="inputbox" MaxLength="5" Width="70%"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <%# bool.Parse(Eval("isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                <asp:CheckBox ID="Ck_Isshow" Checked='<%# Eval("isshow") %>' runat="server" />
            </td>
                                 
            <td style="width: 100px">
                <a href='LinkInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                <a href="#" title="" onclick="delInfo(-7,<%# Eval("id") %>,'友情链接')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
            </td>
                               
            <td style="width: 100px">
                <asp:CheckBox ID="ckbChoose" runat="server" />
            </td>
        </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
        <tr class="alt">
            <td style="width: 100px">
                <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
            </td>
            <td style="width: 300px">
                <%# Eval("title") %>
            </td>
            <td style="width: 300px">
                <a href="<%# Eval("LinkUrl") %>" target="_blank"><%# Eval("LinkUrl") %></a>
            </td>
            <td style="width: 100px">
                <asp:TextBox ID="txtSort" runat="server" Text='<%# Eval("sort") %>' CssClass="inputbox" MaxLength="5" Width="70%"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <%# bool.Parse(Eval("isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                <asp:CheckBox ID="Ck_Isshow" Checked='<%# Eval("isshow") %>' runat="server" />
            </td>
                                 
            <td style="width: 100px">
                <a href='LinkInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                <a href="#" title="" onclick="delInfo(-7,<%# Eval("id") %>,'友情链接')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
            </td>
                               
            <td style="width: 100px">
                <asp:CheckBox ID="ckbChoose" runat="server" />
            </td>
        </tr>
        </AlternatingItemTemplate>
        </asp:Repeater>
    </tbody>
</table>
      
<div class="extrabottom">
    <ul>
        <li><img alt="Approve" src="img/icons/icon_approve.png" />显示</li>
        <li><img alt="Unapprove" src="img/icons/icon_unapprove.png" />不显示</li>
        <li><img alt="Delete" src="img/icons/icon_delete.png" /> 删除</li>
    </ul>
    <div class="bulkactions">
        <asp:Button ID="Button2" runat="server" Width="80" CssClass="btn"   OnClick="btnSave_Click" Text="保存" />
        <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="btnDelete_Click" Text="删除" Width="80" onclientclick="return confirm(&quot;您确定要删除吗？&quot;)"/>
    </div>
</div>
<u1:BPage ID="bpage" runat="server" />
</div>
</div>
</asp:Content>