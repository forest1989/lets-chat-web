<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单信息管理</title>
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
		<li class="active"><a href="${ctx}/letsmall/mallOrder/">订单信息列表</a></li>
		<%-- <shiro:hasPermission name="letsmall:mallOrder:edit"><li><a href="${ctx}/letsmall/mallOrder/form">订单信息添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="mallOrder" action="${ctx}/letsmall/mallOrder/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>订单编号：</label>
				<form:input path="orderNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li>
				<label>订单状态：</label>
				<form:select path="orderStatus" cssClass="input-small">
					<option value="">全部</option>
					<form:options items="${fns:getDictList('ORDER_STATUS')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li>
				<label>下单时间：</label>
				<input name="startDate" value="<fmt:formatDate value="${mallOrder.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" id="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false, maxDate:'#F{$dp.$D(\'endDate\')}'});"/> ~ 
					
				<input name="endDate" value="<fmt:formatDate value="${mallOrder.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
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
				<th>订单编号</th>
				<th>订单金额</th>
				<th>客户名称 </th>
				<th>客户账号 </th>
				<th>订单状态 </th>
				<th>下单时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="e">
			<tr>
				<td>
					<a href="${ctx}/letsmall/mallOrder/form?id=${e.id}">
						${e.orderNo}
					</a>
				</td>
				
				<td>
					<fmt:formatNumber value="${e.orderAmountTotal}" type="currency" pattern="￥.00"/>
				</td>
				<td>
					${e.user.nickName}
				</td>
				<td>
					${e.user.loginName}
				</td>
				<td>
					${fns:getDictLabel(e.orderStatus, 'ORDER_STATUS', '')}
				</td>
				<td>
					<fmt:formatDate value="${e.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<shiro:hasPermission name="letsmall:mallOrder:view">
						<a href="${ctx}/letsmall/mallOrder/form?id=${e.id}">详情</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="letsmall:mallOrder:edit">
						<a href="${ctx}/letsmall/mallOrder/delete?id=${e.id}" onclick="return confirmx('确认要删除该订单信息吗？', this.href)">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>