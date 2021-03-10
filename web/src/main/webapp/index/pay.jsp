<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>支付</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/flexslider.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	<div class="cart-items">
		<div class="container" style="margin-left:30%;border:0px solid black;">
			<div style="text-align:center;margin-left:20%;border:0px solid red">
				<h2>确认收货信息</h2>
			</div>
			<form class="form-horizontal" action="pay" method="post" id="payform">
				<input type="hidden" name="id" value="${order.id}">
				<input type="hidden" name="paytype" id="paytype">
				<div class="row">
					<label class="control-label col-md-1">收货人</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="name" value="${user.name}" style="height:auto;padding:10px;" placeholder="输入收货人" required="required" id="fname"><br>
					</div>
				</div>
				<div class="row">
					<label class="control-label col-md-1">收货电话</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="phone" value="${user.phone}" style="height:auto;padding:10px;" placeholder="输入收货电话" required="required" id="fphone"><br>
					</div>
				</div>
				<div class="row">
					<label class="control-label col-md-1">收货地址</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="address" value="${user.address}" style="height:auto;padding:10px;" placeholder="输入收货地址" required="required" id="faddress"><br>
					</div>
				</div>
				<div class="row">
					<label class="control-label col-md-1">支付金额</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="address" value="${order.total}" disabled=true style="height:auto;padding:10px;" placeholder="" required="required" id="faddress"><br>
					</div>
				</div>
				<div class="row">
			    	<label class="control-label col-md-1">支付方式</label>
				    <div class="col-sm-6">	
						<select class="form-control" id="paytype1">
							<option value="1">微信支付</option>
							<option value="2">支付宝</option>
							<option value="3">到付</option>
						</select>
				    </div>
				</div>
				<div class="row">
					<br>
			    	<div class="col-md-4 col-md-offset-2">			
						<button class="btn btn-lg btn-primary btn-block" onclick="dopay()" type="button">提交订单</button>
					</div>
				</div>
			    <div class="col-sm-4 tips"></div>
			</form>
			
			
			<br><hr><br>
			
		</div>
	</div>

	<jsp:include page="footer.jsp"/>
	
<script type="text/javascript">
	function dopay(){
		var paytype = $("#paytype1").val();
		// 信息校验
		var name = $("#fname").val();
		if(name==null || name==""){
			layer.msg("请正确填写收货人!");
			return;
		}
		var phone = $("#fphone").val();
		if(phone==null || phone=="" || !/^[0-9]*$/.test(phone)){
			layer.msg("请正确填写收货电话!");
			return;
		}
		var address = $("#faddress").val();
		if(address==null || address==""){
			layer.msg("请正确填写收货地址!");
			return;
		}
		
		$("#paytype").val(paytype);
		$("#payform").submit();
	}
</script>

</body>
</html>