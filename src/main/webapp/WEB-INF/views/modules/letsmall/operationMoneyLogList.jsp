<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>购物币发放日志管理</title>
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
		<li class="active"><a href="${ctx}/letsmall/operationMoneyLog/">购物币发放日志列表</a></li>
		<%-- <shiro:hasPermission name="letsmall:operationMoneyLog:edit"><li><a href="${ctx}/letsmall/operationMoneyLog/form">购物币发放日志添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="operationMoneyLog" action="${ctx}/letsmall/operationMoneyLog/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>用户名称：</label>
				<form:input path="user.loginName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li>
				<label>发放人：</label>
				<form:input path="createBy.name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li>
				<label>发放时间：</label>
				<input name="startDate" value="<fmt:formatDate value="${optm.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" id="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false, maxDate:'#F{$dp.$D(\'endDate\')}'});"/> ~ 
					
				<input name="endDate" value="<fmt:formatDate value="${optm.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false, minDate:'#F{$dp.$D(\'startDate\')}'});"/>
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
				<th>发放/扣除购物币数量</th>
				<th>操作状态 </th>
				<th>发放人</th>
				<th>发放时间</th>
				<%-- <shiro:hasPermission name="letsmall:operationMoneyLog:edit"><th>操作</th></shiro:hasPermission> --%>
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
					<fmt:formatNumber value="${e.moneyTotal}" maxFractionDigits="2" pattern="0.00"/>
				</td>
				<td>
					${fns:getDictLabel(e.operationType, 'LETS_COIN_OPT_TYPE', '')}
				</td>
				<td>
					${e.createBy.name}
				</td>
				
				<td>
					<fmt:formatDate value="${e.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				
				<%-- <shiro:hasPermission name="letsmall:operationMoneyLog:edit"><td>
    				<a href="${ctx}/letsmall/operationMoneyLog/form?id=${operationMoneyLog.id}">修改</a>
					<a href="${ctx}/letsmall/operationMoneyLog/delete?id=${operationMoneyLog.id}" onclick="return confirmx('确认要删除该购物币发放日志吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>