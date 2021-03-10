<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>购物车</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
	<!--cart-items-->
	<div class="cart-items">
		<div class="container">
		
		<c:if test="${msg!=null}"><div class="alert alert-success">${msg}</div></c:if>
		<c:if test="${pageInfo.pages!=0}">
			<h2>我的购物车</h2>
			<table class="table table-bordered table-hover">
			
				<tr>
					<th width="10%">序号</th>
					<th width="20%">名称</th>
					<th width="20%">商品图片</th>
					<th width="10%">单价</th>
					<th width="10%">数量</th>
					<th width="20%">操作</th>
				</tr>
				
				<c:forEach var="item" items="${pageInfo.list}" varStatus="status">
			         <tr>
			         	<td><p>${status.index+1}</p></td>
			         	<td><a href="/index/detail.do?pid=${item.products.pid}">${item.products.pname}</a></td>
			         	<td><p><a href="/index/detail.do?pid=${item.products.pid}" target="_blank"><img src="${item.products.imgurl}" width="100px" height="100px"></a></p></td>
			         	<td><p>¥ ${item.products.price}</p></td>
			         	<td><p>${item.quantity}</p></td>
			         	<td>
							<a class="btn btn-info" href="/index/updateShoppingCart.do?id=${item.id}&quantity=${item.quantity+1}" title="添加"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
							<a class="btn btn-warning" href="/index/updateShoppingCart.do?id=${item.id}&quantity=${item.quantity-1<1?1:item.quantity-1}" title="减少"><span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span></a>
							<a class="btn btn-danger" href="/index/deleteShoppingCart.do?id=${item.id}"  title="删除"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
						</td>
			       	</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="text-align:center">订单总金额</td>
					<td>¥ ${total}</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align:center"><a class="btn btn-success btn-lg" style="margin-left:74%" href="/index/saveCart.do?uid=${uid}">提交订单</a></td>
				</tr>
			     
			</table>
			</c:if>
			<c:if test="${pageInfo.pages==0}"><div class="alert alert-info">空空如也</div>
				<br><br><br><br><br><br>
				<br><br><br><br><br><br>
				<br><br><br><br><br><br>
				<br><br><br><br>
			</c:if>
			
		</div>
		<div style="text-align: center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li ><a href="/index/cart.do?page=1&uid=${uid}">首页</a></li>
					<c:if test="${pageInfo.pageNum==1}">
						<li class="disabled">
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=1}">
						<li >
							<a href="/index/cart.do?page=${pageInfo.prePage}&uid=${uid}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${startEnd[0]}" end="${startEnd[1]}" var="i">
						<c:if test="${pageInfo.pageNum==i}">
							<li class="active"><a href="/index/cart.do?page=${i}&uid=${uid}">${i}</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum!=i}">
							<li ><a href="/index/cart.do?page=${i}&uid=${uid}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.pageNum==pageInfo.lastPage}">
						<li class="disabled">
							<a href="/index/cart.do?page=${pageInfo.nextPage}&uid=${uid}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=pageInfo.lastPage}">
						<li >
							<a href="/index/cart.do?page=${pageInfo.nextPage}&uid=${uid}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<li ><a href="/index/cart.do?page=${pageInfo.total}&uid=${uid}">尾页</a></li>
				</ul>
			</nav>共${pageInfo.pages}页,共${pageInfo.total}条记录
		</div>
	</div>
	<!--//cart-items-->	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>