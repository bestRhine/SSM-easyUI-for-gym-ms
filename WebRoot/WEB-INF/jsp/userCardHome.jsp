
	
<title>会员卡管理</title>


</head>
<body> 


<table id="userlist" title="会员" class="easyui-datagrid" style="width:60%;height:500px"
		toolbar="#toolbar" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="cardNumber" width="200">卡号</th>
			<th field="cardTypeName" width="200">卡种名</th>
			<th field="username" width="200">会员名</th>
			<th field="cardStatus" width="200">卡状态</th>
			<th field="cardType" width="200">收费方式</th>
		</tr>
	</thead>
	
	<%-- 
	<tbody>
		<c:forEach items="${list}" var="UserCard" varStatus="status">
		 	<tr>
		 		<td>${UserCard.userNumber}</td>
		 		<td>${UserCard.weixin}</td>
		 		<td>${UserCard.username}</td>
		 		<td>${UserCard.phone}</td>
		 		
		 	</tr>
		</c:forEach>
	</tbody>
	--%>
	
</table>
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUserCard()">办卡</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUserCard()">卡修改</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteUserCard()">删除卡</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"  plain="true" onclick="queryUserCardPermission()">查看会员权限</a>
	<input name="username" id="usernamesearch" class="easyui-textbox" required="true" prompt="输入会员名查询">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchUser()">查询会员</a>
</div>


	<div id="adddlg" class="easyui-dialog" style="width:420px;height:300px;padding:10px 20px"
			closed="true" buttons="#adddlg-buttons">
		<div class="ftitle">办卡</div>
		<form id="addfm" method="post" novalidate>		
			<div class="fitem">
				<label>会员卡号：</label>
				<input name="cardNumber" class="easyui-textbox" required="true">
			</div>	
			<div class="fitem">
				<label>收费方式:</label>
				<select id="cardTypeSelect" onchange="changeType()">
                  	<option value="按时收费">按时收费</option>
                  	<option value="按次收费">按次收费</option>
                  </select>
			</div>	
			<input type="hidden" name="cardType" id="cardType" value="按时收费"/>	
			<div class="fitem">
				<label>手机号：</label>
				<input name="phone" class="easyui-textbox" required="true">
			</div>							
		</form>
	</div>
	
	<div id="editdlg" class="easyui-dialog" style="width:420px;height:300px;padding:10px 20px"
			closed="true" buttons="#editdlg-buttons">
		<div class="ftitle">办卡</div>
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
			<input type="hidden" name="userNumber" class="easyui-textbox" required="true">						
		</form>
	</div>
	
	<div id="adddlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="addUserCardDlg()" style="width:90px">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#adddlg').dialog('close')" style="width:90px">取消</a>
	</div>
	
	<div id="editdlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="editUserCardDlg()" style="width:90px">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#editdlg').dialog('close')" style="width:90px">取消</a>
	</div>
	
	<script type="text/javascript">
	var url;
		$(function(){
      	 $("#userlist").datagrid({ loadFilter: pagerFilter }).datagrid({
           title:'会员列表', 
           url : "${pageContext.request.contextPath }/userCard/list.action",
           columns:[[
                   {field:'cardNumber',title:'卡号',width:250,align:'center'},
                   {field:'cardTypeName',title:'卡种',width:150,align:'center'},
                   {field:'username',title:'会员名',width:100,align:'center'},
                   {field:'cardStatus',title:'卡状态',width:150,align:'left'},
                   {field:'cardType',title:'收费方式',width:150,align:'center'}
					]],
           loadMsg:"数据正在加载中，请稍后......",
        });
 	   });
		
		function changeType(){
			var type=document.getElementById("cardTypeSelect").value;
			$("#cardType").val(type) ;
		}
		
		function addUserCard(){
			//$('#adddlg').dialog('open').dialog('setTitle','新增会员');
			//$('#addfm').form('clear');
			url = '${pageContext.request.contextPath }/userCard/addCard.action';
		}
		function editUserCard(){
			var row = $('#userlist').datagrid('getSelected');
			if (row){
				$('#userNumber').textbox('setValue',row.userNumber);
				$('#editdlg').dialog('open').dialog('setTitle','修改会员');
				$('#editfm').form('load',row);
				url ='${pageContext.request.contextPath }/userCard/edit.action';
			}
		}
	
		function queryUserCardPermission(){

		}
		
		function searchUser(){
	    	var username=$('#usernamesearch').textbox('getValue')
	    	$("#userlist").datagrid({
	            title:'会员列表', 
	            url : "${pageContext.request.contextPath }/userCard/listBy.action?username="+username,
	            columns:[[
	                    {field:'userNumber',title:'会员号',width:200,align:'center'},
	                    {field:'weixin',title:'微信',width:200,align:'center'},
	                    {field:'username',title:'会员名',width:200,align:'center'},
	                    {field:'phone',title:'手机',width:200,align:'left'},
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

		
		function addUserCardDlg(){
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
		function editUserCardDlg(){
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
		
		
		
		function deleteUserCard(){
			var row = $('#userlist').datagrid('getSelected');	
			if (row){
				$.messager.confirm('Confirm','确认要删除这个会员吗?',function(r){
					if (r){
						$.post('${pageContext.request.contextPath }/userCard/delete.action',{userNumber:row.userNumber},function(result){
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
	


</body>

</html>


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
                        <td><input type="radio" name="ctcoursetype" id="ctcoursetype"  value="团课" onclick="getType()">团课</td>
                    </tr>     
                    

  </form>
</div>
<div id="dlg-buttons">
<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-search" onclick="formCt()" style="width:90px">查询</a>
</div>

<shiro:hasPermission name="item:update">有合同修改权限</shiro:hasPermission>
</br></br>

<table id="contractList" title="合同列表" class="easyui-datagrid" style="width:900px;height:420px"		
		toolbar="#toolbar" pagination="true"
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
                <td><fmt:formatDate value="${Contract.ctbegin}" pattern="yyyy-MM-dd" /> </td>
                <td><fmt:formatDate value="${Contract.ctend}" pattern="yyyy-MM-dd" /></td>
                
				<td>${Contract.ctorder}</td> 
			    <td>${Contract.ctpay}</td>
				<td>${Contract.ctoperator}</td>
				
				<td>${Contract.cttype}</td>

				
                <td><a href="${pageContext.request.contextPath}/showMoreInfo?ctid=${Contract.ctid}" class="easyui-linkbutton" iconCls="icon-add" plain="true" ></a></td>

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