<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
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
		
		function addProSpe(){
			var proSpecIndex = parseInt($("#proSpecIndex").val()) + 1;
			var divNum = $(".pro-spec").length + 1;
			if(divNum > 3){
				top.$.jBox.tip("最多可以添加3个规格");
			}else{
				var htmlStr = "<div class=\"control-group pro-spec\"><label class=\"control-label\">规格名称：</label><div class=\"controls\">";
				htmlStr += "<input name=\"proSpecList["+ proSpecIndex +"].specName\" type=\"text\" maxlength=\"200\" class=\"input-large required\"/>";
				htmlStr += "<span class=\"help-inline\"><font color=\"red\">*</font>";
				htmlStr += " &nbsp;&nbsp;&nbsp;&nbsp;规格价格：";
				htmlStr += "<input name=\"proSpecList["+ proSpecIndex +"].specPrice\" type=\"text\" maxlength=\"200\" class=\"input-mini required number\"/>";
				htmlStr += "<span class=\"help-inline\"><font color=\"red\">*</font> </span>";
				htmlStr += " &nbsp;&nbsp;&nbsp;&nbsp;库存数量：";
				htmlStr += "<input name=\"proSpecList["+ proSpecIndex +"].stockNum\" type=\"text\" maxlength=\"200\" class=\"input-mini required digits\"/>";
				htmlStr += "<span class=\"help-inline\"><font color=\"red\">*</font> </span>";
				htmlStr += " &nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"delProSpe(this)\">移除规格</a>";
				htmlStr += "</div>";
				$("#proSpecDiv").append(htmlStr);
				$("#proSpecIndex").val(proSpecIndex)
			}
		}
		
		function delProSpe(obj){
			$(obj).parent().parent().parent().remove();
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/letsmall/mallProductManage/">商品信息列表</a></li>
		<li class="active"><a href="${ctx}/letsmall/mallProductManage/form?id=${mallProductManage.id}">商品信息<shiro:hasPermission name="letsmall:mallProductManage:edit">${not empty mallProductManage.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="letsmall:mallProductManage:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="mallProductManage" action="${ctx}/letsmall/mallProductManage/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		
		<div class="control-group">
			<label class="control-label">商品名称：</label>
			<div class="controls">
				<form:input path="productName" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">库存数量：</label>
			<div class="controls">
				<form:input path="stockNum" htmlEscape="false" maxlength="18" class="input-xlarge required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">商品类别：</label>
			<div class="controls">
				<form:select path="productTypeId" cssClass="input-small required">
					<form:options items="${fns:getDictList('PRODUCT_TYPE')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
				<a></a>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">商品状态：</label>
			<div class="controls">
				<form:select path="stauts" cssClass="input-small required">
					<form:options items="${fns:getDictList('PRO_STATUS')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品ICO：</label>
			<div class="controls">
				<form:hidden id="ico1Image" path="productIco1" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="ico1Image" type="images" uploadPath="/app/product_ico" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品图片：</label>
			<div class="controls">
				<form:hidden id="productImage" path="productImg1" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="productImage" type="images" uploadPath="/app/product_img" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品描述：</label>
			<div class="controls">
				<form:hidden id="detailImage" path="productDetailImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="detailImage" type="images" uploadPath="/app/product_detail" selectMultiple="true" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">规格名称：</label>
			<div class="controls">
				<input type="hidden" id="proSpecIndex" value="${fn:length(mallProductManage.proSpecList)}"/>
				<form:input path="proSpecList[0].specName" htmlEscape="false" maxlength="200" class="input-large required"/>
				<span class="help-inline"><font color="red">*</font>
				&nbsp;&nbsp;规格价格：
				<form:input path="proSpecList[0].specPrice" htmlEscape="false" maxlength="200" class="input-mini required number"/>
				<span class="help-inline"><font color="red">*</font> </span>
				&nbsp;&nbsp;库存数量：
				<form:input path="proSpecList[0].stockNum" htmlEscape="false" maxlength="200" class="input-mini required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>				
				&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="addProSpe()">增加规格</a>&nbsp;&nbsp;&nbsp;<font color="red">(该价格为商品默认价格)</font>
			</div>
		</div>
		<div id="proSpecDiv">
			<c:if test="${not empty mallProductManage.id}">
				<c:forEach items="${mallProductManage.proSpecList}" var="e" varStatus="vs" begin="1">
					<div class="control-group pro-spec">
						<label class="control-label">规格名称：</label>
						<div class="controls">
							<form:input path="proSpecList[${vs.index}].specName" htmlEscape="false" maxlength="200" class="input-large required"/>
							<span class="help-inline"><font color="red">*</font>
							&nbsp;&nbsp;规格价格：
							<form:input path="proSpecList[${vs.index}].specPrice" htmlEscape="false" maxlength="200" class="input-mini required number"/>
							<span class="help-inline"><font color="red">*</font> </span>
							&nbsp;&nbsp;库存数量：
							<form:input path="proSpecList[${vs.index}].stockNum" htmlEscape="false" maxlength="200" class="input-mini required digits"/>
							<span class="help-inline"><font color="red">*</font> </span>						
							&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="delProSpe(this)">移除规格</a>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="letsmall:mallProductManage:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>