<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>客户列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	<form class="form-inline" action="/admin/userList.do" id="serchform" method="post">
		<div class="form-group">
			<input type="text" class="form-control" id="name" name="searchName" placeholder="用户名">
		</div>
		<a href="javascript:;" onclick="document.getElementById('serchform').submit();" type="submit" class="btn btn-primary">点击搜索</a>
		<a href="/admin/toUserAdd.do"  class="btn btn-primary">添加客户</a>
	</form>
	
	<br>
	
	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="10%">用户名</th>
		<th width="10%">收货人</th>
		<th width="10%">电话</th>
		<th width="10%">邮箱</th>
		<th width="10%">操作</th>
	</tr>
	
	<c:forEach var="user" items="${pageInfo.list}">
         <tr>
         	<td><p>${user.uid}</p></td>
         	<td><p>${user.username}</p></td>
         	<td><p>${user.name}</p></td>
         	<td><p>${user.phone}</p></td>
         	<td><p>${user.email}</p></td>
			<td>
				<%-- <a class="btn btn-info" href="userRe?id=${user.id}" title="修改密码"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></a> --%>
				<a class="btn btn-primary" href="/admin/userEdit.do?uid=${user.uid}" title="修改"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
				<a class="btn btn-danger" href="/admin/userDelete.do?uid=${user.uid}" title="删除"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
			</td>
       	</tr>
     </c:forEach>
     
</table>
	<div style="text-align: center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li ><a href="/admin/userList.do?page=1&searchName=${searchName==null?"":searchName}">首页</a></li>
				<c:if test="${pageInfo.pageNum==1}">
					<li class="disabled">
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=1}">
					<li >
						<a href="/admin/userList.do?page=${pageInfo.prePage}&searchName=${searchName==null?"":searchName}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${startEnd[0]}" end="${startEnd[1]}" var="i">
					<c:if test="${pageInfo.pageNum==i}">
						<li class="active"><a href="/admin/userList.do?page=${i}&searchName=${searchName==null?"":searchName}">${i}</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=i}">
						<li ><a href="/admin/userList.do?page=${i}&searchName=${searchName==null?"":searchName}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageInfo.pageNum==pageInfo.lastPage}">
					<li class="disabled">
						<a href="/admin/userList.do?page=${pageInfo.nextPage}&searchName=${searchName==null?"":searchName}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageInfo.pageNum!=pageInfo.lastPage}">
					<li >
						<a href="/admin/userList.do?page=${pageInfo.nextPage}&searchName=${searchName==null?"":searchName}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<li ><a href="/admin/userList.do?page=${pageInfo.total}&searchName=${searchName==null?"":searchName}">尾页</a></li>
			</ul>
		</nav>共${pageInfo.pages}页,共${pageInfo.total}条记录
	</div>

<br>${pageTool}<br>
</div>
</body>
</html>