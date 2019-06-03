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
	
	
<title>转卡</title>


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
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="transCardSelect()">转出选中卡</a>
	
	<input name="phoneSearch" id="phoneSearch" class="easyui-textbox" required="true" prompt="输入会员手机查询">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchCard()">查询会员</a>
</div>

	<div style="width:100%;margin-top:20px;border-bottom:1px solid #000;"></div>
	<h2>转卡信息</h2>
	<p>查询转入会员并完善信息</p>
	<tr>
	    	<td>转入会员手机号：</td>
	    	<td><input class="easyui-textbox" type="text" id="phoneTransTo" name="phoneTransTo"   placeholder="输入用户手机号码">
            <button class="btn"  onclick="getUser()">查询</button>
	</tr>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="办卡信息" style="width:600px">
		<div style="padding:10px 60px 20px 60px">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>转入会员姓名：</td>
	    			<td><input class="easyui-textbox" type="text" id="username" name="username" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>转入会员身份证：</td>
	    			<td><input class="easyui-textbox" type="text" id="ID" name="ID" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>手机号：</td>
	    			<td><input class="easyui-textbox" type="text" id="phone" name="phone" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>待转卡号：</td>
	    			<td><input class="easyui-textbox" type="text" id="cardNumber" name="cardNumber" data-options="required:true"></input></td>
	    		</tr>
              	<tr>
	    			<td>待转卡种名：</td>
	    			<td><input class="easyui-textbox" type="text" id="cardTypeName" name="cardTypeName" data-options="required:true"></input></td>
	    		</tr>
	    	
	    	</table>
	    	<input class="easyui-textbox" type="hidden"  name="cardStatus" id="cardStatus" ></input>
	    	<input class="easyui-textbox" type="hidden" id="userNumberTransTo" name="userNumberTransTo" ></input>
	    	<input class="easyui-textbox" type="hidden" id="userNumberTrans" name="userNumberTrans" ></input>
	    	<input class="easyui-textbox" type="hidden" id="cardStatusInput" name="cardStatusInput" value="used" ></input>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addUserCard()"> 提交  </a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
	    </div>
	    </div>
	</div>
	<script>
		
	
	</script>

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
		

	
		function getUser(){
			  var phone = $("#phoneTransTo").textbox('getValue');
			  	$.post('${pageContext.request.contextPath }/userCard/getUser.action',{phone:phone},function(data){
			  		$("#username").textbox('setValue',data.username);
			  		$("#ID").textbox('setValue',data.ID);
			  		$("#phone").textbox('setValue',data.phone);
			  		$("#userNumberTransTo").textbox('setValue',data.userNumber);
				},'json');	
			}
		
		function transCardSelect(){
			var row = $('#userlist').datagrid('getSelected');	
			if (row){
					if(row.cardStatus=="unused"){
					$("#cardNumber").textbox('setValue',row.cardNumber);
					$("#cardTypeName").textbox('setValue',row.cardTypeName);
					$("#userNumberTrans").textbox('setValue',row.userNumber);
					$("#cardStatusInput").textbox('setValue',row.cardStatus);
					}else{
						$.messager.show({
							title: '操作错误',
							msg: "请选择未激活的卡!"
						});
					}
				}
		}

		function clearForm(){
			$('#ff').form('clear');
		}
		
		function submitForm(){
			$('#ff').form('clear');
		}
		
		function addUserCard(){
			$('#ff').form('submit', {
			    url:"${pageContext.request.contextPath }/userCard/transCard.action",
			    onSubmit: function(){
			    	return $(this).form('validate');
					// return false to prevent submit;
			    },
			    success:function(result){
					alert(result)
					if (result!="success"){
						$.messager.show({
							title: 'Error',
							msg: "操作失败!"
						});
					} else {					
						$('#userlist').datagrid('reload');// reload the user data
					}
			    }
			});
		}
		
		function addCardType(){
			var row = $('#userlist').datagrid('getSelected');	
			if (row){
					$("#cardTypeSerial").textbox('setValue',row.cardTypeSerial);	
					$("#cardTypeName").textbox('setValue',row.vipCardType);
					$("#cardType").textbox('setValue',row.chargeMethod);
					$("#effectiveMonth").textbox('setValue',row.effectiveMonth);
					$("#effectiveTimes").textbox('setValue',row.effectiveTimes);
					$("#giveTime").textbox('setValue',row.giveTime);
					$("#giveTimes").textbox('setValue',row.giveTimes);
					$("#price").textbox('setValue',row.price);
					}
				
			}

			function changeCardStatus(){
				var type = $("#cardStatusSelect").combobox('getValue');
				$("#cardStatus").textbox('setValue',type);
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