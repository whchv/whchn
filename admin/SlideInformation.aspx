<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_SlideInfoInformation, App_Web_yijgkayn" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" Runat="Server">
    <div class="contentcontainer">
    <div class="headings altheading">
        <h2>幻灯片信息管理</h2>
    </div>
    <div class="contentbox">
        <table width="100%">
            <tbody>
                <asp:Repeater ID="RepSlideInfo" runat="server">
                    <HeaderTemplate>
                        <tr align="center">
                            <th>编号</th>
                            <th>图片</th>
                            <th>链接地址</th>
                            <th>排序值(数字)</th>
                            <th>是否显示</th>
                            <th>操作</th>
                            <th><asp:CheckBox ID="ckbChooseAll" runat="server" AutoPostBack="true" OnCheckedChanged="ckbChooseAll_OnCheckedChanged" />全选</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width: 100px">
                                <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                            </td>

                            <td style="width: 200px">
                                <div class="pad">
                                    <div class="icon"><img src="img/icons/icon_tb.png" /></div>
                                    <div class="preview"><img width="1058" height="256"  src="<%# Eval("photo") %>" /></div>
                                </div>
                            </td>

                            <td style="width: 200px">
                                <a target="_blank" href='<%#Eval("Link") %>'><%#Eval("Link") %></a>
                            </td>

                            <td style="width: 200px">
                                <asp:TextBox ID="txtSort" runat="server" CssClass="inputbox" Text='<%# Eval("sort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
                            </td>

                            <td style="width: 100px">
                                <%# bool.Parse(Eval("isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "  <img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                                <asp:CheckBox ID="Ck_Isshow" Checked='<%# Eval("isshow") %>' runat="server" />
                            </td>

                            <td style="width: 200px">
                                <a href='SlideInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                                <a href="#" title="" onclick="delInfo(-6,<%# Eval("id") %>,'幻灯片信息')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
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

                            <td style="width: 200px">
                                <div class="pad">
                                    <div class="icon"><img src="img/icons/icon_tb.png" /></div>
                                    <div class="preview"><img width="1058" height="256"  src="<%# Eval("photo") %>" /></div>
                                </div>
                            </td>

                            <td style="width: 200px">
                                <a target="_blank" href='<%#Eval("Link") %>'><%#Eval("Link") %></a>
                            </td>

                            <td style="width: 200px">
                                <asp:TextBox ID="txtSort" runat="server" CssClass="inputbox" Text='<%# Eval("sort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
                            </td>

                            <td style="width: 100px">
                                <%# bool.Parse(Eval("isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "  <img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                                <asp:CheckBox ID="Ck_Isshow" Checked='<%# Eval("isshow") %>' runat="server" />
                            </td>

                            <td style="width: 200px">
                                <a href='SlideInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                                <a href="#" title="" onclick="delInfo(-6,<%# Eval("id") %>,'幻灯片信息')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
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
                <li><img alt="Edit" src="img/icons/icon_edit.png" />编辑</li>
                <li><img alt="Approve" src="img/icons/icon_approve.png" />显示</li>
                <li><img alt="Unapprove" src="img/icons/icon_unapprove.png" />不显示</li>
            </ul>
            <div class="bulkactions">
                <asp:Button ID="Button2" runat="server" OnClick="btnSave_Click" Text="保存" CssClass="btn" Width="80" />
                <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="btnDelete_Click" Width="80" OnClientClick="return confirm(&quot;您确定要删除吗？\r\n此操作将删除该幻灯片信息！&quot;)" Text="删除" />
            </div>
        </div>
    </div>
</div>
</asp:Content>