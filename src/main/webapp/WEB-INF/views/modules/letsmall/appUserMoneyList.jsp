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
		
		var submit = function (v, h, f) {
			if(v == 'ok'){	
				var moneySendNum = $("#moneyNum").val();
				if(moneySendNum == null || moneySendNum == ""){
					top.$.jBox.tip("请输入数量");
					return false;
				}else{
					if(isNaN(moneySendNum)){
						top.$.jBox.tip("请输入正确的数量");
						return false;
					}else{
						if(moneySendNum.indexOf('.') > -1){
							if(moneySendNum.toString().split(".")[1].length > 2){
								top.$.jBox.tip("小数位数不能超过2位");
								return false;
							}
						}						
					}
				}
				$("#moneySendNum").val(moneySendNum);
				$("#moneySendForm").submit();
				return true;
			}
		    
		};
		function moneySend(id, moneyTotal, appUserId){
			$("#userMid").val(id);
			$("#appUserId").val(appUserId);
			$("#moneyTotal").val(moneyTotal);
			var html = "<div style=\"margin: 20px 0 0 20px\"><label class=\"control-label\" style=\"float: left;width: 100px;text-align: right\">发放/扣除数量：</label>";
			html += "<div class=\"controls\"><input name=\"moneyNum\" id=\"moneyNum\" htmlEscape=\"false\" maxlength=\"200\" type=\"text\" class=\"input-medium required\"/></div>";
			html += "<label class=\"control-label\" style=\"float: left;width: 100px\">&nbsp;</label>";
			html += "<div class=\"controls\"><font color=\"red\">输入正数为增加操作,输入负正数为扣除操作</font></div>";
			html += "</div>";
			$.jBox.open(html, "发放/扣除购物币", 500, 200, { showType: 'show', submit: submit});	
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/letsmall/appUserMoney/">购物币列表</a></li>
		<%-- <shiro:hasPermission name="letsmall:appUserMoney:edit"><li><a href="${ctx}/letsmall/appUserMoney/form">购物币添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="moneySendForm" method="post" action="${ctx}/letsmall/appUserMoney/moneySend">
		<input type="hidden" name="appUserId" id="appUserId" />
		<input type="hidden" name="moneySendNum" id="moneySendNum" />
		<input type="hidden" name="userMid" id="userMid" />
		<input type="hidden" name="moneyTotal" id="moneyTotal" />
	</form:form>
	
	<form:form id="searchForm" modelAttribute="appUserMoney" action="${ctx}/letsmall/appUserMoney/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
				<label>用户账号：</label>
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
    				<a href="javascript:void(0);" onclick="moneySend('${e.id}', ${e.moneyTotal}, '${e.user.id}')">发送/扣除购物币</a>
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