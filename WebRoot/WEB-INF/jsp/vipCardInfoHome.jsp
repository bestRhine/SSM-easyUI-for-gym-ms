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
	
	
<title>卡种管理</title>


</head>
<body> 


<table id="userlist" title="会员" class="easyui-datagrid" style="width:80%;height:auto"
		toolbar="#toolbar" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="cardTypeSerial" width="200">卡种编号</th>
			<th field="vipCardType" width="200">卡种名</th>
			<th field="chargeMethod" width="200">计费方式</th>
			<th field="price" width="200">价格</th>
			<th field="effectiveMonth" width="200">可用天数</th>
			<th field="effectiveTimes" width="200">可用次数</th>
			<th field="giveTime" width="200">赠送天数</th>
			<th field="giveTimes" width="200">赠送次数</th>
		</tr>
	</thead>
	
	<%-- 
	<tbody>
		<c:forEach items="${list}" var="UserInfo" varStatus="status">
		 	<tr>
		 		<td>${UserInfo.cardTypeSerial}</td>
		 		<td>${UserInfo.vipCardType}</td>
		 		<td>${UserInfo.chargeMethod}</td>
		 		<td>${UserInfo.price}</td>
		 		
		 	</tr>
		</c:forEach>
	</tbody>
	--%>
	
</table>
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUserInfo()">添加卡种</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUserInfo()">修改卡种</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteUserInfo()">删除卡</a>
		<select id="MethodSelect" onchange="changeMethodSelect()">
				<option value=''>全部</option>
		        <option value='按次计费'>按次计费</option>
		        <option value='按时计费'>按时计费</option>
		     </select>	 
	<input type="hidden" name="chargeMethodSearch" id="chargeMethodSearch" >
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchCard()">收费方式筛选</a>
</div>


	<div id="adddlg" class="easyui-dialog" style="width:420px;height:300px;padding:10px 20px"
			closed="true" buttons="#adddlg-buttons">
		<div class="ftitle">添加卡种信息</div>
		<form id="addfm" method="post" novalidate>		
			<div class="fitem">
				<label>卡种名：</label>
				<input name="vipCardType" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>计费方式:</label>
				<input name="chargeMethod" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>价格：</label>
				<input name="price" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>可用天数：</label>
				<input prompt="次数卡不用添加" name="effectiveMonth" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>可用次数：</label>
				<input prompt="时间卡不用添加"  name="effectiveTimes" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>赠送天数：</label>
				<input prompt="次数卡不用添加" name="giveTime" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>赠送次数：</label>
				<input prompt="时间卡不用添加"  name="giveTimes" class="easyui-textbox" required="true">
			</div>						
		</form>
	</div>
	
	<div id="editdlg" class="easyui-dialog" style="width:420px;height:300px;padding:10px 20px"
			closed="true" buttons="#editdlg-buttons">
		<div class="ftitle">修改卡种信息</div>
		<form id="editfm" method="post" novalidate>		
			<div class="fitem">
				<label>卡种名：</label>
				<input name="vipCardType" class="easyui-textbox" required="true">
			</div>		
			<div class="fitem">
				<label>计费方式:</label>
				<input name="chargeMethod" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>价格：</label>
				<input name="price" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>可用天数：</label>
				<input prompt="次数卡不用添加" name="effectiveMonth" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>可用次数：</label>
				<input prompt="时间卡不用添加"  name="effectiveTimes" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>赠送天数：</label>
				<input prompt="次数卡不用添加" name="giveTime" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>赠送次数：</label>
				<input prompt="时间卡不用添加"  name="giveTimes" class="easyui-textbox" required="true">
			</div>	
			<input type="hidden" name="cardTypeSerial" class="easyui-textbox" required="true">						
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
           title:'卡种列表', 
           url : "${pageContext.request.contextPath }/vipCardInfo/list.action",
           columns:[[
                   {field:'cardTypeSerial',title:'卡种编号',width:100,align:'left'},        
                   {field:'vipCardType',title:'卡种名',width:100,align:'left'},
                   {field:'chargeMethod',title:'收费方式',width:100,align:'left'},
                   {field:'price',title:'价格',width:100,align:'left'},
                   {field:'effectiveMonth',title:'可用天数',width:100,align:'left'},
                   {field:'effectiveTimes',title:'可用次数',width:100,align:'left'},
                   {field:'giveTime',title:'赠送天数',width:100,align:'left'},
                   {field:'giveTimes',title:'赠送次数',width:100,align:'left'}
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
		
		function addUserInfo(){
			$('#adddlg').dialog('open').dialog('setTitle','新增卡种');
			$('#addfm').form('clear');
			url = '${pageContext.request.contextPath }/vipCardInfo/add.action';
		}
		function editUserInfo(){
			var row = $('#userlist').datagrid('getSelected');
			if (row){
				$('#cardTypeSerial').textbox('setValue',row.cardTypeSerial);
				$('#editdlg').dialog('open').dialog('setTitle','修改会员');
				$('#editfm').form('load',row);
				url ='${pageContext.request.contextPath }/vipCardInfo/edit.action';
			}
		}
	
		function queryUserInfoPermission(){

		}
		
		function searchCard(){
	    	var chargeMethod= document.getElementById("chargeMethodSearch").value;
	    	$("#userlist").datagrid({
	            title:'会员列表', 
	            url : "${pageContext.request.contextPath }/vipCardInfo/listBy.action?chargeMethod="+chargeMethod,
	            columns:[[
	            		{field:'cardTypeSerial',title:'卡种编号',width:100,align:'left'},        
	                   {field:'vipCardType',title:'卡种名',width:100,align:'left'},
	                   {field:'chargeMethod',title:'收费方式',width:100,align:'left'},
	                   {field:'price',title:'价格',width:100,align:'left'},
	                   {field:'effectiveMonth',title:'可用天数',width:100,align:'left'},
	                   {field:'effectiveTimes',title:'可用次数',width:100,align:'left'},
	                   {field:'giveTime',title:'赠送天数',width:100,align:'left'},
	                   {field:'giveTimes',title:'赠送次数',width:100,align:'left'}
						]],
	            loadMsg:"数据正在加载中，请稍后......",
	        });
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
						$.post('${pageContext.request.contextPath }/vipCardInfo/delete.action',{cardTypeSerial:row.cardTypeSerial},function(result){
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
		
		function changeMethodSelect(){
	    	   var status = document.getElementById("MethodSelect").value;
	           document.getElementById("chargeMethodSearch").value=status;
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