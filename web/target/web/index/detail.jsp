<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>商品详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/flexslider.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<script>
		$(function() {
		  $('.flexslider').flexslider({
			animation: "slide",
			controlNav: "thumbnails"
		  });
		});
	</script>
</head>
<body>
	 
	<jsp:include page="header.jsp"/>
	
	<!--//single-page-->
	<div class="single">
		<div class="container" style="width:80%">
			<div class="single-grids">				
				<div class="col-md-4 single-grid">		
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${product.imgurl}">
								<div class="thumb-image"> <img src="${product.imgurl}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2357574354,4049288266&fm=26&gp=0.jpg">
								 <div class="thumb-image"> <img src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2357574354,4049288266&fm=26&gp=0.jpg" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2385809476,1300869320&fm=26&gp=0.jpg">
							   <div class="thumb-image"> <img src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2385809476,1300869320&fm=26&gp=0.jpg" data-imagezoom="true" class="img-responsive"> </div>
							</li> 
						</ul>
					</div>
				</div>	
				<div class="col-md-3 single-grid simpleCart_shelfItem">		
					<h3>${product.pname}</h3>
					<div class="tag">
						<p>分类 : <a href="/index/goods.do?cid=${product.cid}">${category.cname}</a></p>
					</div>
					<p>介绍: ${product.pdesc}</p>
					<div class="galry">
						<h4>库存: ${good.stock}</h4>
					</div>
					<div class="galry">
						<div class="prices">
							<h5 class="item_price">¥ ${product.price}</h5>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="btn_form">
						<a href="javascript:;" class="add-cart item_add" onclick="buy(${product.pid})">加入购物车</a>
					</div>
				</div>
				<div class="col-md-5 single-grid1" style="height:600px;">
					<div class="panel panel-default" style="width: 80%;margin-left: 30%;height:600px;position:relative;">
					  <!-- Default panel contents -->
					  <div class="panel-heading" style="background-color: #ab8b556b">评论</div>
					  <!-- Table -->
					  <div style="height:400px;width:100%;display:block;overflow-y:auto;">
					  <table class="table" style="">
					  	<c:if test="${pinglunList != null && fn:length(pinglunList) > 0 }">
					  		<thead>
					  			<td width="10%">序号</td>
					  			<td style="width: 20%;text-align: center;">用户id</td>
					  			<td width="70%">评论内容</td>
					  		</thead>
					  		<c:forEach var="pinglun" items="${pinglunList}"  varStatus="status">
								<tr>
									<td style="text-align: center;"><p>${status.index+1}</p></td>
									<td style="text-align: center;">用户${pinglun.userId}</td>
									<td width="70%" style="text-align: left;">${pinglun.content}</td>
								</tr>
							</c:forEach>
					  	</c:if>
					  	<c:if test="${pinglunList == null || fn:length(pinglunList) < 1 }">
					  		<br /><br />
					  		<div style="text-align: center;">
					  			暂无评论
					  		</div>
					  	</c:if>
					  </table>
					  </div>
					  <div style="position: absolute;bottom:20px;;width:100%;">
					  	<br><br>
						<form action="pl" method="post" style="width: 100%;margin-left: 20px;" onsubmit="return checkData();" >
							<span style="font-size: 15px;font-weight: bold;">
								发表评论：
							</span>
							<input type="text" style="width:50%;display:inline-block;" class="form-control" rows="3" id="pl" name="pl"></input>
							<input type="hidden" id="gid" name="gid" value="${good.id}">
							<c:if test="${sessionScope.user != null}">
							<input type="hidden" id="uid" name="uid" value="${sessionScope.user.id}">
							<input type="hidden" id="uname" name="uname" value="${sessionScope.user.username}">
							<input class="btn btn-primary" type="submit" value="评论">
							</c:if>
							<c:if test="${sessionScope.user==null}">
								<div style="text-align: center;">
									<br>
									<span style="font-size: 15px;font-weight: bold;">
										请登录后进行评论
									</span>
								</div>
							</c:if>
						</form>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"/>

</body>

<script type="text/javascript">
/**
 * 评论判断
 */
function checkData(){
	var result = document.getElementById("pl").value;
	if(result == ""){
		alert("评论内容不能为空");
		return false;
	}
	return true;
}
</script>
</html>