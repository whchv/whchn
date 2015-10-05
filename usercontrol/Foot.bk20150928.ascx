<%@ control language="C#" autoeventwireup="true" inherits="usercontrol_Foot, App_Web_kw5qqjs0" %>
 
<div class="links"><span><a class="return_top">TOP</a></span>友情链接</div>
<div class="lins_list czy">
<ul style="display:none">
    <asp:Repeater ID="RepLinkInfo" runat="server">
    <ItemTemplate>
<li <%#Eval("style") %>><a href="<%#Eval("LinkUrl") %>" target="_blank"><img src="<%#Eval("Photo") %>" /></a></li>
    </ItemTemplate>
    </asp:Repeater>
</ul>
<!--友情链接调整为纯文本形式.曹志赟.20150806-->
<ul class="czy-footer"> 
	<li><a href="http://whchn2011.cn.alibaba.com/" target="_blank">茶花女诚信通</a></li>
	<li><a href="http://shuyun2011.cn.alibaba.com/" target="_blank">舒云诚信通</a></li>
	<li><a href="https://shop35730633.taobao.com/" target="_blank">茶花女淘宝店</a></li>
	<li><a href="https://bbwhite.tmall.com/" target="_blank">bbwhite天猫店</a></li>
	<li><a href="https://nuevedeer.taobao.com/" target="_blank">九色鹿淘宝店</a></li>
	<li><a href="http://myimy.jd.com/" target="_blank">马应龙京东店</a></li>
	<li><a href="https://mayinglongdk.tmall.com" target="_blank">马应龙天猫店</a></li>
	<li><a href="https://shop129931135.taobao.com/" target="_blank">贝芘卡琪淘宝店</a></li>
</ul>
<ul class="czy-footer"> 
	<li><a href="http://www.mylhealth.com" target="_blank">湖北马应龙护理品有限公司</a></li>
	<li><a href="http://www.babykhaki.com" target="_blank">武汉贝舒乐卫生用品有限公司</a></li>
</ul>
</div>
<!--友情链接 end-->
</div>
<div class="foot">
<div class="copyright">
<dl>
<dt><a href="index.aspx"><img src="images/logo_03.jpg" /></a></dt>
<dd>
<p class="ksdh">
<a href="index.aspx">首 页</a>
<a href="about.aspx">关于茶花女</a>
<a href="news.aspx">新闻中心</a>
<a href="brand.aspx">品牌与产品</a>
<a href="service.aspx">服务与支持</a>
<a href="training.aspx" style="background:none;">加入茶花女</a></p>
<div class="wb_a">
<div class="icon">
<a href="<%=Wangwang %>" target="_blank"><img src="images/sy_119.jpg" /></a>&nbsp;
<a href="<%=Weibo %>" target="_blank"><img src="images/sy_121.jpg" /></a></div>
</div>
<p class="bq">Copyright 2001-<%=DateTime.Now.Year %> 武汉茶花女卫生用品有限公司版权所有 备案号: <%=WebCert %> <%=WebMasterStat %></p>
</dd>
</dl>
</div>
</div>
<%=TQInfo %>