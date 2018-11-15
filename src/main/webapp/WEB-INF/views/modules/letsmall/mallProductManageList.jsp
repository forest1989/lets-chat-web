<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品信息管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#allCheck").click(function () {
		        if (this.checked) {
		            $("input[name=producCheck]:checkbox").prop("checked", true);
		        } else {
		            $("input[name=producCheck]").prop("checked", false);
		        }
		    });
			
			// 批量上架
			$("#putBt").click(function (){
				loading('正在提交，请稍等...');
				if(getCheckVal()){
					$("#optType").val("1");	
					$("#batchForm").submit();
					return false;
				}
			});
			// 批量下架
			$("#pullBt").click(function (){
				loading('正在提交，请稍等...');
				if(getCheckVal()){
					$("#optType").val("2");
					$("#batchForm").submit();
					return false;
				}
			});
			// 批量删除
			$("#delBt").click(function (){
				loading('正在提交，请稍等...');
				if(getCheckVal()){
					$("#optType").val("3");	
					$("#batchForm").submit();
					return false;
				}
			});
			
		});
		
		function getCheckVal(){
			var idsArray = new Array();
			$.each($("input[name='producCheck']"),function(){
				if(this.checked){
					var id = $(this).val();
	                idsArray.push(id);
				}
			});
			if(!$.isArray(idsArray)){
				top.$.jBox.tip("请选择需要操作的数据");
				return false;
		    }else if(idsArray.length < 1){
		    	top.$.jBox.tip("请选择需要操作的数据");
		    	return false;
		    }else{
		    	$("#ids").val(idsArray); 
		    	return true;
		    }       
		}
		
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
		<li class="active"><a href="${ctx}/letsmall/mallProductManage/">商品信息列表</a></li>
		<shiro:hasPermission name="letsmall:mallProductManage:edit"><li><a href="${ctx}/letsmall/mallProductManage/form">商品信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="batchForm" method="post" action="${ctx}/letsmall/mallProductManage/batchOpt/">
		<input type="hidden" name="ids" id="ids">
		<input type="hidden" name="optType" id="optType">
	</form:form>
	<form:form id="searchForm" modelAttribute="mallProductManage" action="${ctx}/letsmall/mallProductManage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>商品编号：</label>
				<form:input path="productNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li>
				<label>商品类别：</label>
				<form:select path="productTypeId" cssClass="input-small">
					<option value="">全部</option>
					<form:options items="${fns:getDictList('PRODUCT_TYPE')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="clearfix"></li>
			<li>
				<label>商品名称：</label>
				<form:input path="productName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>			
			<li>
				<label>商品状态：</label>
				<form:select path="stauts" cssClass="input-small">
					<option value="">全部</option>
					<form:options items="${fns:getDictList('PRO_STATUS')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="btns"><input id="putBt" class="btn btn-success" type="button" value="批量上架"/></li>
			<li class="btns"><input id="pullBt" class="btn btn-success" type="button" value="批量下架"/></li>
			<li class="btns"><input id="delBt" class="btn btn-danger" type="button" value="批量删除"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th width="20px"><input type="checkbox" id="allCheck"/></th>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>商品价格</th>
				<th>商品类别</th>
				<th>商品状态</th>
				<shiro:hasPermission name="letsmall:mallProductManage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="e">
			<tr>
				<td><input type="checkbox" name="producCheck" value="${e.id}"/></td>
				<td>
					<shiro:hasPermission name="letsmall:mallProductManage:view">
						<a href="${ctx}/letsmall/mallProductManage/form?id=${e.id}">
							${e.productNo}
						</a>
					</shiro:hasPermission>
					
				</td>
				<td>
					${e.productName}
				</td>
				<td>
					<fmt:formatNumber value="${e.proSpec.specPrice}" type="currency" pattern="￥.00"/>
				</td>
				<td>
					${fns:getDictLabel(e.productTypeId, 'PRODUCT_TYPE', '')}
				</td>
					
				<td>
					${fns:getDictLabel(e.stauts, 'PRO_STATUS', '')}
				</td>
					
				<shiro:hasPermission name="letsmall:mallProductManage:edit">
					<td>
	    				<a href="${ctx}/letsmall/mallProductManage/form?id=${e.id}">修改</a>
						<a href="${ctx}/letsmall/mallProductManage/delete?id=${e.id}" onclick="return confirmx('确认要删除该商品信息管理吗？', this.href)">删除</a>
					</td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>