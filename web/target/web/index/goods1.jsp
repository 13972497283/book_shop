<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
	<title>商品列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/simpleCart.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
	<!--products-->
	<div class="products" style="margin-top:-40px;background:#fbffc038">	 
		<div class="container">
			<hr>
			<h2>${searchName}</h2>
			<c:if test="${pageInfo.total == 0 }">
			    <div style="text-align:center">
					暂无商品
				</div>
				<br><br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br><br>
			</c:if>
			<div class="col-md-12 product-model-sec">
				<c:forEach var="products" items="${pageInfo.list}">
					<div class="product-grid" style="height: 380px;width:244px;">
						<a href="/index/detail.do?pid=${products.pid}">
							<div class="more-product"><span> </span></div>						
							<div class="product-img b-link-stripe b-animate-go  thickbox" style="height: 245px;width:245px;">
								<img src="${products.imgurl}" class="img-responsive" alt="${products.pname}" width="240px" height="240px">
								<div class="b-wrapper">
									<h4 class="b-animate b-from-left  b-delay03">							
										<button>查看详情</button>
									</h4>
								</div>
							</div>
						</a>				
						<div class="product-info simpleCart_shelfItem">
							<div class="product-info-cust prt_name">
								<h4>${products.pname}</h4>
								<span class="item_price">¥ ${products.price}</span>
								<input type="button" class="item_add items" value="加入购物车" onclick="buy(${products.pid})">
								<div class="clearfix"> </div>
							</div>												
						</div>
					</div>
				</c:forEach>
				<div class="clearfix"> </div>
			</div>
			<div style="text-align: center">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li ><a href="/index/goods.do?searchName=${searchName}&page=1">首页</a></li>
					<c:if test="${pageInfo.pageNum==1}">
						<li class="disabled">
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=1}">
						<li >
							<a href="/index/goods.do?searchName=${searchName}&page=${pageInfo.prePage}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${startEnd[0]}" end="${startEnd[1]}" var="i">
						<c:if test="${pageInfo.pageNum==i}">
							<li class="active"><a href="/index/goods.do?searchName=${searchName}&page=${i}">${i}</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum!=i}">
							<li ><a href="/index/goods.do?searchName=${searchName}&page=${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.pageNum==pageInfo.lastPage}">
						<li class="disabled">
							<a href="/index/goods.do?searchName=${searchName}&page=${pageInfo.nextPage}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=pageInfo.lastPage}">
						<li >
							<a href="/index/goods.do?searchName=${searchName}&page=${pageInfo.nextPage}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<li ><a href="/index/goods.do?searchName=${searchName}&page=${pageInfo.pages}">尾页</a></li>
				</ul>
			</nav>共${pageInfo.pages}页,共${pageInfo.total}条记录
			</div>
		</div>
	</div>
	<!--//products-->	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>