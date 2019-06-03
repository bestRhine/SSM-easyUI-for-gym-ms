<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%-- @ taglib uri="http://shiro.apache.org/tags" prefix="shiro" --%>
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
	
<title>课程管理</title>
<script type="text/javascript">

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



</script>
</head>
<body> 

<table id="courseList" title="课程" class="easyui-datagrid" style="width:940px;height:auto"		
		toolbar="#toolbar" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="cid" width="120">课程号</th>	
			<th field="tid" width="120">租户</th>		
			<th field="cname" width="120">课程名</th>
			<th field="cinfo" width="220">简介</th>
			<th field="clevel" width="120">等级</th>
			<th field="cpay" width="120">单价</th>
			<th field="ctype" width="120">类型</th>
			
		</tr>
	</thead>
</table>
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addCourse()">添加课程</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCourse()">修改课程</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteCourse()">删除课程</a>
	<input name="cname" id="cnamesearch" class="easyui-textbox" required="true" prompt="输入课程名查询">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchCourse()">查询课程</a>
</div>

	<div id="dlg" class="easyui-dialog" style="width:420px;height:300px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">课程信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>租户:</label>
				<input name="tid" id="tid" class="easyui-textbox" required="true">
			</div> 
			<div class="fitem">
				<label>课程名:</label>
				<input name="cname" id="cname" class="easyui-textbox"  data-options="required:true,validType:'length[2,10]'">						
			</div> 
			<div class="fitem">
				<label>简介:</label>
				<input name="cinfo" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>等级:</label>
				<input name="clevel" id="clevel" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>单价：</label>
				<input name="cpay" id="cpay" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>课程类型:</label>
				<input name="ctype" class="easyui-textbox" required="true">
			</div>
				<input name="cid" class="easyui-textbox" type="hidden"> 
		</form>
		
	</div>
		
	
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCourse()" style="width:90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	</div>
	<script type="text/javascript">
	 $(function(){
	        $("#courseList").datagrid({ loadFilter: pagerFilter }).datagrid({
	            title:'课程列表', 
	            url : "${pageContext.request.contextPath }/listCourse1.action",
	            columns:[[
	                    {field:'cid',title:'课程号',width:120,align:'center'},
	                    {field:'tid',title:'租户号',width:120,align:'center'},
	                    {field:'cname',title:'课程名',width:120,align:'center'},
	                    {field:'cinfo',title:'简介',width:220,align:'left'},
	                    {field:'clevel',title:'等级',width:120,align:'center'},
	                    {field:'cpay',title:'单价',width:120,align:'center'},
	                    {field:'ctype',title:'类型',width:120,align:'center'}                 
						]],
	            loadMsg:"数据正在加载中，请稍后......",
	        });
	    });
	 
	
	    function searchCourse(){
	    	var cname=$('#cnamesearch').textbox('getValue')
	    	$("#courseList").datagrid({ loadFilter: pagerFilter }).datagrid({
	            title:'课程列表', 
	            url : "${pageContext.request.contextPath }/findCourse1.action?cname="+cname,
	            columns:[[
	                    {field:'cid',title:'课程号',width:120,align:'center'},
	                    {field:'tid',title:'租户号',width:120,align:'center'},
	                    {field:'cname',title:'课程名',width:120,align:'center'},
	                    {field:'cinfo',title:'简介',width:220,align:'left'},
	                    {field:'clevel',title:'等级',width:120,align:'center'},
	                    {field:'cpay',title:'单价',width:120,align:'center'},
	                    {field:'ctype',title:'类型',width:120,align:'center'}
						]],
	            loadMsg:"数据正在加载中，请稍后......",
	        });
	    }	 
	
		var url;
		function addCourse(){
			$('#dlg').dialog('open').dialog('setTitle','新增课程');
			$('#fm').form('clear');
			url = '${pageContext.request.contextPath }/addCourse1.action';
		}
		
		function editCourse(){
			var row = $('#courseList').datagrid('getSelected');
			if (row){
				$('#cid').textbox('setValue',row.cid);
				
				$('#dlg').dialog('open').dialog('setTitle','修改课程');
				$('#fm').form('load',row);
				//$('#cname').textbox('textbox').attr('readonly',true);
				 //$('#cname').textbox('textbox').css('background','gray')
				url = '${pageContext.request.contextPath }/editCourse1.action';
			}
		}

		function saveCourse(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					alert(result);
					//var result = eval('('+result+')');			
					//if (JSON.stringify(result)!="success"){
					if(result!="success"){
						$.messager.show({
							title: 'Error',
							msg: "操作失败!"
						});
					} else {
						$('#dlg').dialog('close');		// close the dialog
						$('#courseList').datagrid('reload');	// reload the user data
					}
				}
			});
		}
		function deleteCourse(){
			var row = $('#courseList').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确认要删除这个课程吗?',function(r){
					if (r){
						$.post('${pageContext.request.contextPath }/deleteCourse1.action',{cid:row.cid},function(result){
							if (result!="success"){
								$.messager.show({	// show error message
									title: 'Error',
									msg: "操作失败!"
								});
							} else {						
								
								$('#courseList').datagrid('reload');	// reload the user data
							}
						},'json'); 
					}
				});
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



</body>

</html>