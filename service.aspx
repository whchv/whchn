<%@ page language="C#" masterpagefile="~/master/MasterPage.master" autoeventwireup="true" inherits="service, App_Web_okhqlhfe" %>
<%@ Register src="~/usercontrol/top.ascx" tagname="top" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg_color">
<div class="title_nr">当前位置： <a href="index.aspx" class="index">首页</a> <a href="service.aspx" class="gy">中国销售网络</a></div>
</div>
<div class="bg_nr">
<div class="box">
<div class="leftbox">
<div class="menu">
<h3><img src="images/fw_06.jpg" /></h3>
<ul>
<li class="select"><a href="service.aspx">中国销售网络<span></span></a></li>
</ul>
</div>

<uc1:top ID="top1" runat="server" />
</div>
<div class="rightbox">
<div class="t_nr">
<ul>
<li class="left"><img src="images/fw_09.jpg" /></li>
<li class="right"><img src="images/about_11.jpg" /></li>
</ul>
</div>

<div class="bg_ny">
<div class="service_f">
<span><img src="images/fw_13.jpg" /></span>
<span><img src="images/fw_17.jpg" /></span>
</div>
<div class="fw_bg">
<ul>
<li class="fw1"><strong><span>01</span> 武汉茶花女卫生用品有限公司</strong>
<p>武汉市东西湖区慈惠工业园惠安大道27号</p>
</li>
<li class="fw2"><strong><span>02</span> 宜昌舒云卫生用品有限公司</strong>
<p>宜昌市伍家岗区前坪街29号（湖北三峡民<br />营科技园）</p>
</li>
<li class="fw3"><strong><span>03</span> 荆门茶花女卫生用品有限公司</strong>
<p>荆门市东宝区茶花女工业园</p>
</li>
</ul>
</div>

<div class="map">
<object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="620" height="636">
<param name="movie" value="map3.swf" />
<param name="quality" value="high" />
<param name="wmode" value="opaque" />
<param name="swfversion" value="6.0.65.0" />
<!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
<param name="expressinstall" value="Scripts/expressInstall.swf" />
<!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
<!--[if !IE]>-->
<object type="application/x-shockwave-flash" data="map3.swf" width="620" height="636">
<!--<![endif]-->
<param name="quality" value="high" />
<param name="wmode" value="opaque" />
<param name="swfversion" value="6.0.65.0" />
<param name="expressinstall" value="Scripts/expressInstall.swf" />
<!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
<div>
<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
<p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
</div>
<!--[if !IE]>-->
</object>
<!--<![endif]-->
</object>
</div>
   
<div class="diqu">
<h3 id="shenfen"></h3>
<div class="ls_bg1"></div>
<div class="dq_nr">
<ul id="x1">

</ul>
</div>
</div>

<div class="dq_xx">
<h3><img src="images/fw_36.jpg" /></h3> 
<span id="Area">

</span> 
</div>

</div>  
</div>
</div>
<script type="text/javascript">
    function FlashRun(id) {
        $(function () {
            $.post("_code/display.ashx", { action: "post", id: id }, function (data, s) {
                var datas = eval('(' + data + ')');
                var html = "";
                $("#shenfen").html(datas[0]["pname"]);
                for (var i = 0; i < datas.length; i++) {
                    html += "<li class=\"dq_ys2\"><a onclick=\"getinfo(this," + datas[i]["id"] + ")\" class=\"" + datas[i]["style"] + "\">" + datas[i]["name"] + "片区</a></li>";
                }
                $("#x1").html(html);
                getinfo(datas[0]["style"], datas[0]["id"]);
            });
        });
    }

function getinfo(o, id) {
    $(function () {
        $(".blue").removeClass("blue");
        $(o).addClass("blue");

        $.post("_code/getArea.ashx", { action: "post", id: id }, function (data, s) {
            var datas = eval('(' + data + ')');
            var html = "";
            for (var i = 0; i < datas.length; i++) {
                html += "<p class=\"dq1\">联系地区：<font>" + datas[i]["cname"] + "</font></p><p class=\"dq2\">联系人：<font>" + datas[i]["name"] + "</font></p><p class=\"dq3\">联系电话：<b>" + datas[i]["phone"] + "</b></p>";
            }
            $("#Area").html(html);
        });
    });
}
</script>
</asp:Content>