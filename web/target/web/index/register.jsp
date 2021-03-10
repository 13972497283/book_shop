<%--
  Created by IntelliJ IDEA.
  User: wolf
  Date: 2020/7/31
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册界面</title>
    <link rel="stylesheet" href="../css/styleSignUp.css"/>
</head>


<script type="text/javascript">
    //表单的校验
    function checkForm(){
        //用户名不能为空
        var username = document.form1.username.value;
        if(username.trim() == ""){
            alert("用户名不能为空");
            return false;
        }
        //密码格式
        var password = document.form1.password.value;
        if(password.trim()==""||password.length < 6){
            alert("密码不能少于6位");
            return false;
        }
        //两次密码要一致
        var repassword = document.form1.repassword.value;
        if(password != repassword){
            alert("两次密码不一致");
            return false;
        }
        //昵称不能为空
        var name = document.form1.name.value;
        if(name.trim() == ""){
            alert("姓名不能为空");
            return false;
        }
        //邮箱格式
        var email = document.form1.email.value;
        if(!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email)){
            alert("邮箱格式不正确");
            return false;
        }


    }

</script>


<body>
<div class="container">
    <div class="panel">
        <div class="content">
            <div class="switch">
                <h1 id="signUp">注册</h1>
            </div>
            <form name="form1" action="/index/register.do" method="post" onsubmit="return checkForm()">

            <%--<form action="/index/register.do" method="post">--%>
                <div  class="input" aria-placeholder="姓名"><input type="text" name="name"></div>
                <div id="userName" class="input" aria-placeholder="用户名"><input type="text" name="username"></div>
                <span style="color: red">${errorMessage}</span>
                <div id="email" class="input" aria-placeholder="邮箱"><input type="text" name="email"></div>
                <div  class="input" aria-placeholder="电话号码"><input type="text" name="phone"></div>
                <div id="password" class="input" aria-placeholder="密码"><input type="password" name="password"></div>
                <div id="repeat" class="input" aria-placeholder="确认密码"><input type="password" name="repassword"></div>
                <p>
                    <a id="login" href="/index/login.jsp" class="input">已有账户？点击登录</a>
                </p>
                <button type="submit">注册</button>

            </form>
        </div>
    </div>
</div>
</body>

<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.slim.js"></script>
<script>

    $('.input input').on('focus',function () {
        $(this).parent().addClass('focus');
    })

    $('.input input').on('blur',function () {
        if($(this).val() === '')
            $(this).parent().removeClass('focus');
    })
</script>

</html>
