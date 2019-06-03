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
<script type="text/javascript">
function updateContract(id,name){
	if(confirm('是否要刷【'+name+'】课程？确认已预约课程？')){
		location.href="${pageContext.request.contextPath }/updateContract.action?ctid="+id+"&cname="+name
	}else{}
}

function contractTransCourse(id,name,amount){
	var cid=id
	if(confirm('确认要把【'+name+'】课程，剩余课时【'+amount+'】转给他人？')){
		location.href="${pageContext.request.contextPath }/contractTransCourse.action?ctid="+cid
	}else{}
}

function searchTeacher(){
	var teacher = document.getElementById("teacherQuery").value
	addTeacher(teacher)
}
function addTeacher(teacher){
		$("#teacherList").html("")
		var message=""
		if(teacher!=null){
			message="{'teacher':'"+teacher+"'}"
		}else{
			message="{'teacher':''}"
		}
		$.ajax({
			type:'post',
			url: '${pageContext.request.contextPath }/getTeacherList.action',
			contentType:'application/json;charset=utf-8',
			data:message,
			success:function(data){
				for(var i=0;i<data.length;i++){
					var oldHtml=$("#teacherList").html();
					var teacherInfo="<p onclick=\"selectTeacher('"+data[i].name+"')\">"
					      +"☐&nbsp 姓名："+data[i].name+"&nbsp Tel:"+data[i].phone+"</p><hr />" 
					$("#teacherList").html(oldHtml+teacherInfo)
				} 
				$(".teacherMask").css("display","block")   
				$(".teacherMask").css("width","300px") 
			}, 
			error:function(data) {alert("操作异常！ 重试")} 
		   });
	    }
	function selectTeacher(name){
		var ctid=document.getElementById("getCtid").value	
		$.ajax({
            url : "${pageContext.request.contextPath }/changeTeacher.action",                           <!--get方式请求,url要从项目名开始重新拼接-->
            type : "get",   
            dataType: "json", 
            data : "ctid="+ctid+"&empName="+name,                <!--等价于URL后面拼接参数-->
            success:function(result) { 
                alert(result.message)   
                location.href="${pageContext.request.contextPath }/findBy.action?ctid="+ctid            <!--成功后跳转回上一级界面,重新拼接路径-->
            },
			error:function(result) {alert(result.message)} 
     	}); 
	 
	}
	
	function cancelEdit(){
		$(".teacherMask").css("display","none")
	}

</script>
</head>
<body> 

 
<c:if test="${usercode!=null }">
	<a href="${pageContext.request.contextPath }/logout.action">退出</a>
</c:if>

<h2>合同操作</h2>
<table id="contractList" title="合同基本信息" class="easyui-datagrid" style="width:600px;height:130px"		
		toolbar="#toolbar" pagination="false"
		rownumbers="false" fitColumns="true" singleSelect="true">
	<thead>
		<tr>	
			<th field="ctid" width="80">合同号</th>		
			<th field="ctteacher" width="80">教练</th>
			<th field="cttype"  width="80">类型</th>
			<th field="ctbegin"  width="140">开始日期</th>
			<th field="ctend"  width="140">结束日期</th>
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
         	<th field="ctfresh" width="100">刷课</th>	
			<c:if test="${ctcoursetype==null}">
			<th field="cttrans" width="100">转课</th>
			<th field="ctchange" width="100">更换教练</th>
			</c:if>
        </tr>
     </thead>
     <tbody>
         <c:forEach items="${showMoreCtInfoList}" var="CtMoreInfo" varStatus="status">    <!-- 用类.属性进行索引遍历ctMoreInfoList -->
            <tr>
                
       			<td>${CtMoreInfo.cname}</td>
       			<td>${CtMoreInfo.camounttotal}</td> 
                <td>${CtMoreInfo.camount}</td>
                
 				
                <td>
                <a href="javascript:updateContract('${CtMoreInfo.ctid}','${CtMoreInfo.cname}')"><button class="btn" >刷课</button>	</a>				
                </td> 
                
                 <c:if test="${ctcoursetype==null}">              
                <td>
                <a href="javascript:contractTransCourse('${CtMoreInfo.ctid}','${CtMoreInfo.cname}','${CtMoreInfo.camount}')"><button class="btn" >转课</button></a>
                </td>
                <td>
                <button class="btn" onclick="addTeacher(null)" >更换教练</button>
                </td>
           		</c:if>
            </tr>
     
      </c:forEach>    
   </tbody>  
</table>
<div class="teacherMask">
	<div style="background-color:#E0ECFF;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	教练信息<font style="float:right;padding-right:10px;" onclick="cancelEdit()">X</font>
	</div>
	
	<input  id="teacherQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchTeacher()">查询</button>
	<div id="teacherList" style="border:2px solid #CCC;height:200px;overflow-y:scroll;">
	
	</div>
 
</div>
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