<%@ Control Language="C#" ClassName="Js" %>

<script src="scripts/jquery.tools.min.js" type="text/javascript"></script>

<!--[if IE 6]>
    <script type='text/javascript' src='scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]-->

<script type="text/javascript">

    $(function () {
        $(".pad").hover(function () {
            $(this).find(".preview").show();
        }, function () {
            $(this).find(".preview").hide();
        });
    });
	
</script>

 <script type="text/javascript">
     function delInfo(t, id, o) {
         if (window.confirm("你确定要删除该篇" + o + "？")) {
             $.post("DeleteInfo.ashx", { Action: "post", t: t, id: id }, function (data, textStatus) {
                 if (textStatus == "success") {
                     if (data == 1) {
                         alert("删除" + o + "成功！");
                     }
                     else {
                         alert("删除" + o + "失败！");
                     }
                     window.location.reload();
                 }
             });
         }
     }

     function showInfo(d, o, t, id, m) {
         var fg = false; s = "";
         if (d == 0 && o == "False") {
             fg = true;
             s = "True";
         }

         if (d == 1 && o == "True") {
             fg = true;
             s = "False";
         }
         if (fg) {
             $.post("ShowInfo.ashx", { Action: "post", t: t, id: id, s: s }, function (data, textStatus) {
                 if (textStatus == "success") {
                     if (data == 1) {
                         alert("更新" + m + " 是否显示 成功！");
                     }
                     else {
                         alert("更新" + m + " 是否显示 失败！");
                     }
                     window.location.reload();
                 }
             });
         }
     }
</script>