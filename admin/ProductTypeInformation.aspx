<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_ProductTypeInformation, App_Web_yijgkayn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
<div class="contentcontainer">
<div class="headings altheading">
    <h2>产品类型信息管理</h2>
</div>
<div class="contentbox">
    <table width="100%">
        <tbody>
            <asp:Repeater ID="RepTypeInfo" runat="server">
                <HeaderTemplate>
                    <tr>
                        <th>编号</th>
                        <th>所属类别</th>
                        <th>类型名</th>
                        <th>英文类型名</th>
                        <th>排序值( 数字 )</th>
                        <th>是否显示</th>
                        <th>操作</th>
                        <th><asp:CheckBox ID="ckbChooseAll" runat="server" AutoPostBack="true" OnCheckedChanged="ckbChooseAll_OnCheckedChanged" />全选</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr align="center">
                        <td style="width: 100px">
                            <asp:Literal ID="litId" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                        </td>

                        <td style="width: 150px">
                            <a href="ProductTypeInformation.aspx?tid=<%#Eval("tid")%>"><%# Eval("type")%></a>&nbsp;|&nbsp;<a href="ProductTypeInformation.aspx">ALL</a>
                        </td>  

                        <td style="width: 200px">
                            <%# Eval("title") %>
                        </td>
                        <td style="width: 200px">
                            <%# Eval("entitle") %>
                        </td>
                        <td style="width: 200px">
                            <asp:TextBox ID="txtSort" runat="server" CssClass="inputbox" Text='<%# Eval("sort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
                        </td>
                        <td style="width: 100px">
                            <%# bool.Parse(Eval("isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                            <asp:CheckBox ID="Ck_Isshow" Checked='<%# Eval("isshow") %>' runat="server" />
                        </td>
                        <td style="width: 100px">
                            <a href='ProductTypeInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                            <a href="#" title="" onclick="delInfo(1,<%# Eval("id") %>,'产品类型')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
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
                        <td style="width: 150px">
                            <a href="ProductTypeInformation.aspx?tid=<%#Eval("tid")%>"><%# Eval("type")%></a>&nbsp;|&nbsp;<a href="ProductTypeInformation.aspx">ALL</a>
                        </td>  
                        <td style="width: 200px">
                            <%# Eval("title") %>
                        </td>
                        <td style="width: 200px">
                            <%# Eval("entitle") %>
                        </td>
                        <td style="width: 200px">
                            <asp:TextBox ID="txtSort" runat="server" CssClass="inputbox" Text='<%# Eval("sort") %>' MaxLength="9" BorderStyle="Groove" Width="50%"></asp:TextBox>
                        </td>
                        <td style="width: 100px">
                            <%# bool.Parse(Eval("isshow").ToString()) ? "<img src='img/icons/icon_approve.png' alt='显示'>" : "<img src='img/icons/icon_unapprove.png' alt='不显示'>"%>
                            <asp:CheckBox ID="Ck_Isshow" Checked='<%# Eval("isshow") %>' runat="server" />
                        </td>
                        <td style="width: 100px">
                            <a href='ProductTypeInformationEdit.aspx?id=<%# Eval("id") %>' title=""><img src="img/icons/icon_edit.png" alt="Edit"></a>
                            <a href="#" title="" onclick="delInfo(1,<%# Eval("id") %>,'产品类型')"><img src="img/icons/icon_delete.png" alt="Delete"></a>
                        </td>
                        <td style="width: 100px">
                            <asp:CheckBox ID="ckbChoose" runat="server" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
            <asp:Panel ID="PanType" runat="server" Visible="false">
                <tr>
                    <td style="width: 100px">
                        系统产生
                    </td>

                    <td style="width: 150px">
                        <asp:DropDownList ID="ddltype" runat="server">
                        </asp:DropDownList>
                    </td>

                    <td style="width: 200px">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" BorderStyle="Groove" Width="95%" MaxLength="50"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="类型名不能为空！" Display="Dynamic" ControlToValidate="txtTitle" ValidationGroup="x"></asp:RequiredFieldValidator>
                    </td>

                    <td style="width: 200px">
                        <asp:TextBox ID="txtEntitle" runat="server" CssClass="inputbox" BorderStyle="Groove" Width="95%" MaxLength="50"></asp:TextBox>
                    </td>

                    <td style="width: 200px">
                        <asp:TextBox ID="txtSort" runat="server" CssClass="inputbox" Text="0" BorderStyle="Groove" Width="50%" MaxLength="9"></asp:TextBox><br />
                    </td>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSort" ErrorMessage="请填写数字" ValidationExpression="(0|[1-9])([0-9])*(\.{0,1})([0-9])*">
                    </asp:RegularExpressionValidator>

                    <td style="width: 100px">
                        <asp:CheckBox ID="ckbChooseType" runat="server" Text="显示信息" Checked="true" />
                    </td>

                    <td style="width: 100px">
                        <asp:Button ID="btnAddOk" runat="server" Text="确定添加" CssClass="btnalt" OnClick="btnAddOk_Click" ValidationGroup="x" />
                    </td>
                </tr>
            </asp:Panel>
        </tbody>
    </table>
    <div class="extrabottom">
            <ul>
            <li><img alt="Edit" src="img/icons/icon_edit.png" />编辑</li>
            <li><img alt="Approve" src="img/icons/icon_approve.png">显示</li>
            <li><img alt="Unapprove" src="img/icons/icon_unapprove.png">不显示</li>
        </ul>
        <div class="bulkactions">
            <asp:DropDownList ID="DDL_Type" runat="server" onselectedindexchanged="DDLType_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" OnClick="btnSave_Click" Text="保存" CssClass="btn" Width="80" />
            <asp:Button ID="Button3" runat="server" OnClick="btnAdd_Click" Text="添加" CssClass="btn" Width="80" />
            <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="btnDelete_Click" Width="80" OnClientClick="return confirm(&quot;您确定要删除吗？\r\n此操作将删除该类型下的所有信息！&quot;)" Text="删除" />
        </div>
    </div>
</div>
</div>
</asp:Content>