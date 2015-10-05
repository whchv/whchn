<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="about, App_Web_okhqlhfe" %>

<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- banner end-->
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.aspx" class="index">首页</a> <a href="about.aspx" class="gy">茶花女简介</a></div>
</div>
<div class="bg_nr">
<div class="box">
<div class="leftbox">
<div class="menu">
<h3><img src="images/about_09.jpg" /></h3>
<ul>
<li class="select"><a href="about.aspx">茶花女简介<span></span></a></li>
<li><a href="aboutculture.aspx">企业文化<span></span></a></li>
<li><a href="aboutevents.aspx">发展大事记<span></span></a></li>
</ul>
</div>
   
<uc1:top ID="top1" runat="server" />

</div>
<div class="rightbox">
<div class="t_nr">
<ul>
<li class="left"><img src="images/about_12.jpg" /></li>
<li class="right"><img src="images/about_11.jpg" /></li>
</ul>
</div>

<div class="bg_ny">
<div class="about">
<h3><img src="images/about_20.jpg" /></h3>
<p><font>武汉茶花女是从事生产和销售妇婴卫生用品及纸品的专业公司。</font></p>
<p><img src="images/jj_03.jpg" /></p>
<span><img src="images/about_32.jpg" /></span>
</div>
<div class="guanyu">
     <ul>
      <li style="padding-top:135px;"><p>武汉茶花女拥有30，000平方米的集散地，<br />可以在最短时间内服务到全国各个市场。</p>
      </li>
      <li><p>武汉茶花女有一个经验丰富的卫生用品<br />
        产品团队，一个处于同行业先进水平的<br />研究开发队伍，可覆盖全中国的销售网<br />络。</p></li>
      <li><p>武汉茶花女日生产能力为1，200，000片，<br />拥有中日合资品牌余宏精工流水线6条，<br />还有一整套的加工设备。独特的技术能<br />生产品质一流的产品，各种式样的规格<br />和压纹可以广泛满足国内外客户的需求。 </p></li>
     </ul>
    </div>
    
    <div class="guanyu1">
     <ul>
      <li><p>作为一个独立的生产商和经销商，武汉茶花女以灵活的服务方式、<br />
      客户为中心的服务理念和快捷的物流服务赢得客户赞誉。</p></li>
      <li><p>面对日益激烈的市场竞争，武汉茶花女的管理者们，敢于创新，<br />
      在传统的销售渠道基础上，又强力打造现代化的营销工具，通过<br />
      互联网平台来实现电子商务，为武汉茶花女赋予新的竞争力。武<br />
      汉茶花女开始了全国布局的步伐，未来的武汉茶花女，将在中国<br />
      的生活用纸行业占据重要的地位。</p></li>
     </ul>
    </div>
</div>  

</div>
</div>
 
</asp:Content>