<%@ control language="C#" autoeventwireup="true" inherits="usercontrol_Meta, App_Web_kw5qqjs0" %>
<asp:Repeater ID="RepWebSizeInfo" runat="server">
<ItemTemplate>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Description" content="<%#Eval("WebDescription") %>" />
<meta name="Keywords" content="<%# Eval("WebKeyWord") %>" />
<meta name="author" content="<%#Eval("WebTeam") %>,<%# Eval("WebEmail") %>" />
<meta name="build" content="<%# Eval("WebBuildTime") %>" />
<meta name="copyright" content="<%# Eval("WebCopyRight") %>" />
<meta name="Reply-to" content="<%# Eval("Email") %>" />
<meta name="robots" content="all" />
<link rel="start" href="http://www.infarts.com/" title="Home" />
<link rel="shortcut icon" type="image/ico" href="/favicon.ico" />
</ItemTemplate>
</asp:Repeater>