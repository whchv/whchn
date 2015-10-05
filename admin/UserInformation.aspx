<%@ page language="C#" autoeventwireup="true" inherits="admin_UserInformation, App_Web_yijgkayn" masterpagefile="~/admin/master/Master.master" %>

<asp:Content ContentPlaceHolderID="mainCP" runat="server">
    <div class="contentcontainer">
        <div class="headings altheading">
            <h2>管理员信息管理</h2>
        </div>
        <div class="contentbox">
            <table width="100%">
                <tbody>
                    <asp:Repeater ID="RepUserInfo" runat="server">
                        <HeaderTemplate>
                            <tr align="center">
                                <th>编号</th>
                                <th>管理员名</th>
                                <th>权限</th>
                                <th>允许登录
                                </th>
                                <% if (gid == 0)
                                   { %>
                                <th>
                                    操作
                                </th>
                                <% } %>
                                <th>
                                </th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr align="center">
                                <td style="width: 100px">
                                    <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                                </td>
                                <td style="width: 300px">
                                    <%# Eval("id").ToString().Equals(id.ToString())?"<b style='color:red;'>":"" %>
                                    <%# Eval("UName")%>
                                    <%#Eval("id").ToString().Equals(id.ToString()) ? "</b>" : ""%>
                                </td>
                                <td style="width: 200px">
                                    <%# Eval("id").ToString().Equals(id.ToString())?"<b style='color:red;'>":"" %>
                                    <%# Eval("Gid").ToString().Equals("0")?"超级管理员":"管理员" %>
                                    <%#Eval("id").ToString().Equals(id.ToString())?"</b>":"" %>
                                </td>
                                <td style="width: 200px">
                                     <%# bool.Parse(Eval("AllowLogin").ToString()) ? "<img src='img/icons/icon_approve.png'alt='允许'>" : "  <img src='img/icons/icon_unapprove.png' alt='不允许'>"%>
                                    <asp:CheckBox ID="ckbIsAlign" runat="server" Checked='<%# Eval("AllowLogin") %>'
                                        ToolTip='<%# Eval("id") %>' />
                                </td>
                                <% if (gid == 0)
                                   { %>
                                <td style="width: 100px">
                                    <a href='UserInformationEdit.aspx?id=<%# Eval("id") %>' title="">
                                        <img src="img/icons/icon_edit.png" alt="Edit"></a>
                                </td>
                                <% } %>
                                <td style="width: 100px">
                                    <asp:CheckBox ID="ckbChoose" runat="server" ToolTip='<%# Eval("id") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="alt">
                                <td style="width: 100px">
                                    <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                                </td>
                                <td style="width: 300px">
                                    <%# Eval("id").ToString().Equals(id.ToString())?"<b style='color:red;'>":"" %>
                                    <%# Eval("UName")%>
                                    <%#Eval("id").ToString().Equals(id.ToString()) ? "</b>" : ""%>
                                </td>
                                <td style="width: 200px">
                                    <%# Eval("id").ToString().Equals(id.ToString())?"<b style='color:red;'>":"" %>
                                    <%# Eval("Gid").ToString().Equals("0")?"超级管理员":"管理员" %>
                                    <%#Eval("id").ToString().Equals(id.ToString())?"</b>":"" %>
                                </td>
                                <td style="width: 200px">
                                       <%# bool.Parse(Eval("AllowLogin").ToString()) ? "<img src='img/icons/icon_approve.png'alt='允许'>" : "  <img src='img/icons/icon_unapprove.png' alt='不允许'>"%>
                                    <asp:CheckBox ID="ckbIsAlign" runat="server" Checked='<%# Eval("AllowLogin") %>'
                                        ToolTip='<%# Eval("id") %>' />
                                </td>
                                <% if (gid == 0)
                                   { %>
                                <td style="width: 100px">
                                    <a href='UserInformationEdit.aspx?id=<%# Eval("id") %>' title="">
                                        <img src="img/icons/icon_edit.png" alt="Edit"></a>
                                </td>
                                <% } %>
                                <td style="width: 100px">
                                    <asp:CheckBox ID="ckbChoose" runat="server" ToolTip='<%# Eval("id") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <% if (gid == 0)
               { %>
            <div class="extrabottom">
                <ul>
                    <li>
                        <img alt="Edit" src="img/icons/icon_edit.png" />
                        编辑</li>
                      <li>
                        <img alt="Approve" src="img/icons/icon_approve.png" />
                        允许</li>
                    <li>
                        <img alt="Unapprove" src="img/icons/icon_unapprove.png" />
                        不允许</li>
                </ul>
                <div class="bulkactions">
                    <asp:Button ID="Button1" runat="server" OnClick="btnSave_Click" CssClass="btn" Text="保存"
                        Width="80" />
                    <asp:Button ID="Button2" runat="server" CssClass="btn" OnClick="btnDelete_Click"
                        OnClientClick="return confirm(&quot;您确定要删除该管理员吗？&quot;)" Text="删除" Width="80" />
                </div>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>
