<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>角色权限查看</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<LINK rel="stylesheet" type="text/css"
	href="${baseurl}js/easyui/styles/default.css">
<%@ include file="/WEB-INF/jsp/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/common_js.jsp"%>
</head>
<body> 


<ul id="permissionTree" class="easyui-tree" >
    <c:forEach items="${menuList}" var="item">
    	<li><span>${item.name}</span>
	    	<ul>
	    		<c:forEach items="${permissionList }" var="elem">
	    			<c:if test="${elem.parentid==item.id }">
	    				<li><span>${elem.name}</span></li>
	    			</c:if>
	    		</c:forEach>	    	
	    	</ul>    	
    	</li>    
    </c:forEach>
    
    
</ul>

</body>

</html>