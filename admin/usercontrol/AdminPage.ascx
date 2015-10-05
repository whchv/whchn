<%@ control language="C#" autoeventwireup="true" inherits="admin_usercontrol_AdminPage, App_Web_ghtwk1bf" %>

<ul class="pagination">
  <li class="text">
  <%if (PageIndex!=1)
    {%>
      <a title="第一页" <%="href=?Tid="+Tid+"&PageIndex=1"+ words%>>Frist</a>
    <%}
    else
        { %>
          Frist
        <% } %>
  </li>
    <li class="text">
    
     <% if (PageIndex != 1)
        { %>
        
      <a <%= PageIndex<=1?"":"href=?Tid="+Tid+"&PageIndex="+(PageIndex-1) +words%>
        title="上一页">Previous</a>
        <% }
        else
        { %>
          Previous
        <% } %>
        </li>
    <asp:Repeater ID="RepPage" runat="server">
        <ItemTemplate>
            <li class="<%#Eval("style") %>"><a href="?Tid=<%=Tid %>&PageIndex=<%#Eval("PageIndex") +words%>" >
                <%#Eval("PageIndex")%></a></li>
        </ItemTemplate>
    </asp:Repeater>
    <li class="text">
      <% if (PageIndex != PageCount)
         { %>
      <a <%= PageIndex>=PageCount?"":"href=?Tid="+Tid+"&PageIndex="+(PageIndex+1)+words %>
        title="下一页">Next</a>
        <% }
         else
         { %>
             Next
        <% } %>
        </li>
  <li class="text">
  <%if (PageIndex!=PageCount)
    {%>
      <a title="最后一夜" <%="href=?Tid="+Tid+"&PageIndex="+PageCount+words %>>Frist</a>
    <%}
    else
        { %>
          Last
        <% } %>
  </li>
</ul>
<div style="clear: both;"></div>