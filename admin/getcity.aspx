<%@ page language="C#" autoeventwireup="true" inherits="admin_getcity, App_Web_yijgkayn" %>
<select id="ctl00_mainCP_DDLCity" name="ctl00$mainCP$DDLCity" style="height:30px;width:15%;">
    <asp:Repeater ID="RepInfo" runat="server">
    <ItemTemplate>
    <option value="<%#Eval("id") %>"><%#Eval("title") %> </option>
    </ItemTemplate>
    </asp:Repeater>
</select>
