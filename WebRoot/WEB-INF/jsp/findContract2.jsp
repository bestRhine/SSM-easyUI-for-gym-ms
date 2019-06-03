<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<%--@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" --%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/gymms/js/easyui/plugins/jquery.combo.js"></script>   <!-- 这个放到最前面，防止被覆盖，和顺序与关 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>


<title>查询合同</title>

<script type="text/javascript">
	
function getType(){
	var type= document.getElementsByName("ctcoursetype")
	for(var i=0;i<type.length;i++){
		if(type[i].checked){
			$("#ctcoursetype").val(type[i].value)
		}
	}
	
}
function formCt(){
	$("#fm").submit();
}
</script>

<!-- 借用Formatter和Parser函数，其中Formatter函数使得选择日期后将其格式化为我们需要的格式，Parser是分析字符串的函数，这个函以’date’为参数并返回一个日期	 -->
<script type="text/javascript">
function ww4(date){
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	var str = y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	return str;
}
function w4(s){
	if (!s) return new Date();
	var y = s.substring(0,4);
	var m =s.substring(5,7);
	var d = s.substring(8,10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
		return new Date(y,m-1,d);
	} else {
		return new Date();
	}
}


</script>


<style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
		.fitem input{
			width:160px;
		}
	</style>

</head>
<body> 

<c:if test="${msgUser!=null }">
	<a href="${pageContext.request.contextPath }/logout.action">退出</a>
</c:if>


<div id="ct"  style="width:620px;height:180px;padding:5px 0px">
		<div class="ftitle">合同查询条件：</div>
		<form id="fm"  method="get"  action="${pageContext.request.contextPath }/findBy.action?ctteacher=${ctteacher}&ctbegin=${ctbegin}&ctend=${ctend}&ctid=${ctid}&ctcoursetype=${ctcoursetype}&mname=${mname}&cname=${cname}">
		

					<div class="fitem">
					    <label>合同号:</label>
                        <input name="ctid" id="ctid" class="easyui-textbox"  prompt="输入合同号查询">
                        <label>&nbsp;&nbsp;会员名:</label>
                        <input name="mname"  class="easyui-textbox"  prompt="输入会员名查询">                 
                    </div>                                      
                        
					<div class="fitem">
                        <label>教练名:</label>
                        <input name="ctteacher"  class="easyui-textbox"  prompt="输入教练名查询">                    
                        <label>&nbsp;&nbsp;课程名:</label>
                        <input name="cname"  class="easyui-textbox"  prompt="输入课程名查询">                   
                    </div>
                     
                     <div class="fitem">
                        <label>日期：</label>
                        <input name="ctbegin" id="ctbegin" class="easyui-datebox" data-options="formatter:ww4,parser:w4" prompt="输入开始日期查询">
                        <label>&nbsp;&nbsp;--到--</label>
                        <input name="ctend"  id="ctend"  class="easyui-datebox" data-options="formatter:ww4,parser:w4"  prompt="输入结束日期查询">
                    </div>
                    
 					<tr>
 						<label>合同类型:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                       <td> <input type="radio" name="ctcoursetype" id="ctcoursetype"  value="私课" onclick="getType()">私课&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><input type="radio" name="ctcoursetype" id="ctcoursetype"  value="组课" onclick="getType()">组课</td>
                    </tr>     
                    

  </form>
</div>
<div id="dlg-buttons">
<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-search" onclick="formCt()" style="width:90px">查询</a>
</div>

</br></br>

<table id="contractList" title="合同列表" class="easyui-datagrid" style="width:900px;height:400px"		
		toolbar="#toolbar" pagination="false"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="ctid" width="100">合同号</th>	
			<th field="tid" width="80">租户</th>		
			<th field="ctteacher" width="80">教练</th>
			<th field="ctsaler"  width="80">售课人</th>
			<th field="ctbegin" width="100">开始日期</th>
			<th field="ctend" width="100">结束日期</th>
			<th field="ctorder" width="80">订单</th>
			<th field="ctpay" width="80">实付</th>
			<th field="ctoperator" width="80">操作人</th>
			<th field="cttype" width="80">类型</th>
			<th field="ctMoreInfo" width="60">详细</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${contractList}" var="Contract" varStatus="status">
            <tr>
            	<td>${Contract.ctid}</td>
                <td>${Contract.tid}</td>
                <td>${Contract.ctteacher}</td>
                <td>${Contract.ctsaler}</td>
                <td>${Contract.ctbegin}</td>
                <td>${Contract.ctend}</td>
                
				<td>${Contract.ctorder}</td> 
			    <td>${Contract.ctpay}</td>
				<td>${Contract.ctoperator}</td>
				
				<td>${Contract.cttype}</td>

				
                <td><a href="${pageContext.request.contextPath}/showMoreInfoIgnoreEdit.action?ctid=${Contract.ctid}" class="easyui-linkbutton" iconCls="icon-add" plain="true" ></a></td>

            </tr>
      </c:forEach>
	</tbody>
</table>
<div id="msg"  data-options="region:'center'">
 	<c:if  test="${resultMessage!=null}">
       <b><font  color="red">&nbsp;&nbsp;${resultMessage}</b>
    </c:if>
</div>
</body>

</html>