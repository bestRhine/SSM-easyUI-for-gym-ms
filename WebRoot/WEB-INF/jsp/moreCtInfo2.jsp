<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%--@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"  --%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
   
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>  
    <link href="css/style.css" rel="stylesheet">
    
<title>查询合同</title>
</head>
<body> 

 
<c:if test="${usercode!=null }">
	<a href="${pageContext.request.contextPath }/logout.action">退出</a>
</c:if>

<h2>合同具体信息：</h2>
<table id="contractList" title="合同基本信息" class="easyui-datagrid" style="width:600px;height:130px"		
		toolbar="#toolbar" pagination="false"
		rownumbers="false" fitColumns="true" singleSelect="true">
	<thead>
		<tr>	
			<th field="ctid" width="100">合同号</th>		
			<th field="ctteacher" width="80">教练</th>
			<th field="cttype"  width="80">类型</th>
			<th field="ctbegin"  width="120">开始日期</th>
			<th field="ctend"  width="120">结束日期</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${contractList}" var="Contract" varStatus="status">
            <tr>
				<input type="hidden" id="getCtid"  name="getCtid"  value="${Contract.ctid}">
				<td>${Contract.ctid}</td>
            	<td>${Contract.ctteacher}</td>
				<td>${Contract.cttype}</td>
				<td>${Contract.ctbegin}</td>
                <td>${Contract.ctend}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<table id="moreCtInfoList" title="课程信息" class="easyui-datagrid" style="width:600px;height:170px"		
		toolbar="#toolbar" pagination="false"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
         <tr>
         	<th field="cname" width="100">课程名</th>	
         	<th field="camounttotal" width="100">总课时数</th>	
         	<th field="camount" width="100">剩余课时</th>
        </tr>
     </thead>
     <tbody>
         <c:forEach items="${showMoreCtInfoList}" var="CtMoreInfo" varStatus="status">    <!-- 用类.属性进行索引遍历ctMoreInfoList -->
            <tr>
                
       			<td>${CtMoreInfo.cname}</td>
       			<td>${CtMoreInfo.camounttotal}</td> 
                <td>${CtMoreInfo.camount}</td>
                
            </tr>
     
      </c:forEach>    
   </tbody>  
</table>
<table id="moreMemInfoList" title="会员信息" class="easyui-datagrid" style="width:600px;height:170px"		
		toolbar="#toolbar" pagination="false"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
	    <tr>
	    	<th field="mname" width="200">会员名</th>
			<th field="mphone" width="200">电话号</th>

        </tr>
     </thead>
     <tbody>
        <c:forEach items="${showMoreMemInfoList}" var="CtMoreInfo" varStatus="status">
            <tr>    
            		
       			   <c:if test="${status.last}">
            		<td>${CtMoreInfo.mname}</td>
       			    <td>${CtMoreInfo.mphone}</td> 
            	  </c:if>       
            	  
            	   <c:if test="${!status.last}">
            	 	  <c:if test="${ctcoursetype==null}">  
            	    	  <td><font color="red">${CtMoreInfo.mname}</font></td>
       			  		  <td><font color="red">${CtMoreInfo.mphone}</font></td> 
       			 	  </c:if> 
       			 	  
       			  	 <c:if test="${ctcoursetype!=null}"> 
       			  		 <td>${CtMoreInfo.mname}</td>
       			   		 <td>${CtMoreInfo.mphone}</td> 
            	 	 </c:if>
       			   </c:if>
       			   
            </tr>
        </c:forEach>
       </tbody>
</table>



</body>

</html>