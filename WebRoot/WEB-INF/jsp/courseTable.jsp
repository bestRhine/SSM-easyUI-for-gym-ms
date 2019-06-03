	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/gymms/js/easyui/plugins/jquery.combo.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
	<meta charset="UTF-8">
	
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
	function saveCourse(){
		var begintime=$('#beginTime').textbox('getValue');
		var endtime=$('#endTime').textbox('getValue');
		if(confirm("将发布"+begintime+"到"+endtime+"周内课程表？")){
			
		}
	}
	</script>
</head>
<body>
	<h1>团课课程发布</h1>
	<div class="demo-info" style="margin-bottom:20px;margin-left:20px">
		<div class="demo-tip icon-tip">&nbsp;</div>
		<div><img alt="" width="25" height="25" src="${baseurl}/styles/images/icon_information_8bit.png"/><font size="3px">拖拽左侧具体课程+教练   以完成【课程表】信息添加!</font>	</div>
		</hr>
		<input id="beginTime" name="beginTime" class="easyui-datebox" data-options="formatter:ww4,parser:w4"  prompt="开始日期">---到---
		<input id="endTime" name="endTime" class="easyui-datebox" data-options="formatter:ww4,parser:w4"  prompt="结束日期">
		</hr>
		<div id="dlg-buttons" style="margin-bottom:20px;margin-left:300px">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCourse()" style="width:90px">发布</a>
		
	</div>
	</div>
	
	<div style="width:850px;">
		<div class="left">
			<table>
				<c:forEach items="${multiCourseList}" var="Course" varStatus="status">
				<tr>
					<td>
					<div class="item">
						<table>                              <!-- td里面嵌套表格table -->
						<tr><td>${Course.cname}<td></tr>
						<tr><td>教练：ceshi1<td></tr>
						</table>
					</div>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="right">
			<table>
				<tr>
					<td class="blank"></td>
					<td class="blank"></td>
					<td class="blank"></td>
					<td class="title">课</td>
					<td class="title">程</td>
					<td class="title">表</td>
					<td class="blank"></td>
					<td class="blank"></td>
				</tr>
				<tr>
					<td class="blank"></td>
					<td class="title">Monday</td>
					<td class="title">Tuesday</td>
					<td class="title">Wednesday</td>
					<td class="title">Thursday</td>
					<td class="title">Friday</td>
					<td class="title"><font color="red">Saturday</font></td>
					<td class="title"><font color="red">Sunday</font></td>
				</tr>
				<tr>
					<td class="time">第一节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">第二节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">第三节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">第四节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>

				<tr>
					<td class="time">-- --</td>
					<td class="lunch" colspan="7">不&nbsp;&nbsp;&nbsp;&nbsp;  开&nbsp;&nbsp;&nbsp;&nbsp;  放</td>
				</tr>
				<tr>
					<td class="time">第五节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">第六节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">第七节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
				<tr>
					<td class="time">第八节</td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
					<td class="drop"></td>
				</tr>
			</table>
		</div>
	</div>
	<style type="text/css">
		.left{
			width:140px;
			float:left;
		}
		.left table{
			background:#E0ECFF;
		}
		.left td{
			background:#eee;
		}
		.right{
			float:right;
			width:680px;
		}
		.right table{
			background:#E0ECFF;
			width:100%;
		}
		.right td{
			background:#fafafa;
			color:#444;
			text-align:center;
			padding:2px;
		}
		.right td{
			background:#E0ECFF;
		}
		.right td.drop{
			background:#fafafa;
			width:90px;
		}
		.right td.over{
			background:#FBEC88;
		}
		.item{
			text-align:center;
			border:1px solid #499B33;
			background:#fafafa;
			color:#444;
			width:90px;
		}
		.assigned{
			border:1px solid #BC2A4D;
		}
		.trash{
			background-color:red;
		}
		
	</style>
	<script>
		$(function(){
			$('.left .item').draggable({
				revert:true,
				proxy:'clone'
			});
			$('.right td.drop').droppable({
				onDragEnter:function(){
					$(this).addClass('over');
				},
				onDragLeave:function(){
					$(this).removeClass('over');
				},
				onDrop:function(e,source){
					$(this).removeClass('over');
					if ($(source).hasClass('assigned')){
						$(this).append(source);
					} else {
						var c = $(source).clone().addClass('assigned');
						$(this).empty().append(c);
						c.draggable({
							revert:true
						});
					}
				}
			});
			$('.left').droppable({
				accept:'.assigned',
				onDragEnter:function(e,source){
					$(source).addClass('trash');
				},
				onDragLeave:function(e,source){
					$(source).removeClass('trash');
				},
				onDrop:function(e,source){
					$(source).remove();
				}
			});
		});
	</script>
</body>
</html>