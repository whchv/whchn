<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_ProductIndexTypeInformation, App_Web_yijgkayn" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" Runat="Server">
      <div class="contentcontainer">
        <div class="headings altheading">
            <h2>产品首页类别信息管理</h2>
        </div>
        <div class="contentbox">
            <table width="100%">
                <tbody>
                    <asp:Repeater ID="RepSlideInfo" runat="server">
                        <HeaderTemplate>
                            <tr align="center">
                                <th>编号</th>
                                <th>板块名称</th>
                                <th>标题</th>
                                <th>图片</th>
                                <th>操作</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="width: 50px">
                                    <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                                </td>

                                <td style="width: 100px">
                                    <%#Eval("TypeTitle")%>
                                </td>

                                <td style="width: 100px">
                                    <%#Eval("title") %>
                                </td>

                                <td style="width: 50px">
                                    <div class="pad">
                                        <div class="icon"><img src="img/icons/icon_tb.png" /></div>
                                        <div class="preview"><img width="1133" height="186"  src="<%# Eval("photo") %>" /></div>
                                    </div>
                                </td>

                                <td style="width: 200px">
                                    <a href='ProductIndexTypeInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="alt">
                                <td style="width: 50px">
                                    <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                                </td>

                                <td style="width: 100px">
                                    <%#Eval("TypeTitle")%>
                                </td>


                                <td style="width: 100px">
                                    <%#Eval("title") %>
                                </td>

                                <td style="width: 50px">
                                    <div class="pad">
                                        <div class="icon"><img src="img/icons/icon_tb.png" /></div>
                                        <div class="preview"><img width="1133" height="186"  src="<%# Eval("photo") %>" /></div>
                                    </div>
                                </td>

                                <td style="width: 200px">
                                    <a href='ProductIndexTypeInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <div class="extrabottom">
                 <ul>
                    <li><img alt="Edit" src="img/icons/icon_edit.png" />编辑</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>