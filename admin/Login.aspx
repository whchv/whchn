<%@ page language="C#" autoeventwireup="true" inherits="admin_Login, App_Web_yijgkayn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>茶花女__后台管理系统__欢迎登录</title>
    <link href="styles/layout.css" rel="stylesheet" type="text/css" />
    <link href="styles/login.css" rel="stylesheet" type="text/css" />
    <!-- Theme Start -->
    <link href="themes/blue/styles.css" rel="stylesheet" type="text/css" />
    <!-- Theme End -->
</head>
<body>
<form id="login" runat="server" action="Login.aspx">
    <div id="logincontainer">
        <div id="loginbox">
            <div id="loginheader">
                <img src="themes/blue/img/cp_logo_login.png" alt="Control Panel Login" />
            </div>
            <div id="innerlogin">
                <p>
                    Enter your username:</p>
                <input id="TxtUserName" maxlength="20" name="TxtUserName" class="logininput" runat="server" />
                <p>
                    Enter your password:</p>
                <input id="TxtPassword" type="password" name="TxtPassword" class="logininput" runat="server" />
                <input type="submit" id="flogin" class="loginbtn" value="Submit" onclick="return checkIsEmpty()" /><br />
                <p><a href="ForgottenPassword.aspx" title="Forgoteen Password?" target="_blank">Forgotten Password?</a></p>
            </div>
        </div>
        <div class="cr">Copyright 2008-<%=DateTime.Now.Year %> Support by Infinity arts ad-agency CO.Ltd.</div>
    </div>
</form>
    <script type="text/javascript" language="javascript">
        function checkIsEmpty() {
            var name = document.getElementById("TxtUserName");
            var pwd = document.getElementById("TxtPassword");
            if (name.value.length < 1) {
                alert("账号不能为空！");
                return false;
            }
            else if (pwd.value.length < 1) {
                alert("密码不能为空！");
                return false;
            }
        }
    </script>
</body>
</html>