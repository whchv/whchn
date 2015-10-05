<%@ control language="C#" autoeventwireup="true" inherits="admin_usercontrol_Left, App_Web_ghtwk1bf" %>
<!-- 左侧边 登录 、 导航 -->
<div id="leftside">
    <div class="user">
        <img src="img/avatar.png" width="44" height="44" class="hoverimg" alt="Avatar" />
        <p style="padding-bottom: 10px;">
            登录身份:<b class="username"><%=un %></b></p>
        <% if (gid == 0)
           {%>
        <p class="userbtn">
            <a href="UserInformationEdit.aspx?id=<%=id %>" title="">Edit</a></p>
        <%}%>
        <p class="userbtn">
            <a href="Close.aspx" title="">Layout</a></p>
    </div>

    <ul id="nav">

        <li><a class="<%=expanded1 %> heading">站点信息管理</a>
            <ul class="navigation" style="<%=none1 %>">
                <li class="<%=selected11 %>"><a href="WebSiteInformation.aspx">站点信息管理</a></li>
            </ul>
        </li>

        <li><a class="<%=expanded0 %> heading">站内搜索</a>
            <ul class="navigation" style="<%=none0 %>">
                <li class="<%=selected01 %>"><a href="SearchInformation.aspx">站内搜索</a></li>
            </ul>
        </li>
        
        <li><a class="<%=expanded2 %> heading">新闻信息管理</a>
            <ul class="navigation" style="<%=none2%>">
                <li class="<%=selected21 %>"><a href="NewsInformation.aspx">新闻信息管理</a></li>
                <li class="<%=selected22 %>"><a href="newsinformationadd.aspx">新增新闻信息</a></li>
                <li class="<%=selected23 %>"><a href="NewsTopInformation.aspx?tid=1">新闻咨询首页推荐管理</a></li>
                <li class="<%=selected24 %>"><a href="NewsTopInformation.aspx?tid=2">市场活动首页推荐管理</a></li>
                <li class="<%=selected25 %>"><a href="NewsTopInformation.aspx?tid=3">客户见证首页推荐管理</a></li>
                <li class="<%=selected26 %>"><a href="NewsTopInformation.aspx?tid=4">我在茶花女首页推荐管理</a></li>
            </ul>
        </li>
        
        <li><a class="<%=expanded3 %> heading">产品信息管理</a>
            <ul class="navigation" style="<%=none3 %>">
                <li class="<%=selected31 %>"><a href="ProductInformation.aspx">产品信息管理</a></li>
                <li class="<%=selected32 %>"><a href="ProductInformationAdd.aspx">新增产品信息</a></li>
                <li class="<%=selected33 %>"><a href="ProductTypeInformation.aspx">产品类别信息管理</a></li>
                <li class="<%=selected34 %>"><a href="ProductIndexTypeInformation.aspx">产品首页类别信息管理</a></li>
                <li class="<%=selected35 %>"><a href="IndexInformation.aspx?t=p">产品首页推荐信息管理</a></li>
                <li class="<%=selected36 %>"><a href="ProductTopInformation.aspx?tid=1"><%=Title[0] %>系列信息推荐</a></li>
                <li class="<%=selected37 %>"><a href="ProductTopInformation.aspx?tid=2"><%=Title[1]%>系列信息推荐</a></li>
                <li class="<%=selected38 %>"><a href="ProductTopInformation.aspx?tid=3"><%=Title[2]%>系列信息推荐</a></li>
                <li class="<%=selected39 %>"><a href="ProductTopInformation.aspx?tid=4"><%=Title[3]%>系列信息推荐</a></li>
            </ul>
        </li>
        
        <li><a class="<%=expanded4 %> heading">发展大事记信息管理</a>
            <ul class="navigation" style="<%=none4 %>">
                <li class="<%=selected41 %>"><a href="EventsInformation.aspx">发展大事记信息管理</a></li>
                <li class="<%=selected42 %>"><a href="EventsInformationAdd.aspx">新增发展大事记信息</a></li>
            </ul>
        </li>

        <li><a class="<%=expanded13 %> heading">招聘信息管理</a>
            <ul class="navigation" style="<%=none13 %>">
                <li class="<%=selected131 %>"><a href="JobsInformation.aspx">招聘信息管理</a></li>
                <li class="<%=selected132 %>"><a href="JobsInformationAdd.aspx">新增招聘信息</a></li>
            </ul>
        </li>

        <li><a  class="<%=expanded5 %> heading">地区联系人信息管理</a>
            <ul class="navigation" style="<%=none5 %>">
                <li class="<%=selected51 %>"><a href="AreaContactInformation.aspx">地区联系人信息管理</a></li>
                <li class="<%=selected52 %>"><a href="AreaContactInformationAdd.aspx">新增地区联系人信息</a></li>
            </ul>
        </li>

        <li><a  class="<%=expanded6 %> heading">联系我们信息管理</a>
            <ul class="navigation" style="<%=none6 %>">
                <li class="<%=selected61 %>"><a href="ContactUsInformation.aspx">联系我们信息管理</a></li>
            </ul>
        </li>
        
        <li><a class="<%=expanded7 %> heading">页面幻灯片信息管理</a>
            <ul class="navigation" style="<%=none7 %>">
                <li class="<%=selected71 %>"><a href="SlideInformation.aspx">页面幻灯片信息管理</a></li>
                <li class="<%=selected72 %>"><a href="SlideInformationAdd.aspx">新增页面幻灯片信息</a></li>
            </ul>
        </li>

        <li><a class="<%=expanded11 %> heading">友情链接信息管理</a>
            <ul class="navigation" style="<%=none11 %>">
                <li class="<%=selected111 %>"><a href="LinkInformation.aspx">友情链接信息管理</a></li>
                <li class="<%=selected112 %>"><a href="LinkInformationAdd.aspx">新增友情链接信息</a></li>
            </ul>
        </li>

        <li><a  class="<%=expanded12 %> heading">板块图片信息管理</a>
            <ul class="navigation" style="<%=none12 %>">
                <li class="<%=selected121 %>"><a href="MenuPhotoInformation.aspx">板块图片信息管理</a></li>
            </ul>
        </li>
        
        <li><a  class="<%=expanded8 %> heading">前台页数控制管理</a>
            <ul class="navigation" style="<%=none8 %>">
                <li class="<%=selected81 %>"><a href="PageSizeInformation.aspx">前台页数控制管理</a></li>
            </ul>
        </li>
        
        <li><a class="<%=expanded9 %> heading">数据库备份管理</a>
            <ul class="navigation" style="<%=none9 %>">
                <li class="<%=selected91 %>"><a href="DataExport.aspx">数据库备份管理</a></li>
            </ul>
        </li>

        <li><a class="<%=expanded10 %> heading" >管理员信息管理</a>
            <ul class="navigation"  style="<%=none10 %>">
                <li class="<%=selected101 %>"><a href="UserInformation.aspx" title="">管理员信息管理</a></li>
                <% if (gid == 0)
                   { %>
                <li class="<%=selected102 %>"><a href="UserInformationAdd.aspx" title="">添加管理员信息</a></li>
                <% } %>
            </ul>
        </li>
    </ul>
</div>
<!-- 左侧边 登录 、 导航 End -->