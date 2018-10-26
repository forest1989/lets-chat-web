<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>购物币管理</title>
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
		<li class="active"><a href="${ctx}/letsmall/appUserMoney/">购物币列表</a></li>
		<%-- <shiro:hasPermission name="letsmall:appUserMoney:edit"><li><a href="${ctx}/letsmall/appUserMoney/form">购物币添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="appUserMoney" action="${ctx}/letsmall/appUserMoney/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>用户名称：</label>
				<form:input path="user.loginName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li>
				<label>电话号码：</label>
				<form:input path="user.phone" htmlEscape="false" maxlength="100" class="input-medium"/>
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
				<th>用户名称</th>
				<th>手机号码</th>
				<th>购物币余额</th>
				<th>购物币使用状态</th>
				<shiro:hasPermission name="letsmall:appUserMoney:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="e">
			<tr>
				<td>
					${e.user.loginName}
				</td>
				<td>
					${e.user.nickName}
				</td>
				<td>
					${e.user.phone}
				</td>
				<td>
					<fmt:formatNumber value="${e.moneyTotal}" pattern="#,#00.0#"/>
				</td>
				<td>
					${fns:getDictLabel(e.stauts, 'LETS_COIN', '')}
				</td>
				
				<shiro:hasPermission name="letsmall:appUserMoney:edit"><td>
    				<a href="${ctx}/letsmall/appUserMoney/form?id=${appUserMoney.id}">发送/扣除购物币</a>
    				<a href="${ctx}/letsmall/appUserMoney/form?id=${appUserMoney.id}">禁用</a>
					<%-- <a href="${ctx}/letsmall/appUserMoney/delete?id=${appUserMoney.id}" onclick="return confirmx('确认要删除该购物币吗？', this.href)">删除</a> --%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>