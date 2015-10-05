<%@ page language="C#" masterpagefile="~/admin/master/Master.master" autoeventwireup="true" inherits="admin_AreaContactInformationEdit, App_Web_yijgkayn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCP" Runat="Server">
    <div class="contentcontainer">
        <div class="headings altheading">
            <h2>编辑地区联系人信息</h2>
        </div>
        <div class="contentbox state">  
        <div class="clear"></div>           
           
        <h3>省市：</h3>
        <asp:DropDownList ID="DDLProv" runat="server" Width="15%" Height="30px"></asp:DropDownList>&nbsp;省
        <b id="city">
        <asp:DropDownList ID="DDLCity" runat="server" Width="15%" Height="30px"></asp:DropDownList>
        </b>
        <strong>tips省市  </strong>
        <div class="clear"></div>

        <h3>是否高亮显示：</h3>
        <asp:CheckBox ID="ckbIsTop" runat="server" Text="是否高亮显示"/>
        <strong>tips:带有星星图案的样式</strong>
        <div class="clear"></div>

        <h3>联系人：</h3>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="inputbox" MaxLength="50" Width="400"></asp:TextBox>
        <strong>tips:联系人姓名.长度最多10个字符  </strong>
        <div class="clear"></div>
        
        <h3>联系人地区：</h3>
        <asp:TextBox ID="txtExtr" runat="server" CssClass="inputbox" MaxLength="50" Width="400"></asp:TextBox>
        <strong>tips:联系人地区信息 </strong>
        <div class="clear"></div>

        <h3>联系电话：</h3>
        <asp:TextBox ID="txtTele" runat="server" CssClass="inputbox" MaxLength="30" Width="400"></asp:TextBox>
        <strong>tips:联系电话长度最多30个字符  </strong>
        <div class="clear"></div>

        <input type="button" id="save" class="btn" style="width:80px" value="保存" />
        </div>
   </div>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#ctl00_mainCP_DDLProv").change(function () {
                var tid = this.value;
                $.get("getcity.aspx", { tid: tid }, function (data) {
                    $("#city").html(data);
                });
            });
        });

        $(function () {
            $("#save").click(function () {
                var name = $("#ctl00_mainCP_txtTitle").val();
                var phone = $("#ctl00_mainCP_txtTele").val();
                if (name == "") {
                    alert("联系人姓名不能为空 !"); return;
                } else if (phone == "") {
                    alert("联系人方式不能为空 !"); return;
                }
                var pro = $("#ctl00_mainCP_DDLProv").val();
                var city = $("#ctl00_mainCP_DDLCity").val();
                var extr = $("#ctl00_mainCP_txtExtr").val();
                var istop = $("#ctl00_mainCP_ckbIsTop").attr("checked");
                $.post("_code/ediacinfo.ashx", { Action: "post", name: name, phone: phone, extr: extr, pro: pro, city: city, istop: istop, id: "<%=id %>" }, function (data, textStatus) {
                    if (textStatus == "success") {
                        if (data == 1) {
                            alert("编辑成功 !");
                        } else {
                            alert("编辑失败 !");
                        }
                        window.location.href = "AreaContactInformation.aspx?Pageindex=<%=PageIndex %>";
                    }
                })
            });
        });
    </script>
</asp:Content>