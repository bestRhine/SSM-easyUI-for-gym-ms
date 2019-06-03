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
	
	
<title>办卡</title>


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
			<th field="giveTime" width="200">赠送天数</th>
			<th field="effectiveTimes" width="200">可用次数</th>
			<th field="giveTimes" width="200">赠送次数</th>
		</tr>
	</thead>

</table>
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addCardType()">办理此种卡</a>
		<select id="MethodSelect" onchange="changeMethodSelect()">
				<option value=''>全部</option>
		        <option value='按次计费'>按次计费</option>
		        <option value='按时计费'>按时计费</option>
		     </select>	 
	<input type="hidden" name="chargeMethodSearch" id="chargeMethodSearch" >
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchCard()">收费方式筛选</a>
</div>

	<div style="width:100%;margin-top:20px;border-bottom:1px solid #000;"></div>
	<h2>办卡信息</h2>
	<p>查询会员并选择卡种完善信息</p>
	<tr>
	    	<td>会员手机号：</td>
	    	<td><input class="easyui-textbox" type="text" id="phone" name="phone"  data-options="required:true" placeholder="输入用户手机号码">
            <button class="btn"  onclick="getUser()">查询</button>
	</tr>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="办卡信息" style="width:600px">
		<div style="padding:10px 60px 20px 60px">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>用户姓名：</td>
	    			<td><input class="easyui-textbox" type="text" id="username" name="username" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户身份证：</td>
	    			<td><input class="easyui-textbox" type="text" id="ID" name="ID" ></input></td>
	    		</tr>
	    		<tr>
                 <td>是否激活：</td>
                  <td><select class="easyui-combobox" id="cardStatusSelect" name="cardStatusSelect" style="width:100px">
                  	<option value="unused">暂不激活</option>
                  	<option value="used">立刻激活</option>
                  </select>  </td> 
                      
              </tr>
              <tr>
	    			<td>卡种名：</td>
	    			<td><input class="easyui-textbox" type="text" id="cardTypeName" name="cardTypeName" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>收费方式:</td>
	    			<td><input class="easyui-textbox" type="text" name="cardType" id="cardType" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>赠送天数/次数：</td>
	    			<td><input class="easyui-textbox" type="text" id="cardRenewals" name="cardRenewals" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>门市价：</td>
	    			<td><input class="easyui-textbox" type="text" id="price" name="price" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>实收：</td>
	    			<td><input class="easyui-textbox" type="text" id="realPrice" name="realPrice" data-options="required:true"></input></td>
	    		</tr>
	    	</table>
	    	<input class="easyui-textbox" type="hidden"  name="cardStatus" id="cardStatus" value="unused"/>  
	    	<input class="easyui-textbox" type="hidden" id=cardTypeSerial name="cardTypeSerial" ></input>
	    	<input class="easyui-textbox" type="hidden" id=effectiveMonth name="effectiveMonth" ></input>
	    	<input class="easyui-textbox" type="hidden" id=effectiveTimes name="effectiveTimes" ></input>
	    	<input class="easyui-textbox" type="hidden" id=giveTime name="giveTime" value='0'></input>
	    	<input class="easyui-textbox" type="hidden" id=giveTimes name="giveTimes" value='0'></input>
	    	<input class="easyui-textbox" type="hidden" id=userNumber name="userNumber" ></input>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addUserCard()">Submit</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
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

	      $(document).ready(function () {
	    	  $('#cardStatusSelect').combobox({
	    	  onChange: function (n, o) {
	    		var type = $('#cardStatusSelect').combobox('getValue')
	    	  $("#cardStatus").textbox('setValue',type);
	    	  }
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

		function changeMethodSelect(){
	    	   var status = document.getElementById("MethodSelect").value;
	           document.getElementById("chargeMethodSearch").value=status;
	       }
	
		function getUser(){
			  var phone = $("#phone").textbox('getValue');
			  	$.post('${pageContext.request.contextPath }/userCard/getUser.action',{phone:phone},function(data){
			  		$("#username").textbox('setValue',data.username);
			  		$("#ID").textbox('setValue',data.ID);
			  		$("#userNumber").textbox('setValue',data.userNumber);
			  		
				},'json');	
			  	
			  
			}
		
		function clearForm(){
			$('#ff').form('clear');
		}
		
		function submitForm(){
			$('#ff').form('clear');
		}
		
		function addUserCard(){
			$('#ff').form('submit', {
			    url:"${pageContext.request.contextPath }/userCard/add.action",
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
							// reload the user data
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