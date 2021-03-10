<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>商品编辑</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
<style>
	#table1 tr td{
		border:0px solid red;
		text-align:center
	}
	#table1 tr td img{
		margin:0 auto;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<br><br>
	<form class="form-horizontal" action="/admin/goodSave.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pid" value="${good.pid}"/>
		<input type="hidden" name="aa" value="${good.imgurl}"/>
		
		<div style="border:0px solid red;height:300px;width:60%;">
			<table id="table1" style="width:60%;margin-left:10%;text-align: center">
				<tr>
					<td>
						<div class="form-group">
							<label for="input_file" class="">封面图片</label> 
							<br>
							<div class="col-sm-6">
								<img src="${good.imgurl}" width="200" height="200"/>
								<br>
								<br>
								<input type="file" name="imgurl"  id="input_file">
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<%-- <div class="form-group">
			<label for="input_file" class="col-sm-1 control-label">封面图片</label> 
			<div class="col-sm-6"><img src="../${good.cover}" width="100" height="100"/>
				<input type="file" name="cover"  id="input_file">
			</div>
		</div>
		<div class="form-group">
			<label for="input_file" class="col-sm-1 control-label">详情图片1</label> 
			<div class="col-sm-6"><img src="../${good.image1}" width="100" height="100"/>
				<input type="file" name="image1"  id="input_file">
			</div>
		</div>
		<div class="form-group">
			<label for="input_file" class="col-sm-1 control-label">详情图片2</label> 
			<div class="col-sm-6"><img src="../${good.image2}" width="100" height="100"/>
				<input type="file" name="image2"  id="input_file">
			</div>
		</div> --%>
		
		
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="pname" value="${good.pname}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">价格</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="price" value="${good.price}">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">介绍</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="pdesc" value="${good.pdesc}">
			</div>
		</div>
		<div class="form-group">
			<label for="select_topic" class="col-sm-1 control-label">类目</label>
			<div class="col-sm-6">
				<select class="form-control" id="select_topic" name="cid">
					<c:forEach var="type" items="${typeList}">
						<c:if test="${type.cid==good.cid}"><option selected="selected" value="${type.cid}">${type.cname}</option></c:if>
						<c:if test="${type.cid!=good.cid}"><option value="${type.cid}">${type.cname}</option></c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" class="btn btn-success">提交修改</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>