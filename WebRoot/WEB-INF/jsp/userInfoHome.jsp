<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
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
	
	
<title>会员管理</title>


</head>
<body> 


<table id="userlist" title="会员" class="easyui-datagrid" style="width:80%;height:auto"
		toolbar="#toolbar" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="username" width="200">会员名</th>
			<th field="phone" width="200">手机</th>
			<th field="sex" width="200">性别</th>
			<th field="emergencyContactNumber" width="200">紧急联系方式</th>
			<th field="registerDate" width="200">注册日期</th>
			<th field="timeCardRemainingDate" width="200">时间卡截止日期</th>
			<th field="timesCardRemainingTimes" width="200">次数卡剩余次数</th>

		</tr>
	</thead>
	
	<%-- 
	<tbody>
		<c:forEach items="${list}" var="UserInfo" varStatus="status">
		 	<tr>
		 		<td>${UserInfo.userNumber}</td>
		 		<td>${UserInfo.weixin}</td>
		 		<td>${UserInfo.username}</td>
		 		<td>${UserInfo.phone}</td>
		 		
		 	</tr>
		</c:forEach>
	</tbody>
	--%>
	
</table>
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUserInfo()">添加会员</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUserInfo()">修改会员</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteUserInfo()">删除会员</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"  plain="true" onclick="queryUserInfoPermission()">查看会员权限</a>
	<input name="username" id="usernamesearch" class="easyui-textbox" required="true" prompt="输入会员名查询">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchUser()">查询会员</a>
