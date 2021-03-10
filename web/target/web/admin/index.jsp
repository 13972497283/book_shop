<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>后台管理</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<!-- css -->
<%--<link rel="stylesheet" type="text/css" href="admin.css" />--%>
<%--<script type="text/javascript"--%>
<%--	src="https://code.jquery.com/jquery-3.3.1.js"></script>--%>
<%--<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->--%>
<%--<link rel="stylesheet"--%>
<%--	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"--%>
<%--	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"--%>
<%--	crossorigin="anonymous">--%>

<%--<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->--%>
<%--<link rel="stylesheet"--%>
<%--	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"--%>
<%--	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"--%>
<%--	crossorigin="anonymous">--%>

<%--<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<%--<script--%>
<%--	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"--%>
<%--	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"--%>
<%--	crossorigin="anonymous"></script>--%>
<style>
#main-nav {
	margin-left: 1px;
}

#main-nav.nav-tabs.nav-stacked>li>a {
	padding: 10px 8px;
	font-size: 12px;
	font-weight: 600;
	color: #4A515B;
	background: #E9E9E9;
	background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #FAFAFA),
		color-stop(100%, #E9E9E9));
	background: -webkit-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	background: -o-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	background: -ms-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	background: linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA',
		endColorstr='#E9E9E9');
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
	border: 1px solid #D5D5D5;
	border-radius: 4px;
}

#main-nav.nav-tabs.nav-stacked>li>a>span {
	color: #4A515B;
}

#main-nav.nav-tabs.nav-stacked>li.active>a, #main-nav.nav-tabs.nav-stacked>li>a:hover
	{
	color: #FFF;
	background: #3C4049;
	background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #4A515B),
		color-stop(100%, #3C4049));
	background: -webkit-linear-gradient(top, #4A515B 0%, #3C4049 100%);
	background: -o-linear-gradient(top, #4A515B 0%, #3C4049 100%);
	background: -ms-linear-gradient(top, #4A515B 0%, #3C4049 100%);
	background: linear-gradient(top, #4A515B 0%, #3C4049 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B',
		endColorstr='#3C4049');
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
	border-color: #2B2E33;
}

#main-nav.nav-tabs.nav-stacked>li.active>a, #main-nav.nav-tabs.nav-stacked>li>a:hover>span
	{
	color: #FFF;
}

#main-nav.nav-tabs.nav-stacked>li {
	margin-bottom: 4px;
}
/*定义二级菜单样式*/
.secondmenu a {
	font-size: 10px;
	color: #4A515B;
	text-align: center;
}

.navbar-static-top {
	background-color: #212121;
	margin-bottom: 5px;
}

.navbar-brand {
	background: url('') no-repeat 10px 8px;
	display: inline-block;
	vertical-align: middle;
	padding-left: 50px;
	color: #fff;
}
</style>
</head>
<script>
	$(document).ready(function() {
	});
</script>

<body>
	<div class="navbar navbar-duomi navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/Admin/index.html" id="logo">后台管理系统
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
					<li class="active"><a href="#"> <i
							class="glyphicon glyphicon-th-large"></i> 选项
					</a></li>
					<li><a href="/admin/orderList.do"> <i
							class="glyphicon glyphicon-cog"></i> 订单管理
					</a></li>
					<li><a href="/admin/userList.do"> <i
							class="glyphicon glyphicon-credit-card"></i> 客户管理
					</a></li>
					<li><a href="/admin/goodList.do"> <i
							class="glyphicon glyphicon-globe"></i>商品管理 
					</a></li>
					<li><a href="/admin/typeList.do"> <i
							class="glyphicon glyphicon-calendar"></i> 类目管理
					</a></li>
					<li><a href="/admin/logOut.do"> <i
							class="glyphicon glyphicon-calendar "></i> 退出
					</a></li>
				</ul>
			</div>
			<div class="col-md-10">
				<c:if test="${pa eq 'order'}">
					<%@include file="order_list.jsp"%>
				</c:if>
				<c:if test="${pa eq 'user_list'}">
					<%@include file="user_list.jsp"%>
				</c:if>
				<c:if test="${pa eq 'user_list_add'}">
					<%@include file="user_add.jsp"%>
				</c:if>
				<c:if test="${pa eq 'user_reset'}">
					<%@include file="user_reset.jsp"%>
				</c:if>
				<c:if test="${pa eq 'user_edit'}">
					<%@include file="user_edit.jsp"%>
				</c:if>
				<c:if test="${pa eq 'good_list'}">
					<%@include file="good_list.jsp"%>
				</c:if>
				<c:if test="${pa eq 'good_list1'}">
					<%@include file="good_list1.jsp"%>
				</c:if>
				<c:if test="${pa eq 'good_edit'}">
					<%@include file="good_edit.jsp"%>
				</c:if>
				<c:if test="${pa eq 'good_add'}">
					<%@include file="good_add.jsp"%>
				</c:if>
				<c:if test="${pa eq 'type_list'}">
					<%@include file="type_list.jsp"%>
				</c:if>
				<c:if test="${pa eq 'type_edit'}">
					<%@include file="type_edit.jsp"%>
				</c:if>
				<c:if test="${pa eq 'admin_reset'}">
					<%@include file="admin_reset.jsp"%>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
