<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%--@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" --%> 
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
	
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>  
    <link href="css/style.css" rel="stylesheet">
<meta charset="UTF-8">
 <title>合同管理 - 转课页面</title>

 <script type="text/javascript">
function checkTransContract(){ 
        if($("#mname").val()==null||$("#mname").val()==""){
            alert("会员名不能为空！");
            return false;
        }      
        var phone = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/
        if(!(phone.test($("#mphone").val())&&phone.test($("#mphone").val()))) 
        { 
            alert("请输入正确完整的电话号码！"); 
            return false; 
        } 
        
        if($("#ctpay").val()==null||$("#ctpay").val()==""){
            alert("转课手续费不能为空！");
            return false;
        }
        if($("#ctoperator").val()==null||$("#ctoperator").val()==""){
            alert("操作员工不能为空！");
            return false;
        }
             
        return true;
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
 
<c:if test="${usercode!=null }">
	<a href="${pageContext.request.contextPath }/logout.action">退出</a>
</c:if>

<div id="dlg" class="easyui-dialog" style="width:420px;height:320px;padding:10px 20px"  title="转课"
			closed="false" buttons="#dlg-buttons">
		<div class="ftitle">会员间转课</div>
		<form id="fm" method="post" novalidate action="${pageContext.request.contextPath }/transContract.action" role="form">
			<div class="fitem">
				<label>转让合同号:</label>
				<c:if test="${ctid!=null}">
				<td><c:if test="${ctid!=null}"><font color="red">${ctid}</font></c:if>
				</c:if>
			</div>
			    <td><input type="hidden" name="ctid" id="ctid" value="${ctid}"></td>
			<div class="fitem">
				<label>姓名:</label>
				<input name="mname" id="mname" class="easyui-textbox" data-options="required:true,validType:'length[2,10]'">						
			</div>
			<div class="fitem">
				<label>电话:</label>
				<input name="mphone" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>手续费:</label>
				<input name="ctpay" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>操作员工：</label>
				<input name="ctoperator" class="easyui-textbox" required="true">
			</div>
			
				<input name="ctidhidden" id="ctidhidden" class="easyui-textbox" type="hidden" value="${ctid}">
		 	 <tr class="submitTR" align="center">
                        <td colspan="2" align="center">
                            <%--input type="hidden" name="cid" value="${cid}"--%>
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
         </tr>
		</form>
		
		
 
</div>
		


</body>
</html>