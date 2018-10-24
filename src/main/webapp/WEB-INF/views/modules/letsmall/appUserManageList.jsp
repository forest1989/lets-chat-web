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
		<li class="active"><a href="${ctx}/letsmall/appUserManage/">用户信息列表</a></li>
		<%-- <shiro:hasPermission name="letsmall:appUserManage:edit"><li><a href="${ctx}/letsmall/appUserManage/form">用户信息添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="appUserManage" action="${ctx}/letsmall/appUserManage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户姓名：</label>
				<form:input path="loginName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>电话号码：</label>
				<form:input path="phone" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户账号</th>
				<th>用户昵称</th>
				<th>电话号码</th>
				<shiro:hasPermission name="letsmall:appUserManage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="appUserManage">
			<tr>
				<td><a href="${ctx}/letsmall/appUserManage/form?id=${appUserManage.id}">
					${appUserManage.loginName}
				</a></td>
				<td>
					${appUserManage.nickName}
					<%-- <fmt:formatDate value="${appUserManage.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
				</td>
				<td>
					${appUserManage.phone}
				</td>
				<shiro:hasPermission name="letsmall:appUserManage:edit"><td>
    				<a href="${ctx}/letsmall/appUserManage/form?id=${appUserManage.id}">修改</a>
					<a href="${ctx}/letsmall/appUserManage/delete?id=${appUserManage.id}" onclick="return confirmx('确认要删除该用户信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>