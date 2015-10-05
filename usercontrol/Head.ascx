<%@ control language="C#" autoeventwireup="true" inherits="usercontrol_Head, App_Web_kw5qqjs0" %>
<div class="head">
<div class="header">
<div class="logo">
<ul>
<li class="left"><a><img src="images/logo.jpg" /></a></li>
<li class="right" style="padding-top:24px;"><a href="http://d.whchn.com/drp/login" target="_blank" title="茶花女DRP系统"><img src="images/sy_06.jpg" /></a>
<a href="http://121.40.102.49/drp/login" target="_blank" title="茶花女DRP系统" style="display:none">备用地址</a>
</li>
</ul>
</div>
<div class="nav">
<ul>
<li><a href="index.aspx">首页<span>HOME</span></a></li>
<li><a href="about.aspx">关于茶花女<span>ABOUT</span></a></li>
<li><a href="news.aspx">新闻中心<span>NEWS</span></a></li>
<li><a href="brand.aspx">品牌与产品<span>BRAND</span></a></li>
<li><a href="service.aspx">服务与支持<span>SERVICE</span></a></li>
<li><a href="training.aspx">加入茶花女<span>JOBS</span></a></li>
</ul>
</div>
</div>
</div>
<script type="text/javascript" language="javascript">
    $(function () {
        var href = window.location.href.split('/')[window.location.href.split('/').length - 1].substr(0, 3).toLowerCase();
        if (href.length > 0) {
            $(".nav ul li").find("a[href^=" + href + "]:first").parent("li").addClass("select");
        } else {
            $(".nav ul li").find("a[href^='index']").parent("li").addClass("select");
        }
    });
</script>
<%if (!IsIndex)
  {%>
<div class="banner_ny">
<div><img src="<%=Photo %>" width="1680" height="277" /></div>
</div>  
<%} %>
