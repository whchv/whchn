<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_ProductInformationAdd, App_Web_yijgkayn" %>
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
        <h2>新增产品信息</h2>
    </div>
    <div class="contentbox state">
    <div class="clear"></div>

    <h3>图片剪裁：</h3>
    <asp:Image ID="imgExtr" runat="server"  Visible="false"/><br />
    <asp:TextBox ID="txtExtr" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox><br />
    <asp:FileUpload ID="fuextr" runat="server" /><img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnExtr" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" OnClick="btnExtr_Click" /><br />
    <strong>上传的裁剪大图的尺寸必须大于  300 X 400 ,否则裁剪的图片将会变形 (宽/高 单位:像素)</strong>

    <div id="box" style="float:left;"></div>
    <div id="success" style="margin-left:600px;">
    <style type="text/css">
    .st {  font-weight:bold; color:Red;}
    </style>
    <asp:Label CssClass="st" runat="server"  ID="ST"></asp:Label><br />
    <asp:Image ID="CutSuccess" runat="server" Visible="false" /></div>
    <div class="clear"></div>
         
    <asp:RadioButtonList ID="RBLPhoto" runat="server" AutoPostBack="true" RepeatLayout="Flow" RepeatDirection="Horizontal">
    <asp:ListItem Text="列表图片" Value="0" Selected="True"></asp:ListItem>
    <asp:ListItem Text="详细图片" Value="1"></asp:ListItem>
    <asp:ListItem Text="主推图片" Value="2"></asp:ListItem>
    </asp:RadioButtonList>
    <asp:HiddenField ID="X" runat="server" Value="0" />
    <asp:HiddenField ID="Y" runat="server" Value="0" />
    <asp:HiddenField ID="W1" runat="server" Value="0" />
    <asp:HiddenField ID="H1" runat="server" Value="0" />
    <asp:Button ID="SaveImg" runat="server" Text="裁剪并保存图片" OnClick="btn_SaveImg" CssClass="btnalt" />
    <strong>tips:图片剪裁功能 :<em>先上传一张大图，然后进行剪裁。大图尺寸大于下方将要上传图片的宽高</em></strong>
    <div class="clear"></div>

    <table>
    <tr>
        <td>
            <h3>是否显示：</h3>
            <asp:CheckBox ID="ckbIsShow" runat="server" Text="是否显示" Checked="true"/>
            <strong>tips:是否显示 </strong>
            <div class="clear"></div>
        </td>
        <td>
            <h3>首页推荐显示：</h3>
            <asp:CheckBox ID="ckbIsIndex" runat="server" Text="首页推荐显示" />
            <strong>tips:首页推荐显示</strong>
            <div class="clear"></div>
        </td>
        <td>
            <h3>其他系列推荐显示：</h3>
            <asp:CheckBox ID="ckbIsTop" runat="server" Text="其他系列推荐显示" />
            <strong>tips:其他系列推荐显示</strong>
            <div class="clear"></div>
        </td>
        <td>
            <h3>是否为主推产品：</h3>
            <asp:CheckBox ID="ckbIsMain" runat="server" Text="是否为主推产品" />
            <strong>tips:是否为主推产品</strong>
            <div class="clear"></div>
        </td>
    </tr>
    </table>
    
    <h3>列表图片：</h3>
    <asp:Image ID="imgList" runat="server" Visible="False" Width="148" Height="90" />
    <asp:TextBox ID="txtList" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
    <asp:FileUpload ID="FuList" runat="server" />
    <img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnList" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnList_Click" /><br />
    <strong>tips:产品的 列表图片 大小为 148 X 90  (宽/高 单位:像素)</strong>
    <div class="clear"></div>

    <h3>详细图片：</h3>
    <asp:Image ID="imgDetail" runat="server" Visible="False" Width="280" Height="280" />
    <asp:TextBox ID="txtDetail" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
    <asp:FileUpload ID="FuDetail" runat="server" />
    <img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnDetail" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnDetail_Click" /><br />
    <strong>tips:产品的 详细图片 大小为 280 X 280  (宽/高 单位:像素)</strong>
    <div class="clear"></div>

    <h3>主推图片：</h3>
    <asp:Image ID="imgMain" runat="server" Visible="False" Width="285" Height="180" />
    <asp:TextBox ID="txtMain" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
    <asp:FileUpload ID="FuMain" runat="server" />
    <img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnMain" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnMain_Click" /><br />
    <strong>tips:产品的 主推图片 大小为 285 X 180  (宽/高 单位:像素)</strong>
    <div class="clear"></div>

    <h3>所属分类：</h3>
    <asp:DropDownList ID="DDcLType" runat="server" Width="15%" Height="40px">
    </asp:DropDownList>
    <strong>tips:产品的类型 </strong>
    <div class="clear"></div>

    <h3>标题：</h3>
    <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:产品标题长度最多100个字符 </strong>
    <div class="clear"></div>

    <h3>英文标题：</h3>
    <asp:TextBox ID="txtEntitle" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:产品英文标题长度最多100个字符 </strong>
    <div class="clear"></div>

    <h3>品牌：</h3>
    <asp:TextBox ID="txtBrand" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:该产品的品牌名称 </strong>
    <div class="clear"></div>

    <h3>货号：</h3>
    <asp:TextBox ID="txtGoodsID" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:该产品的货号 </strong>
    <div class="clear"></div>

    <h3>系列：</h3>
    <asp:TextBox ID="txtxilie" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:系列 </strong>
    <div class="clear"></div>

    <h3>产品名称：</h3>
    <asp:TextBox ID="txtProductName" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:该产品的产品名称 </strong>
    <div class="clear"></div>

    <h3>表面材质：</h3>
    <asp:TextBox ID="txtCaizhi" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:该产品的主要成分 </strong>
    <div class="clear"></div>

    <h3>主要成分：</h3>
    <asp:TextBox ID="txtChengfen" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:该产品的主要成分 </strong>
    <div class="clear"></div>

    <h3>产品规格：</h3>
    <asp:TextBox ID="txtGuige" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:该产品的产品规格 </strong>
    <div class="clear"></div>

    <h3>数量：</h3>
    <asp:TextBox ID="txtShuliang" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:该产品的数量 例:(4片/包) </strong>
    <div class="clear"></div>

    <table>
    <tr>
        <td>
            <h3>页推荐排序值：</h3>
            <asp:TextBox ID="txtIndexSort" runat="server" CssClass="inputbox" MaxLength="5" Width="200">1</asp:TextBox>
            <strong>tips: 页推荐排序值,必须是数字</strong>
            <div class="clear"></div>
        </td>
        <td>
            <h3>其它系列产品推荐排序值：</h3>
            <asp:TextBox ID="txtTopSort" runat="server" CssClass="inputbox" MaxLength="5" Width="200">1</asp:TextBox>
            <strong>tips: 其它系列产品推荐排序值,必须是数字</strong>
            <div class="clear"></div>
        </td>
    </tr>
    </table>
            
    <h3>发布时间：</h3>
    <asp:TextBox ID="txtPublishtime" runat="server" CssClass="inputbox" MaxLength="50" Width="200"></asp:TextBox>
    <strong>tips: 时间格式如：<%=DateTime.Now.ToString() %></strong>
    <div class="clear"></div>

    <h3>产品卖点：</h3>
    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" CssClass="inputbox" Height="150px" MaxLength="220"></asp:TextBox>
    <strong>tips: 该产品的产品卖点</strong>
    <div class="clear"></div>

    <asp:Button ID="Button2" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="保存" />
</div>
</div>

</asp:Content>