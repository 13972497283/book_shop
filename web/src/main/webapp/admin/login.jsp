<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	.text-center{
		color:white
	}
	.container{
		width:70%
	}
</style>
</head>

<!-- 设置背景图片 -->
<body style="background-image:url(../images/柠檬3.jpg);background-size:cover;background-repeat: no-repeat">

	<div class="container">
		<div style="text-align:center;margin-top:10%;color:white;font-weight: bolder;letter-spacing:15px;font-size: 70px">
			<span>后台管理系统</span>
		</div>
		<c:if test="${msg!=null}"><div class="alert alert-danger text-center">${msg}</div></c:if>
		<form class="form-horizontal" action="/admin/login.do" method="post" style="margin-top:10%;">
			<h3 class="text-center">管理员登录</h3>
			<br>
			<div class="form-group" style="margin-bottom: 30px">
				<div class="col-md-4 col-md-offset-4">
					<input type="text" class="form-control" style="height:auto;padding:10px;" placeholder="输入用户名" name="username" value="admin">
				</div>
			</div>
			<div class="form-group" style="margin-bottom: 30px">
				<div class="col-md-4 col-md-offset-4">
					<input type="password" class="form-control" style="height:auto;padding:10px;" placeholder="输入密码" name="password" value="admin">
				</div>
			</div>
			<div class="col-md-4 col-md-offset-4">			
				<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
			</div>
		</form>
	</div>

</body>
</html>
