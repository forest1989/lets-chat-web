<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单信息管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/order.css" rel="stylesheet" />
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					$("#optType").val("1");	
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/letsmall/mallOrder/">订单信息列表</a></li>
		<li class="active"><a href="${ctx}/letsmall/mallOrder/form?id=${mallOrder.id}"><shiro:hasPermission name="letsmall:mallOrder:view">订单信息详情</shiro:hasPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="mallOrder" action="${ctx}/letsmall/mallOrder/updateOrderStatus" method="post" class="form-horizontal">
		<input type="hidden" name="optType" id="optType"/>
		<form:hidden path="id"/>
		<c:set var="productCount" value="0"></c:set> 
		<sys:message content="${message}"/>	
		<div class="control-group">
			<label class="control-label">订单编号：</label>
			<div class="controls">${mallOrder.orderNo}</div>
		</div>
		<c:forEach items="${productList}" var="e"  varStatus="vart">
			<c:choose>
				<c:when test="${vart.last}">
					<div class="control-group" style="border-bottom:0px">
				</c:when>
				<c:otherwise>
					<div class="control-group">
				</c:otherwise>
			</c:choose>
				<label class="control-label">					
	                  <img class="" src="${e.PRODUCT_ICO1}" title="${e.PRODUCT_NAME}&nbsp;&nbsp;${e.SPEC_NAME}" 
	                  	data-lazy-img="done" width="80" height="80">	                
				</label>
				
				<div class="controls" >
		             <div class="p-msg">
		                 <div class="p-name">${e.PRODUCT_NAME}&nbsp;&nbsp;&nbsp;&nbsp;${e.SPEC_NAME}</div>
		             </div>
		             <div class="goods-number">购买数量：${e.PRODUCT_COUNT}
	                    <c:set var="productCount" value="${productCount + e.PRODUCT_COUNT}"></c:set>
	                 </div>
	            </div>
			</div>
		</c:forEach>
		<div class="control-group">
			<label class="control-label"></label>
			<div class="controls">
				<font size="3">共${productCount}件商品&nbsp;&nbsp;&nbsp;&nbsp;</font>
				<font size="3">实付款：</font><font color="red" size="3"><fmt:formatNumber value="${mallOrder.orderAmountTotal}" type="currency" pattern="￥.00"/></font>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">下单时间：</label>
			<div class="controls">
				<fmt:formatDate value="${mallOrder.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单状态：</label>
			<div class="controls">
				<font color="red">${fns:getDictLabel(mallOrder.orderStatus, 'ORDER_STATUS', '')}</font>
			</div>
		</div>
		<c:choose>
			<c:when test="${mallOrder.orderStatus eq '02'}">
				<div class="control-group">
					<label class="control-label">物流公司：</label>
					<div class="controls">
						<form:input path="logisticsCompanyName" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">物流单号：</label>
					<div class="controls">
						<form:input path="orderlogisticsId" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="control-group">
					<label class="control-label">物流公司：</label>
					<div class="controls">
						${mallOrder.logisticsCompanyName}
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">物流单号：</label>
					<div class="controls">
						${mallOrder.orderlogisticsId}
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		
		<div class="control-group">
			<label class="control-label">收货人姓名：</label>
			<div class="controls">
				${shopAddress.shopUserName}
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">手机号码：</label>
			<div class="controls">
				${shopAddress.phone}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所在地区：</label>
			<div class="controls">
				${shopAddress.arear}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">详细地址：</label>
			<div class="controls">
				${shopAddress.addressDetail}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客户名称：</label>
			<div class="controls">
				${mallOrder.user.nickName}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客户账号：</label>
			<div class="controls">
				${mallOrder.user.loginName}
			</div>
		</div>
		<div class="form-actions">
			<c:if test="${mallOrder.orderStatus eq '02'}">
				<shiro:hasPermission name="letsmall:mallOrder:edit"><input id="sendGoods" class="btn btn-primary" type="submit" value="确认发货"/>&nbsp;</shiro:hasPermission>
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>