</div>


	<div id="adddlg" class="easyui-dialog" style="width:420px;height:300px;padding:10px 20px"
			closed="true" buttons="#adddlg-buttons">
		<div class="ftitle">会员信息</div>
		<form id="addfm" method="post" novalidate>		
			<div class="fitem">
				<label>微信：</label>
				<input name="weixin" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>会员名:</label>
				<input name="username" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>手机号：</label>
				<input name="phone" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>性别：</label>
				<input name="sex" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>紧急联系方式：</label>
				<input name="emergencyContactNumber" class="easyui-textbox" required="true">
			</div>					
		</form>
	</div>
	
	<div id="editdlg" class="easyui-dialog" style="width:420px;height:300px;padding:10px 20px"
			closed="true" buttons="#editdlg-buttons">
		<div class="ftitle">会员信息</div>
		<form id="editfm" method="post" novalidate>		
			<div class="fitem">
				<label>微信：</label>
				<input name="weixin" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>会员名:</label>
				<input name="username" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>手机号：</label>
				<input name="phone" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>性别：</label>
				<input name="sex" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>紧急联系方式：</label>
				<input name="emergencyContactNumber" class="easyui-textbox" required="true">
			</div>	
			<input type="hidden" name="userNumber" class="easyui-textbox" required="true">						
		</form>
	</div>
	
	<div id="adddlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="addUserInfoDlg()" style="width:90px">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#adddlg').dialog('close')" style="width:90px">取消</a>
	</div>
	
	<div id="editdlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="editUserInfoDlg()" style="width:90px">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#editdlg').dialog('close')" style="width:90px">取消</a>
	</div>
	
	<script type="text/javascript">
	var url;
		$(function(){
      	 $("#userlist").datagrid({ loadFilter: pagerFilter }).datagrid({
           title:'会员列表', 
           url : "${pageContext.request.contextPath }/userInfo/list.action",
           columns:[[
                   {field:'username',title:'会员名',width:250,align:'left'},
                   {field:'phone',title:'手机',width:150,align:'left'},
                   {field:'sex',title:'性别',width:100,align:'left'},
                   {field:'emergencyContactNumber',title:'紧急联系方式',width:100,align:'left'},
                   {field:'timeCardEffectiveDate',title:'时间卡截止日期',width:100,align:'left'},
                   {field:'timesCardRemainingTimes',title:'次数卡剩余次数',width:100,align:'left'}
					]],
           loadMsg:"数据正在加载中，请稍后......",
        });
 	   });
		
		function addUserInfo(){
			$('#adddlg').dialog('open').dialog('setTitle','新增会员');
			$('#addfm').form('clear');
			url = '${pageContext.request.contextPath }/userInfo/add.action';
		}
		function editUserInfo(){
			var row = $('#userlist').datagrid('getSelected');
			if (row){
				$('#userNumber').textbox('setValue',row.userNumber);
				$('#editdlg').dialog('open').dialog('setTitle','修改会员');
				$('#editfm').form('load',row);
				url ='${pageContext.request.contextPath }/userInfo/edit.action';
			}
		}
	
		function queryUserInfoPermission(){

		}
		
		function searchUser(){
	    	var username=$('#usernamesearch').textbox('getValue')
	    	$("#userlist").datagrid({
	            title:'会员列表', 
	            url : "${pageContext.request.contextPath }/userInfo/listBy.action?username="+username,
	            columns:[[
	            		{field:'username',title:'会员名',width:250,align:'left'},
	                   {field:'phone',title:'手机',width:150,align:'left'},
	                   {field:'sex',title:'性别',width:100,align:'left'},
	                   {field:'emergencyContactNumber',title:'紧急联系方式',width:100,align:'left'},
	                   {field:'timeCardEffectiveDate',title:'时间卡截止日期',width:100,align:'left'},
	                   {field:'timesCardRemainingTimes',title:'次数卡剩余次数',width:100,align:'left'}
						]],
	            loadMsg:"数据正在加载中，请稍后......",
	        });
	    }	 
		function pagerFilter(data) {
	        if (typeof data.length == 'number' && typeof data.splice == 'function') {	// is array
	            data = {
	                total: data.length,
	                rows: data
	            }
	        }
	        var dg = $(this);
	        var opts = dg.datagrid('options');
	        var pager = dg.datagrid('getPager');
	        pager.pagination({
	            onSelectPage: function (pageNum, pageSize) {
	                opts.pageNumber = pageNum;
	                opts.pageSize = pageSize;
	                pager.pagination('refresh', {
	                    pageNumber: pageNum,
	                    pageSize: pageSize
	                });
	                dg.datagrid('loadData', data);
	            }
	        });
	        if (!data.originalRows) {
	            data.originalRows = (data.rows);
	        }
	        var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
	        var end = start + parseInt(opts.pageSize);
	        data.rows = (data.originalRows.slice(start, end));
	        return data;
	    }

		
		function addUserInfoDlg(){
			$('#addfm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					alert(result);
					//var result = eval('('+result+')');
					
					if (result!="success"){
						$.messager.show({
							title: 'Error',
							msg: "操作失败!"
						});
					} else {					
						$('#adddlg').dialog('close');		// close the dialog
						$('#userlist').datagrid('reload');	// reload the user data
					}
				}
			});
		}
		function editUserInfoDlg(){
			$('#editfm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					alert(result);
					//var result = eval('('+result+')');
					
					if (result!="success"){
						$.messager.show({
							title: 'Error',
							msg: "操作失败!"
						});
					} else {					
						$('#editdlg').dialog('close');		// close the dialog
						$('#userlist').datagrid('reload');	// reload the user data
					}
				}
			});
		}
		
		
		
		function deleteUserInfo(){
			var row = $('#userlist').datagrid('getSelected');	
			if (row){
				$.messager.confirm('Confirm','确认要删除这个会员吗?',function(r){
					if (r){
						$.post('${pageContext.request.contextPath }/userInfo/delete.action',{userNumber:row.userNumber},function(result){
							if (result!="success"){
								$.messager.show({	// show error message
									title: 'Error',
									msg: "操作失败！"
								});
								
							} else {
								
								$('#userlist').datagrid('reload');	// reload the user data
							}
						},'json');
					}
				});
			}
			
		}  
	
	
	</script>
	<style type="text/css">
		#addfm{
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
	
	<style type="text/css">
		#editfm{
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