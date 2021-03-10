<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>我的订单</title>
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
		<c:if test="${pageInfo.list!=null}">
				<table class="table table-bordered table-hover">

					<tr>
						<th width="5%">ID</th>
						<th width="5%">总价</th>
						<th width="15%">商品名称</th>
						<th width="10%">商品单价</th>
						<th width="10%">购买数量</th>
					</tr>
				<c:forEach var="item" items="${pageInfo.list}">
					<tr>
						<td><p>${item.carid}</p></td>
						<td><p><fmt:formatNumber type="number" value="${item.price*item.count}" pattern="#.00"/></p></td>
						<td>
							<p>${item.pname}</p>
						</td>
						<td>
							<p>${item.price}</p>
						</td>
						<td>
							<p>${item.count}</p>
						</td>
					</tr>
				</c:forEach>
			     
			</table>
			
			</c:if>
			<c:if test="${pageInfo.list==null}"><div class="alert alert-info">空空如也</div></c:if>
			
		</div>
		<div style="text-align: center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li ><a href="/index/order.do?page=1&uid=${uid}">首页</a></li>
					<c:if test="${pageInfo.pageNum==1}">
						<li class="disabled">
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=1}">
						<li >
							<a href="/index/order.do?page=${pageInfo.prePage}&uid=${uid}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${startEnd[0]}" end="${startEnd[1]}" var="i">
						<c:if test="${pageInfo.pageNum==i}">
							<li class="active"><a href="/index/order.do?page=${i}&uid=${uid}">${i}</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum!=i}">
							<li ><a href="/index/order.do?page=${i}&uid=${uid}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.pageNum==pageInfo.lastPage}">
						<li class="disabled">
							<a href="/index/order.do?page=${pageInfo.nextPage}&uid=${uid}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=pageInfo.lastPage}">
						<li >
							<a href="/index/order.do?page=${pageInfo.nextPage}&uid=${uid}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<li ><a href="/index/order.do?page=${pageInfo.total}&uid=${uid}">尾页</a></li>
				</ul>
			</nav>共${pageInfo.pages}页,共${pageInfo.total}条记录
		</div>
	</div>
	<!--//cart-items-->	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>