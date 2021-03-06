﻿<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_JobsInformation, App_Web_yijgkayn" %>
<%@ Register Src="~/admin/usercontrol/AdminPage.ascx" TagPrefix="u1" TagName="BPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
<div class="contentcontainer">
<div class="headings altheading">
    <h2>招聘信息管理</h2>
</div>
<div class="contentbox">
    <table style="width:100%">
        <tbody>
            <asp:Repeater ID="RepNewsInfo" runat="server">
                <HeaderTemplate>
                    <tr>
                        <th>编号</th>
                        <th>标题</th>
                        <th>发布时间</th>
                        <th>是否显示</th>
                        <th>操作</th>
                        <th><asp:CheckBox ID="ckbChooseAll" runat="server" AutoPostBack="true" OnCheckedChanged="ckbChooseAll_OnCheckedChanged" />全选</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td style="width: 100px"><asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal></td>

                        <td style="width: 300px"><%# Eval("title")%></td>
                        <td style="width: 150px"><%# Eval("Publishtime") %></td>

                        <td style="width: 100px">
                            <%# bool.Parse(Eval("Isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                            <asp:CheckBox ID="ckbIsshow" Checked='<%# Eval("Isshow") %>' runat="server" />
                        </td>

                        <td style="width: 100px">
                            <a href='JobsInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                            <a href="#" title="" onclick="showInfo(0,'<%# Eval("isshow") %>',3,'<%# Eval("id") %>','招聘信息')"><img src="img/icons/icon_approve.png" alt="Approve"></a> 
                            <a href="#" onclick="showInfo(1,'<%# Eval("isshow") %>',3,'<%# Eval("id") %>','招聘信息')" title=""><img src="img/icons/icon_unapprove.png" alt="Unapprove"></a> 
                            <a href="#" title="" onclick="delInfo(-8,<%# Eval("id") %>,' 招聘信息')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
                        </td>

                        <td style="width: 100px"><asp:CheckBox ID="ckbChoose" runat="server" /></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="alt">
                        <td style="width: 100px"><asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal></td>

                        <td style="width: 300px"><%# Eval("title")%></td>
                        <td style="width: 150px"><%# Eval("Publishtime") %></td>

                        <td style="width: 100px">
                            <%# bool.Parse(Eval("Isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                            <asp:CheckBox ID="ckbIsshow" Checked='<%# Eval("Isshow") %>' runat="server" />
                        </td>

                        <td style="width: 100px">
                            <a href='JobsInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                            <a href="#" title="" onclick="showInfo(0,'<%# Eval("isshow") %>',3,'<%# Eval("id") %>','招聘信息')"><img src="img/icons/icon_approve.png" alt="Approve"></a> 
                            <a href="#" onclick="showInfo(1,'<%# Eval("isshow") %>',3,'<%# Eval("id") %>','招聘信息')" title=""><img src="img/icons/icon_unapprove.png" alt="Unapprove"></a> 
                            <a href="#" title="" onclick="delInfo(-8,<%# Eval("id") %>,' 招聘信息')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
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
            <li><img alt="Approve" src="img/icons/icon_approve.png" />显示</li>
            <li><img alt="Unapprove" src="img/icons/icon_unapprove.png" />不显示</li>
            <li><img alt="Delete" src="img/icons/icon_delete.png" />删除</li>
        </ul>
        <div class="bulkactions">
            <asp:Button ID="Button2" runat="server" OnClick="btnSave_Click" Text="保存" CssClass="btn"   Width="80" />
            <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="btnDelete_Click" Width="80" OnClientClick="return confirm(&quot;您确定要删除吗？\r\n此操作将删除所选中的信息！&quot;)" Text="删除" />
        </div>
    </div>
        <u1:BPage ID="bpage" runat="server" />
</div>
</div>
</asp:Content>