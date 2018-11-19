<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>广告页配置管理</title>
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
		<li class="active"><a href="${ctx}/letsmall/homeadInfoManage/">广告页配置列表</a></li>
		<shiro:hasPermission name="letsmall:homeadInfoManage:edit"><li><a href="${ctx}/letsmall/homeadInfoManage/form">广告页配置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="homeadInfoManage" action="${ctx}/letsmall/homeadInfoManage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>广告页面地址</th>
				<th>要跳转的页面</th>
				<th>图片尺寸</th>
				<th>广告持续时间</th>
				<th>广告开始时间</th>
				<th>广告结束时间</th>
				<shiro:hasPermission name="letsmall:homeadInfoManage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="homeadInfoManage">
			<tr>
			    <td>
					<a href="${ctx}/letsmall/homeadInfoManage/form?id=${homeadInfoManage.id}">
					${homeadInfoManage.content}
					</a>
				</td>
				<td>
					${homeadInfoManage.openurl}
				</td>
				<td>
					${homeadInfoManage.contentsize}
				</td>
				<td>
					${homeadInfoManage.duration}
				</td>
				<td>
					<fmt:formatDate value="${homeadInfoManage.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${homeadInfoManage.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="letsmall:homeadInfoManage:edit"><td>
    				<a href="${ctx}/letsmall/homeadInfoManage/form?id=${homeadInfoManage.id}">修改</a>
					<a href="${ctx}/letsmall/homeadInfoManage/delete?id=${homeadInfoManage.id}" onclick="return confirmx('确认要删除该广告页配置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>