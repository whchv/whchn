<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_NewsInformationEdit, App_Web_yijgkayn" %>
<%@ Register Src="~/admin/usercontrol/Ckeditor.ascx" TagPrefix="u1" TagName="Ckeditor" %>
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
        <h2>编辑新闻信息</h2>
    </div>
    <div class="contentbox state">
    <div class="clear"></div>

    <h3>图片剪裁：</h3>
    <asp:Image ID="imgExtr" runat="server"  Visible="false"/><br />
    <asp:TextBox ID="txtExtr" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox><br />
    <asp:FileUpload ID="fuextr" runat="server" /><img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnExtr" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" OnClick="btnExtr_Click" /><br />
    <strong>上传的裁剪大图的尺寸必须大于  400 X 200 ,否则裁剪的图片将会变形 (宽/高 单位:像素)</strong>

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
    <asp:ListItem Text="侧边推荐图片" Value="1"></asp:ListItem>
    <asp:ListItem Text="新闻咨询图片" Value="2"></asp:ListItem>
    <asp:ListItem Text="市场动态图片" Value="3"></asp:ListItem>
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
            <asp:CheckBox ID="ckbIsShow" runat="server" Text="是否显示" />
            <strong>tips:是否显示 </strong>
            <div class="clear"></div>
        </td>
        <td>
            <h3>首页推荐显示：</h3>
            <asp:CheckBox ID="ckbIsIndex" runat="server" Text="首页推荐显示" />
            <strong>tips:首页推荐显示</strong>
            <div class="clear"></div>
        </td>
    </tr>
    </table>
    
    <h3>列表图片：</h3>
    <asp:Image ID="imgList" runat="server" Visible="False" Width="97" Height="98" />
    <asp:TextBox ID="txtList" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
    <asp:FileUpload ID="FuList" runat="server" />
    <img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnList" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnList_Click" /><br />
    <strong>tips:新闻的 列表图片 大小为 97 X 98  (宽/高 单位:像素)</strong>
    <div class="clear"></div>
    
    <h3>侧边推荐图片：</h3>
    <asp:Image ID="imgTop" runat="server" Visible="False" Width="187" Height="59" />
    <asp:TextBox ID="txtTop" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
    <asp:FileUpload ID="FuTop" runat="server" />
    <img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnTop" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnTop_Click" /><br />
    <strong>tips:新闻的 侧边推荐图片 大小为 187 X 59  (宽/高 单位:像素 如果该篇不是最新新闻,则不需要填写)</strong>
    <div class="clear"></div>
    
    <h3>新闻咨询图片：</h3>
    <asp:Image ID="imgZX" runat="server" Visible="False" Width="350" Height="175" />
    <asp:TextBox ID="txtZX" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
    <asp:FileUpload ID="FuZX" runat="server" />
    <img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnZX" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnZX_Click" /><br />
    <strong>tips:新闻的 新闻咨询图片 大小为 350 X 175  (宽/高 单位:像素 新闻聚合页面的新闻资讯图片,如果不是新闻咨询类别,该图片可不填写)</strong>
    <div class="clear"></div>
    
    <h3>市场动态图片：</h3>
    <asp:Image ID="imgSC" runat="server" Visible="False" Width="189" Height="48" />
    <asp:TextBox ID="txtSC" runat="server" CssClass="inputbox" MaxLength="256"></asp:TextBox>
    <asp:FileUpload ID="FuSC" runat="server" />
    <img alt="Loading" src="img/loading.gif" />
    <asp:Button ID="btnSC" runat="server" Text="确定上传" CssClass="btnalt" ValidationGroup="x" onclick="btnSC_Click" /><br />
    <strong>tips:新闻的 市场动态图片 大小为 189 X 48  (宽/高 单位:像素 新闻聚合页面的市场动态图片,如果不是市场动态类别,该图片可不填写)</strong>
    <div class="clear"></div>

    <h3>所属分类：</h3>
    <asp:DropDownList ID="DDcLType" runat="server" Width="15%" Height="40px">
    <asp:ListItem Value="1">新闻咨询</asp:ListItem>
    <asp:ListItem Value="2">市场动态</asp:ListItem>
    <asp:ListItem Value="3">客户见证</asp:ListItem>
    <asp:ListItem Value="4">我在茶花女</asp:ListItem>
    </asp:DropDownList>
    <strong>tips:新闻的类型 </strong>
    <div class="clear"></div>

    <h3>标题：</h3>
    <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" MaxLength="100" Width="400"></asp:TextBox>
    <strong>tips:新闻标题长度最多100个字符 </strong>
    <div class="clear"></div>
            
    <h3>发布者：</h3>
    <asp:TextBox ID="txtUserName" runat="server" CssClass="inputbox" MaxLength="50" Width="200"></asp:TextBox>
    <strong>tips: 发布者的名称</strong>
    <div class="clear"></div>

    <h3>首页推荐显示：</h3>
    <asp:TextBox ID="txtIndexSort" runat="server" CssClass="inputbox" MaxLength="5" Width="200"></asp:TextBox>
    <strong>tips: 首页推荐显示,必须是数字</strong>
    <div class="clear"></div>
            
    <h3>发布时间：</h3>
    <asp:TextBox ID="txtPublishtime" runat="server" CssClass="inputbox" MaxLength="50" Width="200"></asp:TextBox>
    <strong>tips: 时间格式如：<%=DateTime.Now.ToString() %></strong>
    <div class="clear"></div>

    <h3>内容摘要：</h3>
    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" CssClass="inputbox" Height="150px" MaxLength="220"></asp:TextBox>
    <div class="clear"></div>

    <h3>内容：</h3>
    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="inputbox" Height="200"></asp:TextBox>
    <div class="clear"></div>

    <asp:Button ID="Button2" CssClass="btn" Width="80" runat="server" OnClick="btnSave_Click" Text="保存" />
</div>
</div>

<script type="text/javascript" src="editor/ckeditor/ckeditor.js"></script>
<u1:ckeditor ID="ck1" runat="server" />
</asp:Content>