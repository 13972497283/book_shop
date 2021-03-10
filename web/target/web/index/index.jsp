<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/unslider.min.js"></script>
<script type="text/javascript" src="/layer/layer.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<style>

.banner1 {
	background-color:#506f8ad1
}

.banner1 ul li {
	float: left;
	height:450px;
}

#b04 {
	position:relative;
	width: 80%;
	margin-left:10%;
}

#b04 .dots {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0px;
}

#b04 .dots li {
	display: inline-block;
	width: 10px;
	height: 10px;
	margin: 0 4px;
	text-indent: -999em;
	border: 2px solid #aaa;
	border-radius: 6px;
	cursor: pointer;
	opacity: .4;
	-webkit-transition: background .5s, opacity .5s;
	-moz-transition: background .5s, opacity .5s;
	transition: background .5s, opacity .5s;
}

#b04 .dots li.active {
	background: #fff;
	opacity: 1;
}

#b04 .arrow {
	position: absolute;
	top: 200px;
}

#b04 #al {
	left: 20px;
}

#b04 #ar {
	right: 20px;
}
.lunbo{
	margin-top:25px;
	margin-left:21%;
	width:30%;
	height:380px;
	float:left;
}
</style>
<script>

$(document).ready(function(e) {
    var unslider04 = $('#b04').unslider({
		dots: true
	}),
	data04 = unslider04.data('unslider');
	$('.unslider-arrow04').click(function() {
        var fn = this.className.split(' ')[1];
        data04[fn]();
    });
});

</script>

</head>
<body>

	<jsp:include page="header.jsp" />

	<div style="width: 100%; height: 450px; background-color: #b17e56;text-align: center;background:url('../picture/tibg1.jpg')">
		<div class="banner1" id="b04" style="">
			<ul>
				<c:forEach var="product" items="${products}" end="5" begin="2">
					<li>
						<a href="/index/detail.do?pid=${product.pid}">
							<img class="lunbo" src="${product.imgurl}" alt="${product.pname}"  >
						</a>
						<a href="/index/detail.do?pid=${product.pid}">
							<img style="margin-left:0px" class="lunbo" src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2357574354,4049288266&fm=26&gp=0.jpg" alt="${product.pname}"  >
						</a>
					</li>
				</c:forEach>
			</ul>
			<a href="javascript:void(0);" class="unslider-arrow04 prev">
				<img class="arrow" id="al" src="../picture/arrowl.png" alt="prev" width="20" height="35">
			</a> 
			<a href="javascript:void(0);" class="unslider-arrow04 next">
				<img class="arrow" id="ar" src="../picture/arrowr.png" alt="next" width="20" height="37">
			</a>
		</div>
	</div>
	<!--gallery style="background:url('../picture/tibg1.jpg')"-->
	<div class="gallery" style="background-color:#fbffc038">
		<div class="container">
			<div class="alert alert-danger">热销推荐</div>
			<div class="gallery-grids">
				<c:forEach var="p" items="${products}" end="5">
					<div class="col-md-4 gallery-grid glry-two">
						<a href="/index/detail.do?pid=${p.pid}"> <img
							style="height: 350px" src="${p.imgurl}"
							class="img-responsive" alt="${p.pname}" width="350"
							height="350" />
						</a>
						<div class="gallery-info galrr-info-two">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								<a href="/index/detail.do?pid=${p.pid}">查看详情</a>
							</p>
							<a class="shop" href="javascript:;" onclick="buy(${p.pid})">加入购物车</a>
							<div class="clearfix"></div>
						</div>
						<div class="galy-info">
							<p>${top.good.type.name}>${p.pname}</p>
							<div class="galry">
								<div class="prices">
									<h5 class="item_price">¥ ${p.price}</h5>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="clearfix"></div>
			<%-- <div class="alert alert-info">新品推荐</div>
			<div class="gallery-grids">
				<c:forEach var="top" items="${top3List}" end="7">
					<div class="col-md-3 gallery-grid ">
						<a href="detail?goodid=${top.good.id}"> <img
							style="height: 255px; width: 255px" src="../${top.good.cover}"
							class="img-responsive" alt="${top.good.name}" />
						</a>
						<div class="gallery-info">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								<a href="detail?goodid=${top.good.id}">查看详情</a>
							</p>
							<a class="shop" href="javascript:;" onclick="buy(${top.good.id})">加入购物车</a>
							<div class="clearfix"></div>
						</div>
						<div class="galy-info">
							<p>${top.good.type.name}>${top.good.name}</p>
							<div class="galry">
								<div class="prices">
									<h5 class="item_price">¥ ${top.good.price}</h5>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div> --%>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>