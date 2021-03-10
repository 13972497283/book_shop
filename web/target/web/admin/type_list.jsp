<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>类目列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	<br>
	
	<form class="form-inline" action="/admin/typeList.do" id="serchform" method="post">
		<div class="form-group">
			<input type="text" class="form-control" id="name" name="searchName" placeholder="类目名称" style="width: 500px">
		</div>
		<a href="javascript:;" onclick="document.getElementById('serchform').submit();" type="submit" class="btn btn-primary">点击搜索</a>
	</form>
	
	<br>
	
	<div>
		<form class="form-inline" method="post" action="/admin/typeSave.do">
			<input type="text" class="form-control" id="input_name" name="cname" placeholder="输入类目名称" required="required" style="width: 500px">
			<input type="submit" class="btn btn-warning" value="添加类目"/>
		</form>
	</div>
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="10%">名称</th>
		<th width="10%">操作</th>
	</tr>
	
	<c:forEach var="type" items="${pageInfo.list}">
         <tr>
         	<td><p>${type.cid}</p></td>
         	<td><p>${type.cname}</p></td>
			<td>
				<a class="btn btn-primary" href="/admin/toSave.do?cid=${type.cid}" title="修改"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
				<a class="btn btn-danger" href="/admin/typeDelete.do?cid=${type.cid}" title="删除"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
			</td>
       	</tr>
     </c:forEach>
     
</table>
	<div style="text-align: center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li ><a href="/admin/typeList.do?page=1&searchName=${searchName==null?"":searchName}">首页</a></li>
				<c:if test="${pageInfo.pageNum==1}">
					<li class="disabled">
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=1}">
					<li >
						<a href="/admin/typeList.do?page=${pageInfo.prePage}&searchName=${searchName==null?"":searchName}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${startEnd[0]}" end="${startEnd[1]}" var="i">
					<c:if test="${pageInfo.pageNum==i}">
						<li class="active"><a href="/admin/typeList.do?page=${i}&searchName=${searchName==null?"":searchName}">${i}</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=i}">
						<li ><a href="/admin/typeList.do?page=${i}&searchName=${searchName==null?"":searchName}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageInfo.pageNum==pageInfo.lastPage}">
					<li class="disabled">
						<a href="/admin/typeList.do?page=${pageInfo.nextPage}&searchName=${searchName==null?"":searchName}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=pageInfo.lastPage}">
					<li >
						<a href="/admin/typeList.do?page=${pageInfo.nextPage}&searchName=${searchName==null?"":searchName}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<li ><a href="/admin/typeList.do?page=${pageInfo.total}&searchName=${searchName==null?"":searchName}">尾页</a></li>
			</ul>
		</nav>共${pageInfo.pages}页,共${pageInfo.total}条记录
	</div>

</div>
</body>
</html>