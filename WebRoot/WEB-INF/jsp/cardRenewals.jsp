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
	
	
<title>卡激活</title>


</head>
<body> 


<table id="userlist" title="会员卡" class="easyui-datagrid" style="width:80%;height:auto"
		toolbar="#toolbar" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="cardNumber" width="200">卡号</th>
			<th field="cardType" width="200">计费方式</th>
			<th field="cardTypeName" width="200">卡种名</th>
			<th field="cardStatus" width="200">卡状态</th>
			<th field="timeCardSumTime" width="200">总天数</th>
			<th field="timesCardSumTimes" width="200">总次数</th>
			<th field="username" width="200">会员名</th>
			<th field="cardRenewals" width="200">延长天数/次数</th>
		</tr>
	</thead>

</table>
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="editCard()">延期选中的卡</a>
	<input name="phone" id="phoneSearch" class="easyui-textbox" required="true" prompt="输入会员手机查询">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchCard()">查询会员</a>
</div>
<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">延期信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>卡号:</label>
				<input name="cardNumber" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>卡种名:</label>
				<input name="cardTypeName" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>计费方式:</label>
				<input name="cardType" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>总天数:</label>
				<input name="timeCardSumTime" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>总次数:</label>
				<input name="timesCardSumTimes" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>延期天数/次数:</label>
				<input name="cardRenewalsInput" class="easyui-textbox" >
			</div>

			<input type="hidden" id="cardStatus" name="cardStatus" class="easyui-textbox" value="used" >
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="cardRenewals()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
	</div>

	
	<script type="text/javascript">
	var url;
		$(function(){
      	 $("#userlist").datagrid({ loadFilter: pagerFilter }).datagrid({
           title:'卡种列表', 
           url : "${pageContext.request.contextPath }/userCard/list.action",
           columns:[[
        	   		{field:'cardNumber',title:'卡号',width:100,align:'left'},
                   {field:'cardType',title:'计费方',width:100,align:'left'},        
                   {field:'cardTypeName',title:'卡种名',width:100,align:'left'},
                   {field:'cardStatus',title:'卡状态',width:100,align:'left'},
                   {field:'timeCardSumTime',title:'总天数',width:100,align:'left'},
                   {field:'timesCardSumTimes',title:'总次数',width:100,align:'left'},
                   {field:'username',title:'会员名',width:100,align:'left'},
                   {field:'cardRenewals',title:'延长天数',width:100,align:'left'}
                   
					]],
           loadMsg:"数据正在加载中，请稍后......",
        });
 	   });
		
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
		
		function editCard(){
			var row = $('#userlist').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','延期');
				$('#fm').form('load',row);
			}
		}
		
		function cardRenewals(){			
			var row = $('#userlist').datagrid('getSelected');
			if (row){
			$('#fm').form('submit',{
				url: '${pageContext.request.contextPath}/userCard/renewalsCard.action?id='+row.cardNumber,
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
						$('#dlg').dialog('close');		// close the dialog
						$('#userlist').datagrid('reload');	// reload the user data
					}
				}
			});
			
			}
		}
		
		
		function searchCard(){
			var phone=$('#phoneSearch').textbox('getValue')
	    	$("#userlist").datagrid({
	            title:'会员列表', 
	            url : "${pageContext.request.contextPath }/userCard/listBy.action?phone="+phone,
	            columns:[[
	            		{field:'cardType',title:'计费方',width:100,align:'left'},        
	                   {field:'cardTypeName',title:'卡种名',width:100,align:'left'},
	                   {field:'cardStatus',title:'卡状态',width:100,align:'left'},
	                   {field:'timeCardSumTime',title:'总天数',width:100,align:'left'},
	                   {field:'timesCardSumTimes',title:'总次数',width:100,align:'left'},
	                   {field:'username',title:'会员名',width:100,align:'left'},
	                   {field:'cardRenewals',title:'延长天数',width:100,align:'left'}
						]],
	            loadMsg:"数据正在加载中，请稍后......",
	        });
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