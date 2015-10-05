<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_SlideInformationAdd, App_Web_yijgkayn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="JsMain" Runat="Server">
    <link href="css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.Jcrop.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
           $("#ctl00_mainCP_imgExtr").Jcrop(
           {  
              onSelect:updatePreview,
              setSelect:   [ 0, 0, <%=w %>, <%=h %>],
              aspectRatio: <%=w %>/<%=h %>
           });
        });

        function updatePreview(c) {
            var box=document.getElementById("box");
            box.style.width=c.w+"px";
            box.style.height=c.h+"px";
            box.style.background = "url('<%=extr %>') no-repeat scroll -"+c.x+"px -"+c.y+"px";
            box.innerHTML ="宽:"+c.w;
            box.innerHTML +=",高:"+c.h;
            document.getElementById("ctl00_mainCP_X").value=c.x;
            document.getElementById("ctl00_mainCP_Y").value=c.y;
            document.getElementById("ctl00_mainCP_W1").value=c.w;
            document.getElementById("ctl00_mainCP_H1").value=c.h;
         }; 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCP" runat="server">
    <div class="contentcontainer">
        <div class="headings altheading">
         <h2>新增幻灯片信息</h2>
        </div>
        <div class="contentbox state">  
        <div class="clear"></div>

        <h3>图片剪裁：</h3>
        <asp:Image ID="imgExtr" runat="server"  Visible="false"/><br />
        
        <asp:TextBox ID="txtExtr" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox><br />
        <asp:FileUpload ID="fuextr" runat="server" /><img alt="Loading" src="img/loading.gif" alt="" />
        <asp:Button ID="btnExtr" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" OnClick="btnExtr_Click" /><br />
        <strong>上传的裁剪大图的尺寸必须大于  1680 X 408 ,否则裁剪的图片将会变形 (高/宽 单位:像素)</strong>

        <div id="box" style="float:left;"></div>
        <div id="success" style="margin-left:600px;">
        <style type="text/css">
        .st {  font-weight:bold; color:Red;}
        </style>
        <asp:Label CssClass="st" runat="server"  ID="ST"></asp:Label><br />
        <asp:Image ID="CutSuccess" runat="server" Visible="false" /></div>
        <div class="clear"></div>
         
        <asp:RadioButtonList ID="RBLPhoto" runat="server" AutoPostBack="true" RepeatLayout="Flow" RepeatDirection="Horizontal">
        <asp:ListItem Text="幻灯片大图" Value="0" Selected="True"></asp:ListItem>
        <asp:ListItem Text="幻灯片小图" Value="1"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:HiddenField ID="X" runat="server" Value="0" />
        <asp:HiddenField ID="Y" runat="server" Value="0" />
        <asp:HiddenField ID="W1" runat="server" Value="0" />
        <asp:HiddenField ID="H1" runat="server" Value="0" />
        <asp:Button ID="SaveImg" runat="server" Text="裁剪并保存图片" OnClick="btn_SaveImg" CssClass="btnalt" />
        <strong>tips:图片剪裁功能 :<em>先上传一张大图，然后进行剪裁。大图尺寸大于下方将要上传图片的宽高</em></strong>
        <div class="clear"></div>

        <h3>是否显示：</h3>
        <asp:CheckBox ID="ckbIsShow" runat="server" Checked="true" Text="显示信息" />
        <strong>tips:是否显示</strong>
        <div class="clear"></div>

        <h3>幻灯片大图：</h3>
        <asp:Image ID="imgbig" runat="server" Visible="False" Width="1680" Height="408" />
        <asp:TextBox ID="txtBig" runat="server" CssClass="inputbox" Width="90%"></asp:TextBox>
        <asp:FileUpload ID="FuBig" runat="server" />
        <asp:Button ID="btnBig" runat="server" Text="上传" CssClass="btnalt" onclick="btnBig_Click" />
        <strong>tips:首页幻灯片大图 大小为 1680 X 408 (高/宽 单位:像素)</strong>
        <div class="clear"></div>

        <h3>幻灯片小图：</h3>
        <asp:Image ID="imgSmall" runat="server" Visible="False" Width="45" Height="46" />
        <asp:TextBox ID="txtSmall" runat="server" CssClass="inputbox" Width="90%"></asp:TextBox>
        <asp:FileUpload ID="FuSmall" runat="server" />
        <asp:Button ID="btnSmall" runat="server" Text="上传" CssClass="btnalt" onclick="btnSmall_Click" />
        <strong>tips:首页幻灯片小图 大小为 45 X 46 (高/宽 单位:像素)</strong>
        <div class="clear"></div>

        <h3>幻灯片标题：</h3>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" MaxLength="100" Width="90%"></asp:TextBox>
        <strong>tips: 幻灯片标题,当鼠标划过幻灯片显示的文字</strong>
        <div class="clear"></div>

        <h3>幻灯片英文标题：</h3>
        <asp:TextBox ID="txtEnTitle" runat="server" CssClass="inputbox" MaxLength="100" Width="90%"></asp:TextBox>
        <strong>tips: 幻灯片英文标题</strong>
        <div class="clear"></div>
            
        <h3>排序值：</h3>
        <asp:TextBox ID="txtSort" runat="server" CssClass="inputbox" MaxLength="5" Width="200">1</asp:TextBox>
        <strong>tips: 排序值,必须是数字</strong>
        <div class="clear"></div>

        <h3>链接地址：</h3>
        <asp:TextBox ID="txtlink" runat="server" MaxLength="100" CssClass="inputbox" Text="http://"></asp:TextBox>
        <strong>tips:幻灯片图片的链接地址(需要以http://开头)</strong>
        <div class="clear">
        </div>

        <asp:Button ID="Button2" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="保存" />
        </div>
    </div>
</asp:Content>