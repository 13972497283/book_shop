<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>订单列表</title>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	<form class="form-inline" action="/admin/orderList.do" id="serchform" method="post">
		<div class="form-group">
			<input type="text" class="form-control" name="carid" placeholder="订单号" onkeyup="this.value=this.value.replace(/[^\d]+/g,'')">
		</div>
		<a href="javascript:;" onclick="document.getElementById('serchform').submit();" type="submit" class="btn btn-primary">点击搜索</a>
	</form>
	
	<br>
	
	<%-- <ul role="tablist" class="nav nav-tabs">
        <li <c:if test='${status==0}'>class="active"</c:if> role="presentation"><a href="orderList">全部订单</a></li>
        <li <c:if test='${status==1}'>class="active"</c:if> role="presentation"><a href="orderList?status=1">未付款</a></li>
        <li <c:if test='${status==2}'>class="active"</c:if> role="presentation"><a href="orderList?status=2">已付款</a></li>
        <li <c:if test='${status==3}'>class="active"</c:if> role="presentation"><a href="orderList?status=3">配送中</a></li>
        <li <c:if test='${status==4}'>class="active"</c:if> role="presentation"><a href="orderList?status=4">已完成</a></li>
    </ul> --%>
    
    <br>
	
	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="5%">总价</th>
		<th width="15%">商品详情</th>
		<th width="10%">商品单价</th>
		<th width="10%">购买数量</th>
		<th width="10%">下单用户</th>
		<th width="10%">操作</th>
	</tr>
	
	<c:forEach var="item" items="${pageInfo.list}">
         <tr>
         	<td><p>${item.cart.carid}</p></td>
         	<td><p>${item.cart.price*item.cart.count}</p></td>
         	<td>
	         	<p>${item.cart.pname}</p>
         	</td>
         	<td>
         		<p>${item.cart.price}</p>
         	</td>
			 <td>
				 <p>${item.cart.count}</p>
			 </td>
			 <td>
				 <p>${item.user.username}</p>
			 </td>
			<td>
				<a class="btn btn-danger" href="/admin/orderDelete.do?carid=${item.cart.carid}" title="删除"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
			</td>
       	</tr>
	</c:forEach>
     
</table>

<br>${pageTool}<br>
	<div style="text-align: center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li ><a href="/admin/orderList.do?page=1&carid=${carid==null?"":carid}">首页</a></li>
				<c:if test="${pageInfo.pageNum==1}">
					<li class="disabled">
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=1}">
					<li >
						<a href="/admin/orderList.do?page=${pageInfo.prePage}&carid=${carid==null?"":carid}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${startEnd[0]}" end="${startEnd[1]}" var="i">
					<c:if test="${pageInfo.pageNum==i}">
						<li class="active"><a href="/admin/orderList.do?page=${i}&carid=${carid==null?"":carid}">${i}</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=i}">
						<li ><a href="/admin/orderList.do?page=${i}&carid=${carid==null?"":carid}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageInfo.pageNum==pageInfo.lastPage}">
					<li class="disabled">
						<a href="/admin/orderList.do?page=${pageInfo.nextPage}&carid=${carid==null?"":carid}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=pageInfo.lastPage}">
					<li >
						<a href="/admin/orderList.do?page=${pageInfo.nextPage}&carid=${carid==null?"":carid}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<li ><a href="/admin/orderList.do?page=${pageInfo.total}&carid=${carid==null?"":carid}">尾页</a></li>
			</ul>
		</nav>共${pageInfo.pages}页,共${pageInfo.total}条记录
	</div>
</div>
</body>
</html>