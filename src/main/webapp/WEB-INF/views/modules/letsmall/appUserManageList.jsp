<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/letschatmanage/appUserManage/">用户信息列表</a></li>
		<shiro:hasPermission name="letschatmanage:appUserManage:edit"><li><a href="${ctx}/letschatmanage/appUserManage/form">用户信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="appUserManage" action="${ctx}/letschatmanage/appUserManage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户姓名</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="letschatmanage:appUserManage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="appUserManage">
			<tr>
				<td><a href="${ctx}/letschatmanage/appUserManage/form?id=${appUserManage.id}">
					${appUserManage.name}
				</a></td>
				<td>
					<fmt:formatDate value="${appUserManage.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${appUserManage.remarks}
				</td>
				<shiro:hasPermission name="letschatmanage:appUserManage:edit"><td>
    				<a href="${ctx}/letschatmanage/appUserManage/form?id=${appUserManage.id}">修改</a>
					<a href="${ctx}/letschatmanage/appUserManage/delete?id=${appUserManage.id}" onclick="return confirmx('确认要删除该用户信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>