<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_AreaContactInformation, App_Web_yijgkayn" %>
<%@ Register Src="~/admin/usercontrol/AdminPage.ascx" TagPrefix="u1" TagName="BPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
<div class="contentcontainer">
<div class="headings altheading">
    <h2>地区联系人信息管理</h2>
</div>
<div class="contentbox">
    <table style="width:100%">
        <tbody>
            <asp:Repeater ID="RepNewsInfo" runat="server">
                <HeaderTemplate>
                    <tr>
                        <th>编号</th>
                        <th>所属省份</th>
                        <th>所属城市</th>
                        <th>所属区县</th>
                        <th>联系人名称</th>
                        <th>联系人电话</th>
                        <th>操作</th>
                        <th><asp:CheckBox ID="ckbChooseAll" runat="server" AutoPostBack="true" OnCheckedChanged="ckbChooseAll_OnCheckedChanged" />全选</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td style="width: 100px"><asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal></td>
                        <td style="width: 150px"><%#Eval("ProvinceName")%></td>  
                        <td style="width: 150px"><%#Eval("CityName") %></td>
                        <td style="width: 150px"><%#Eval("Extr") %></td>
                        <td style="width: 100px"><%# Eval("Name")%></td>
                        <td style="width: 100px"><%# Eval("Phone")%></td>

                        <td style="width: 100px">
                            <a href='AreaContactInformationEdit.aspx?id=<%# Eval("id") %>&pageindex=<%=pageindex %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                            <a href="#" title="" onclick="delInfo(-4,<%# Eval("id") %>,'联系人信息')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
                        </td>

                        <td style="width: 100px"><asp:CheckBox ID="ckbChoose" runat="server" /></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="alt">
                        <td style="width: 100px"><asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal></td>
                        <td style="width: 150px"><%#Eval("ProvinceName")%></td>  
                        <td style="width: 150px"><%#Eval("CityName") %></td>
                        <td style="width: 150px"><%#Eval("Extr") %></td>
                        <td style="width: 100px"><%# Eval("Name")%></td>
                        <td style="width: 100px"><%# Eval("Phone")%></td>

                        <td style="width: 100px">
                            <a href='AreaContactInformationEdit.aspx?id=<%# Eval("id") %>&pageindex=<%=pageindex %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                            <a href="#" title="" onclick="delInfo(-4,<%# Eval("id") %>,'联系人信息')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
                        </td>

                        <td style="width: 100px"><asp:CheckBox ID="ckbChoose" runat="server" /></td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
    <div class="extrabottom">
        <ul>
            <li><img alt="Edit" src="img/icons/icon_edit.png" />编辑</li>
            <li><img alt="Delete" src="img/icons/icon_delete.png" />删除</li>
        </ul>
        <div class="bulkactions">
            <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="btnDelete_Click" Width="80" OnClientClick="return confirm(&quot;您确定要删除吗？\r\n此操作将删除所选中的信息！&quot;)" Text="删除" />
        </div>
    </div>
        <u1:BPage ID="bpage" runat="server" />
</div>
</div>
</asp:Content>