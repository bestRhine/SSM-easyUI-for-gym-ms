<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<script type="text/javascript">
function deleteRoles(){
	
	//将form的action指向删除商品的地址
	document.itemsForm.action="${pageContext.request.contextPath }/empManager/deleteRoles.action";
	
	//进行form提交
	document.rolesForm.submit();
	
}
</script>
</head>
<body> 
当前用户：${usercode }  ${username }
<c:if test="${usercode!=null }">
	<a href="${pageContext.request.contextPath }/logout.action">退出</a>
</c:if>

<form name="rolesForm" action="${pageContext.request.contextPath }/items/queryItem.action" method="post">
查询条件：
<table width="100%" border=1>
<tr>
<td>
商品类别：
<select>
	<c:forEach items="${itemsType }" var="item">
			<option value="${item.key }">${item.value }</option>
	
	</c:forEach>
	
</select>
</td>
<td><input type="submit" value="查询"/>
<input type="button" value="批量删除" onclick="deleteRoles()"/>
</td>
</tr>
</table>
<shiro:hasPermission name="item:update">有商品修改权限</shiro:hasPermission>
商品列表：
<table width="100%" border=1>
<tr>	
	<td>选择</td>
	<td>角色id</td>
	<td>角色名</td>
	<td>是否可用</td>
	<td>操作</td>
	<td>rest连接</td>
</tr>
<c:forEach items="${roleList }" var="item">
<tr>
	<td><input type="checkbox" name="delete_id" value="${item.id}" /></td>
	<td>${item.id }</td>
	<td>${item.name }</td>
	<td>${item.available }</td>
	
	<td>
		<!-- 这就表示：如果有item:upadte权限则显示修改链接，若果没有，则不显示 -->
		<shiro:hasPermission name="emp:update">
			<a href="${pageContext.request.contextPath }/empManager/editRole.action?id=${item.id}">修改</a>
		</shiro:hasPermission>
	</td>
	<td><a href="${pageContext.request.contextPath }/empManager/viewRole/${item.id}">商品查看</a></td>

</tr>
</c:forEach>

</table>
</form>
</body>

</html>