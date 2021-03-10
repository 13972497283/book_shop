<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript">
        .titleUl
        li
        a
        {
            color:white
        }
    </script>
</head>
<body>
	<div style="background-color: #5d4b33; color: white">
		<marquee style="width: 70%; float: left">
			<p style="font-family: Impact; font-size: 13pt; margin-top: 10px">
				我们能用新款式开始你的一天，就能使你用微笑来结束一天 &nbsp;&nbsp;&nbsp;&nbsp; 双12特价优惠，等你来拿
				&nbsp;&nbsp;&nbsp;&nbsp;</p>
		</marquee>
		<div>
			<ul class="titleUl nav navbar-nav">
				<li><a href="/index/cart.do?uid=${uid}"> <span style="color: white"
						class="glyphicon glyphicon-shopping-cart" aria-hidden="true"><span
							class="card_num">${order.amount==null ? '' :order.amount}</span></span>
				</a></li>
				<c:if test="${username==null}">
					<li><a style="color: white" href="/index/register.jsp"
						<c:if test="${flag==5}">class="active"</c:if>>注&nbsp;册&nbsp;</a></li>
					<li><a style="color: white" href="/index/login.jsp"
						<c:if test="${flag==6}">class="active"</c:if>>登&nbsp;录&nbsp;</a></li>
				</c:if>
				<c:if test="${username!=null}">
					<li><a style="color: white" href="/index/order.do?uid=${uid}"
						<c:if test="${flag==3}">class="active"</c:if>>我的订单</a></li>
					<li><a style="color: white" href="/index/my.do"
						<c:if test="${flag==4}">class="active"</c:if>>个人中心</a></li>
					<li><a style="color: white" href="/index/logout.do">退出</a></li>
				</c:if>
				<li><a style="color: white" href="../admin/login.jsp" target="_blank">后台管理</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--header-->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"
		style="width: 100%;background:#5d4b3326;margin-top:0px">
		<ul class="nav navbar-nav" style="width: 50%; margin-left: 10%">
			<li><a href="/index.jsp"
				<c:if test="${flag==1}">class="active"</c:if>>首页</a></li>
			<c:forEach var="type" items="${typeList}">
				<li><a class="list" href="/index/goods.do?cid=${type.cid}">${type.cname}</a></li>
			</c:forEach>
		</ul>
		<!--/.navbar-collapse-->
		<div>
			<form class="navbar-form navbar-left" role="search" action="/index/goods.do">
				<div class="form-group">
					<input type="text" class="form-control" name="searchName">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
		</div>
	</div>


</body>
</html>