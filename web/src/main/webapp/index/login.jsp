<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2020/7/28
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%--<html>--%>
<%--<head>--%>
    <%--<title>登录</title>--%>
    <%--<style>--%>
        <%--.body{--%>
            <%--width: 300px;--%>
            <%--margin: 10px auto;--%>
            <%--border: 1px solid blue;--%>
            <%--padding: 40px;--%>
        <%--}--%>
        <%--input{--%>
            <%--margin-top: 10px;--%>
            <%--margin-bottom: 10px;--%>
        <%--}--%>
        <%--.input{--%>
            <%--text-align: center;--%>
        <%--}--%>
    <%--</style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div style="text-align: center;margin-top: 140px;font-size: larger;font-family: 微软雅黑">登 录</div>--%>
<%--<div class="body">--%>
    <%--<form action="login.do" method="post" >--%>
        <%--<div class="input">账 户：<input type="text" name="username" value="admin"/><br/></div>--%>
        <%--<div class="input">密 码：<input type="password" name="password" value="admin"/><br/></div>--%>
        <%--<div class="input">时 间：<input type="date" name="date"/><br/></div>--%>

        <%--<div class="input"><input type="submit"  value="&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;"/></div>--%>

    <%--</form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户登录界面</title>
    <link rel="stylesheet" href="styleLogin.css"/>
    <script>
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: url("/images/柠檬3.jpg") no-repeat;
            background-size: cover;
        }

        .container {
            position: relative;
            width: 50rem;
        }

        .panel {
            position: absolute;
            top: 50%;
            left: 10%;
            transform: translate(-50%,-50%);
            background: rgba(0,0,0,.8);
            display: flex;
            justify-content: center;
            width: 400px;
            padding: 40px;
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.5);
            border-radius: 10px;
        }

        .switch h1 {
            text-align: center;
            font-size: 1.4rem;
            color: rgba(125, 116, 255,.8);
            border-bottom: rgba(125, 116, 255,.8) solid 2px;
            cursor: default;
        }
        .switch h3 {
            text-align: center;
            font-size: 1.1rem;
            color: red;
            cursor: default;
        }

        .input input {
            outline: none;
            width: 100%;
            border: none;
            background: none;
            border-bottom: .1rem solid #7d74ff;
            color: rgba(37, 215, 202, 0.84);
            font-size: 1rem;
        }

        .input::after {
            content: attr(aria-placeholder);
            position: absolute;
            left: 0;
            top: -20%;
            font-size: 1.1rem;
            color: rgba(125, 116, 255, 0.44);
            transition: .3s;
        }

        .input.focus::after {
            top: -70%;
            font-size: 1rem;
        }

        .input#forget {
            color: #7d74ff;
            font-size: 0.8rem;
            text-decoration: none;
        }

        .input#forget:hover {
            color: rgba(138, 143, 255, 0.4);
        }

        .input#signUp {
            color: #7d74ff;
            font-size: 0.8rem;
            text-decoration: none;
        }

        .input#signUp:hover {
            color: rgba(138, 143, 255, 0.4);
        }

        form p {
            text-align: center;
        }

        form span {
            color: #7d74ff;
            font-size: 0.8rem;
            cursor: default;
        }

        form {
            width: 12rem;
            margin: 1rem 0 0;
        }

        form .input {
            position: relative;
            opacity: 1;
            width: 100%;
            margin: 2rem 0 0;
            height: 42px;
        }

        form .input#userName {
            margin: 3rem 0 0;
        }

        form .input#password {
            height: 1.6rem;
        }

        form button {
            display: block;
            border: none;
            outline: none;
            margin: 2rem 61px 0;
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: linear-gradient(90deg, #8a8fff, rgb(216, 174, 255));
            box-shadow: 0 0 8px #8a8fff;
            cursor: pointer;
        }

        form button:hover {
            border: none;
            outline: none;
            margin: 2rem -7px 0;
            width: 100%;
            height: 3.5rem;
            border-radius: 3rem;
            background: linear-gradient(90deg, rgba(138, 143, 255, 0.75), rgba(216, 174, 255, 0.75));
            box-shadow: 0 0 8px #8a8fff;
            cursor: pointer;
            color: rgba(0,0,0,0.6);
            transition: .4s;
        }
    </style>
</head>
<body>
           <form action="/index/login.do" method="post" >
<div class="container">
    <div class="panel">
        <div class="content">
            <div class="switch">
                <h3>${errorMessage}</h3>
                <h1 id="login">登录</h1>
            </div>
                <div id="userName" class="input" aria-placeholder="用户名"><input type="text" name="username" ></div>
                <div id="password" class="input" aria-placeholder="密码"><input type="password" name="password" ></div>

                <p>
                    <a id="signUp" href="/index/register.jsp" class="input">跳转注册</a>
                    <span>|</span>
                    <a id="forget"  class="input">忘记密码？</a>
                </p>
                <button class="button">登录</button>

        </div>
    </div>
</div>
           </form>
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