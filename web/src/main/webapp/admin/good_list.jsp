<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>商品列表</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
<%--<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />--%>
<style type="text/css">
/*预览图片大小*/
#myImg img {
	width: 250px;
	height: 250px;
}
html,
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.popup {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}
#small {
	width: 75px;
	height: 50px;
	border: 2px solid rgba(35, 36, 35, 0.6);
	z-index: 1;
}
#small img {
	width: 100%;
	height: 100%;
	cursor: pointer;
	/* transition: 0.3s; */
}
#small img:hover {
	opacity: 0.5;
}
#magnify {
	display: none;
	position: fixed;
	z-index: 2;
	padding-top: 60px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.9);
}
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #ebe7e7;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}
.close:hover,  .close:focus {
	color: rgb(156, 153, 153);
	text-decoration: none;
	cursor: pointer;
}
.content {
	margin: auto;
	display: block;
	max-width: 800px;
	width: 80%;
}
.describe {
	margin: auto;
	display: block;
	text-align: center;
	color: #ccc;
	padding: 20px 0;
}
.content,  .describe {
	-webkit-animation-name: Eject;
	-webkit-animation-duration: 5s;
	animation-name: Eject;
	animation-duration: 5s;
}
@-webkit-keyframes Eject {
	from {
		-webkit-transform: scale(0)
	}
	to {
		-webkit-transform: scale(1)
	}
}
@keyframes Eject {
	from {
		transform: scale(0)
	}

	to {
		transform: scale(1)
	}
}
</style>
</head>
<body>
	<div class="container-fluid">


		<div class="text-right"></div>

		<br>

		<form class="form-inline" action="/admin/goodList.do" id="serchform"
			method="post">
			<div class="form-group">
				<input type="text" class="form-control" id="name" name="searchName"
					placeholder="商品名称">
			</div>
			<a href="javascript:;"
				onclick="document.getElementById('serchform').submit();"
				type="submit" class="btn btn-primary">点击搜索</a> <a
				class="btn btn-warning" href="/admin/toGoodAdd.do">添加商品</a>
		</form>

		<br>


		<%-- <ul role="tablist" class="nav nav-tabs">
			<li <c:if test='${status==0}'>class="active"</c:if>
				role="presentation"><a href="goodList">全部商品</a></li>
			<li <c:if test='${status==1}'>class="active"</c:if>
				role="presentation"><a href="goodList?status=1">首页轮播</a></li>
			<li <c:if test='${status==2}'>class="active"</c:if>
				role="presentation"><a href="goodList?status=2">热销产品</a></li>
			<li <c:if test='${status==3}'>class="active"</c:if> role="presentation"><a href="goodList?status=3">最新推出</a></li>
		</ul> --%>

		<c:if test="${status == 1}">
			<br>
			<p>首页默认只显示前[5]条记录</p>
		</c:if>
		<c:if test="${status == 2}">
			<br>
			<p>首页默认只显示前[6]条记录</p>
		</c:if>
		<c:if test="${status == 3}">
			<br>
			<p>首页默认只显示前[8]条记录</p>
		</c:if>

		<br>

		<table class="table table-bordered table-hover">

			<tr>
				<th width="5%">ID</th>
				<th width="10%">名称</th>
				<th width="20%">介绍</th>
				<th width="10%">价格</th>
				<th width="10%">库存</th>
				<th width="10%">类目</th>
				<th width="10%">图片</th>
				<th width="25%">操作</th>
			</tr>

			<c:forEach var="product" items="${pageInfo.list}">
				<tr>
					<td><p>${product.pid}</p></td>
					<td><p>
							<a href="/index/detail.do?pid=${product.pid}" target="_blank">${product.pname}</a>
						</p></td>
					<td><p style="color: #ec2e2ad9">${product.pdesc}</p></td>
					<td><p style="font-weight: bold">￥ ${product.price}</p></td>
					<td><p>11</p></td>
					<td><p>${product.category.cname}</p></td>
					<td>
						<div class="popup">
							<div id="small">
								<img id="img" src="${product.imgurl}" alt="填写图片信息描述" class="pimg">
							</div>
							<div id="magnify">
								<span class="close">&times;</span>
								<img class="content">
								<span class="describe"></span>
							</div>
						</div>
						<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
							<div id="innerdiv" style="position:absolute;">
								<img id="bigimg" style="border:5px solid #fff;" src="" />
							</div>
						</div>
					</td>
					<td>
						<p>
							<%-- <c:if test="${good.topSmall}"><a class="btn btn-info topDelete" href="javascript:;" type="3" goodid="${good.id}" text="加入新品">移出新品</a></c:if>
							<c:if test="${!good.topSmall}"><a class="btn btn-primary topSave" href="javascript:;" type="3" goodid="${good.id}" text="移出新品">加入新品</a></c:if> --%>
							<a class="btn btn-success" href="/admin/goodEdit.do?pid=${product.pid}" title="修改">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</a> 
							<a class="btn btn-danger" href="/admin/goodDelete.do?pid=${product.pid}" title="删除">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</a>
						</p> 
					</td>
				</tr>
			</c:forEach>

		</table>
		<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" id="test">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<img src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3623252019,2977188043&fm=15&gp=0.jpg" alt="" id="showImg"
							style="width: 100%;">
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<br>${pageTool}<br>
	</div>
	<div style="text-align: center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li ><a href="/admin/goodList.do?page=1">首页</a></li>
				<c:if test="${pageInfo.pageNum==1}">
					<li class="disabled">
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=1}">
					<li >
						<a href="/admin/goodList.do?page=${pageInfo.prePage}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${startEnd[0]}" end="${startEnd[1]}" var="i">
					<c:if test="${pageInfo.pageNum==i}">
						<li class="active"><a href="/admin/goodList.do?page=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=i}">
						<li ><a href="/admin/goodList.do?page=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageInfo.pageNum==pageInfo.lastPage}">
					<li class="disabled">
						<a href="/admin/goodList.do?page=${pageInfo.nextPage}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=pageInfo.lastPage}">
					<li >
						<a href="/admin/goodList.do?page=${pageInfo.nextPage}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<li ><a href="/admin/goodList.do?page=${pageInfo.total}">尾页</a></li>
			</ul>
		</nav>共${pageInfo.pages}页,共${pageInfo.total}条记录
	</div>


	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".pimg").click(function(){
				var _this = $(this);//将当前的pimg元素作为_this传入函数
				imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
			});
		});

		function imgShow(outerdiv, innerdiv, bigimg, _this){
			var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
			$(bigimg).attr("src", src);//设置#bigimg元素的src属性

			/*获取当前点击图片的真实大小，并显示弹出层及大图*/
			$("<img/>").attr("src", src).load(function(){
				var windowW = $(window).width();//获取当前窗口宽度
				var windowH = $(window).height();//获取当前窗口高度
				var realWidth = this.width;//获取图片真实宽度
				var realHeight = this.height;//获取图片真实高度
				var imgWidth, imgHeight;
				var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放

				if(realHeight>windowH*scale) {//判断图片高度
					imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
					imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
					if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
						imgWidth = windowW*scale;//再对宽度进行缩放
					}
				} else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
					imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
					imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
				} else {//如果图片真实高度和宽度都符合要求，高宽不变
					imgWidth = realWidth;
					imgHeight = realHeight;
				}
				$(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放

				var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
				var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
				$(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性
				$(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
			});

			$(outerdiv).click(function(){//再次点击淡出消失弹出层
				$(this).fadeOut("fast");
			});
		}
	function showImage(url) {
			$("#showImg").attr("src",url);
		}

		$(function() {
			$(document).on(
					"click",
					".topSave",
					function() {
						var type = $(this).attr("type");
						var goodid = $(this).attr("goodid");
						var text = $(this).attr("text");
						var old = $(this).text();
						var obj = this;
						$.post("topSave.action", {
							"goodId" : goodid,
							"type" : type
						}, function(data) {
							if (data == "ok") {
								$(obj).text(text).attr("class",
										"btn btn-info topDelete").attr("text",
										old);
								toastr.info('操作成功！')
							} else {
								toastr.error('操作失败！')
							}
						}, "text");
					});
			$(document).on(
					"click",
					".topDelete",
					function() {
						var type = $(this).attr("type");
						var goodid = $(this).attr("goodid");
						var text = $(this).attr("text");
						var old = $(this).text();
						var obj = this;
						$.post("topDelete.action", {
							"goodId" : goodid,
							"type" : type
						}, function(data) {
							if (data == "ok") {
								$(obj).text(text).attr("class",
										"btn btn-primary topSave").attr("text",
										old);
								toastr.info('操作成功！')
							} else {
								toastr.error('操作失败！')
							}
						}, "text");
					});
		});
	</script>
</body>
</html>