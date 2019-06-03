<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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
<title>员工管理</title>
</head>
<body> 


<table id="dg" title="员工" class="easyui-datagrid" style="width:650px;height:250px"
		url="${pageContext.request.contextPath }/empManager/queryEmps.action"
		toolbar="#toolbar" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="empId" width="50">员工ID</th>
			<th field="tid" width="50">租户ID</th>
			<th field="name" width="50">姓名</th>
			<th field="gender" width="50">性别</th>
			<th field="phone" width="70">联系方式</th>
			<th field="email" width="90">邮箱</th>
		</tr>
	</thead>
</table>
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newRole()">添加员工</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRole()">修改员工</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyRole()">删除员工</a>
</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">员工信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>员工id:</label>
				<input name="empId" class="easyui-textbox" required="true">
			</div>
			
			<div class="fitem">
				<label>员工名:</label>
				<input name="name" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>手机:</label>
				<input name="phone" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>密码:</label>
				<input name="pwd" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>邮箱:</label>
				<input name="email" class="easyui-textbox" >
			</div>
			<div class="fitem">
				<label>性别：</label>
                  <select class="easyui-combobox" id="cardStatusSelect" name="cardStatusSelect" style="width:100px">
                  	<option value="男">男</option>
                  	<option value="女">女</option>
                  </select>  
           	</div>

			<input type="hidden" id="type" name="type" class="easyui-textbox" value="emp" >
			<input type="hidden" id="gender" name="gender" class="easyui-textbox" value="" >
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRole()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
	</div>
	<script type="text/javascript">
		var url;
		function newRole(){
			$('#dlg').dialog('open').dialog('setTitle','新增角色');
			$('#fm').form('clear');
			url = '${pageContext.request.contextPath }/emp/add.action';
		}
		function editRole(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','修改角色');
				$('#fm').form('load',row);
				url = '${pageContext.request.contextPath }/emp/edit.action?id='+row.empId;
			}
		}
		function queryRolePermission(){

		}
		function saveRole(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					alert(result);
					var result = eval('('+result+')');
					
					if (JSON.stringify(result)!="success"){
						$.messager.show({
							title: 'Error',
							msg: result.errorMsg
						});
					} else {
						$('#dlg').dialog('close');		// close the dialog
						$('#dg').datagrid('reload');	// reload the user data
					}
				}
			});
		}
		function destroyRole(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
					if (r){
						$.post('${pageContext.request.contextPath }/emp/delete.action',{id:row.empId},function(result){
							if (result.success){
								$('#dg').datagrid('reload');	// reload the user data
							} else {
								$.messager.show({	// show error message
									title: 'Error',
									msg: result.errorMsg
								});
							}
						},'json');
					}
				});
			}
		}
		
		 $(document).ready(function () {
	    	  $('#cardStatusSelect').combobox({
	    	  onChange: function (n, o) {
	    		var type = $('#cardStatusSelect').combobox('getValue')
	    	  $("#gender").textbox('setValue',type);
	    	  }
	    	  });
	    	  });
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


</body>

</html>