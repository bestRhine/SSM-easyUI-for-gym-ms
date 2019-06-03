<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>

<html>
<head>
	
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>

<%-- 引入JQ和Bootstrap --%>
     <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>  
    <link href="css/style.css" rel="stylesheet"> 	 


<meta charset="UTF-8">
<script type="text/javascript">
	function changeType(){
		var type=document.getElementById("indexType").value	
		$("#ctcoursetype").val(type) 
	}
	function searchCourse(){
		var cname = document.getElementById("cnameQuery").value
		addCourse(cname)
	}
	
	function addCourse(cname){
		var type=document.getElementById("indexType").value	
		var message=""
			if(cname!=null){
				message="{'cname':'"+cname+"','ctype':'"+type+"'}"
			}else{
				message="{'cname':'','ctype':'"+type+"'}"
			}
			$.ajax({
				type:'post',
				url: '${pageContext.request.contextPath}/getCourseList.action',
				contentType:'application/json;charset=utf-8',
				data:message,
				success:function(data){
					var tableHead="<tr>"+"<td><input type='checkbox' onclick='checkAll(this)'></td>"+
							"<td>课程名</td><td>类型</td><td>简介</td>"+
							"</tr>"
					$("#courseList").html(tableHead)
					for(var i=0;i<data.length;i++){
						var oldHtml=$("#courseList").html()
						var cInfo="<tr>"+"<td><input type='checkbox' id='carrays'  name='carrays' value='"+data[i].cid+"'></td>"+
								"<td>"+data[i].cname+"</td><td>"+data[i].ctype+"</td><td>"+data[i].cinfo+"</td>"+"</tr>"
														
						$("#courseList").html(oldHtml+cInfo);
					}								
					$("#courseList").html("<table style='width:500px;text-align:center;' border=1>"+ 
							$("#courseList").html()+"</table>");     
							  
					$(".courseMask").css("display","block")
				},
				error:function(data) {alert("操作异常！ 重试")}

			});
	}
	function checkAll(obj){
		var isCheck=obj.checked
		var checkList=document.getElementsByName("carrays")
		for(var i=0;i<checkList.length;i++){
			checkList[i].checked=isCheck
		}
	} 

	
	function selectCourse(){
		$("#courseInfo").html("") 
		var myArray=new Array()
		var len=0
		var arrays=document.getElementsByName("carrays")
		for (var i=0;i<arrays.length;i++){
			if(arrays[i].checked){
				myArray[len++]=arrays[i].value
			}
		}
		
		$.ajax({
			type:'post',
			url: '${pageContext.request.contextPath}/getCourseAndAmountList.action',
			data:{"arrays":myArray},
			traditional:true,
			success:function(data){
				var tableHead="<tr>"+
						"<td>课程名</td><td>类型</td><td>等级</td><td>单价</td><td>数量</td>"+
						"</tr>"
				$("#courseInfo").html(tableHead)
				for(var i=0;i<data.length;i++){
					var course=data[i].course;
					var oldHtml=$("#courseInfo").html();  
					<!--取出来的是List数组，且按id查找只有里面一个元素。存放的是hashmap，所以这里先list.get(0)取出map,再get(key)取出值-->
					var courseInfo="<tr>"+"<td>"+course[0].cname+"</td>"+
							"<td>"+course[0].ctype+"</td><td>"+course[0].clevel+"</td><td>"+course[0].cpay+"元/课时</td><td>"+
							"<input type='number'  style='width:50px' name='camountArrays' min='5' max='500'>课时"+"</td>"+
							"</tr><input type='hidden' name='courseIdArrays' value='"+course[0].cid+"'>";

					$("#courseInfo").html(oldHtml+courseInfo);
				}
				$("#courseInfo").html("<table style='width:500px;text-align:center;' border=1>"+
						$("#courseInfo").html()+"</table>");
						
				$(".courseMask").css("display","none");
				$("#courseInfo").css("display","block");
			},
			error:function(data) {alert("操作异常！ 重试")}

		});
    }
		
		
	function cancelEdit(){ 
		$(".courseMask").css("display","none");
		$(".memberMask").css("display","none");
	}
	function cancelWindowMask(){
		$("#cancelWindowMask").css("display","none");   <!--在css中设置布局的，这里直接#。。获取，否则蒙版mask类似上一个函数-->
	}
	 
	function searchMember(){
		<!--addMember($("#mname").val())-->
		var mname = document.getElementById("mnameQuery").value;
		addMember(mname);
	}
	function addMember(mname){
		var message=""
			if(mname!=null){
				message="{'mname':'"+mname+"'}"
			}else{
				message="{'mname':''}"
			}
			$.ajax({
				type:'post',
				url: '${pageContext.request.contextPath}/getUserInfoList.action',
				contentType:'application/json;charset=utf-8',
				data:message,
				success:function(data){
					var tableHead="<tr>"+"<td><input type='checkbox' onclick='checkAll(this)'></td>"+
							"<td>会员名</td><td>性别</td><td>电话</td>"+
							"</tr>"
					$("#memberList").html(tableHead)
					for(var i=0;i<data.length;i++){
						var oldHtml=$("#memberList").html();
						var memberInfo="<tr>"+"<td><input type='checkbox' id='marrays' name='marrays' value='"+data[i].userNumber+"'></td>"+
								"<td>"+data[i].username+"</td><td>"+data[i].sex+"</td><td>"+data[i].phone+"</td>"+"</tr>"
						
						$("#memberList").html(oldHtml+memberInfo)
					}
							
					$("#memberList").html("<table style='width:500px;text-align:center;' border=1>"+
							$("#memberList").html()+"</table>");    
							 
					$(".memberMask").css("display","block")
				},
				error:function(data) {alert("操作异常！ 重试")}

			});
	}
	
	function selectMember(){
		$("#memberInfo").html("")
		var myArray=new Array()
		var len=0
		var arrays=document.getElementsByName("marrays")
		for (var i=0;i<arrays.length;i++){
			if(arrays[i].checked){
				myArray[len++]=arrays[i].value;
			}
		}
		$.ajax({
			type:'post',
			url: '${pageContext.request.contextPath}/getUserInfoJsonList.action',
			data:{"arrays":myArray},
			traditional:true,
			success:function(data){
				var tableHead="<tr>"+"<td>会员名</td><td>性别</td><td>手机号</td>"+"</tr>"
		       $("#memberInfo").html(tableHead)
				for(var i=0;i<data.length;i++){
					var member=data[i].member
					var oldHtml=$("#memberInfo").html()
					var memberInfo="<tr>"+"<td>"+member[0].username+"</td>"+
					"<td>"+member[0].sex+"</td><td>"+member[0].phone+"</td>"+
					"</tr><input type='hidden' name='memberIdArrays' value='"+member[0].userNumber+"'>" ;
					
					$("#memberInfo").html(oldHtml+memberInfo)	
				}
				$("#memberInfo").html("<table style='width:500px;text-align:center;' border=1>"+
						$("#memberInfo").html()+"</table>") 
				$(".memberMask").css("display","none");
				$("#memberInfo").css("display","block");
			},
			error:function(data) {alert("操作异常！ 重试")}

		});
    }
	
	function searchTeacher(){
		var teacher = document.getElementById("teacherQuery").value;
		addTeacher(teacher);
	}
	function addTeacher(teacher){
			$("#teacherList").html("")
			var message=""
			if(teacher!=null){
				message="{'teacher':'"+teacher+"'}"
			}else{
				message="{'teacher':''}"
			}
			
			$.ajax({
				type:'post',
				url: '${pageContext.request.contextPath }/getTeacherList.action',
				contentType:'application/json;charset=utf-8',
				data:message,
				success:function(data){
					for(var i=0;i<data.length;i++){
						var oldHtml=$("#teacherList").html();
						var teacherInfo="<p onclick=\"selectTeacher('"+data[i].name+"')\">"
						      +"□&nbsp 姓名："+data[i].name+"&nbsp Tel:"+data[i].phone+"</p><hr />" ;
						$("#teacherList").html(oldHtml+teacherInfo)
					}
					$(".teacherMask").css("display","block")
				},
				error:function(data) {alert("操作异常！ 重试")}
			});
		}
		function selectTeacher(name){
			$("#ctteacher").val(name) 
			cancelEditTeacher()
		}
		function cancelEditTeacher(){
			$(".teacherMask").css("display","none")
		}

	
		function searchSaler(){
			var saler = document.getElementById("salerQuery").value
			addSaler(saler)
		}
		function addSaler(saler){
				$("#salerList").html("")
				var message=""
				if(saler!=null){
					message="{'saler':'"+saler+"'}"
				}else{
					message="{'saler':''}"
				} 
				
				$.ajax({
					type:'post',
					url: '${pageContext.request.contextPath }/getSalerList.action',
					contentType:'application/json;charset=utf-8',
					data:message,
					success:function(data){
						for(var i=0;i<data.length;i++){
							var oldHtml=$("#salerList").html();
							var salerInfo="<p onclick=\"selectSaler('"+data[i].name+"')\">"
							      +"□&nbsp 姓名："+data[i].name+"&nbsp Tel:"+data[i].phone+"</p><hr/>"; 
							$("#salerList").html(oldHtml+salerInfo)
						}
						$(".salerMask").css("display","block")
					},
					error:function(data) {alert("操作异常！ 重试")}
				});
			}
			function selectSaler(name){
				$("#ctsaler").val(name);
				cancelEditSaler();
			}
			function cancelEditSaler(){
				$(".salerMask").css("display","none")
			}

		
		
	
	function checkAddContract(){ 
        if($("#ctteacher").val()==null||$("#ctteacher").val()==""||$("#ctsaler").val()==null||$("#ctsaler").val()==""){
            alert("（上课/售课教练）不能为空！");
            return false;
        }
        

         var beginDate=$("#ctbegin").val();  
         var endDate=$("#ctend").val();  
         var d1 = new Date(beginDate.replace(/\-/g, "\/"));  
         var d2 = new Date(endDate.replace(/\-/g, "\/"));  
          
          if(beginDate!=""&&endDate!=""&&d1 >=d2)  
         {  
          alert("开始日期不能早于结束日期！");  
          return false;  
         }

        
        
        if($("#ctorder").val()==null||$("#ctorder").val()==""||$("#ctpay").val()==null||$("#ctpay").val()==""){
            alert("订单/实付金额不能为空！");
            return false;
        }
       
        return true;
   }
	 
			
</script>

</head>
<body>

<!--%@ include file="menu.jsp" %><br/> -->

<!-- div class="right"-->

<form method="post" action="${pageContext.request.contextPath }/addContract.action" role="form"  onsubmit=" return checkAddContract()">
                                  <!--  onsubmit做校验，如果输入参数不合法，组织表单提交。这里必须是return+function() -->
<div class="addCtDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">办理合同</h3>
        </div>
       <div class="panel-body">
		<table class="addTable">
              <tr>
                 <td>&nbsp; &nbsp; &nbsp; &nbsp;租户：</td>
                  <td>${tid}</td>
                  <td>&nbsp;操作员工：</td>
                  <td>${name}</td>
                  <input type="hidden" name="tid" id="tid" value="${tid}"/>
                  <input type="hidden" name="ctoperator" id="ctoperator" value="${name}"/>
              </tr>
              <tr>
                 <td>合同类型：</td>
                  <td><select id="indexType" onchange="changeType()">
                  	<option value="私课">私课</option>
                  	<option value="组课">组课</option>
                  </select>  </td>  &nbsp; &nbsp;(说明：只有组课类型合同才能添加多个会员!)
            
                   <input type="hidden" 	name="ctcoursetype" id="ctcoursetype" value="私课"/>
                   <input type="hidden" name="cttype" id="cttype" value="新办"/>        
              </tr>
              <tr> 
                 <td>上课教练：</td>
                  <td><input type="text" name="ctteacher" id="ctteacher" placeholder="输入教练名字" onfocus="addTeacher(null)"></td>
                  <td>&nbsp; &nbsp; &nbsp;售课人：</td>
                  <td><input type="text" name="ctsaler" id="ctsaler" placeholder="输入售课人名" onfocus="addSaler(null)"></td>
              </tr>
			  <tr>
                 <td>起止日期：</td>
                  <td><input type="date" name="ctbegin" id="ctbegin" ></td>
                  <td>&nbsp;  — &nbsp;到&nbsp; —&nbsp;</td>
                  <td><input type="date" name="ctend" id="ctend"></td>
              </tr>
              <tr>
                 <td>订单金额：</td>
                  <td><input type="text" name="ctorder" id="ctorder" maxlength="7" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"  placeholder="输入金额"></td>
                  <td>&nbsp; 实付金额：</td>
                  <td><input type="text" name="ctpay" id="ctpay" maxlength="7" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"  placeholder="输入金额"></td>
              </tr>
              </table>	
     </div>	
</div>	
</div>	

<div class="teacherMask">
 <div class="addDIV">
	<div style="background-color:#E0ECFF;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	教练列表<font style="float:right;padding-right:10px;" onclick="cancelEditTeacher()">X</font>
	</div>
	
	<input  id="teacherQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchTeacher()">查询</button>
	<div id="teacherList" style="border:2px solid #CCC;height:200px;overflow-y:scroll;margin:10px;">
	
	</div>
 </div>	
</div>

<div class="salerMask">
 <div class="addDIV">
	<div style="background-color:#E0ECFF;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	售课人列表<font style="float:right;padding-right:10px;" onclick="cancelEditSaler()">X</font>
	</div>
	
	<input  id="salerQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchSaler()">查询</button>
	<div id="salerList" style="border:2px solid #CCC;height:200px;overflow-y:scroll;margin:10px;">
	
	</div>
 </div>	
</div>

	
<div class="addCtDIV">
 
   <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">课程信息</h3>
        </div>

                <div class="btn btn-div" onclick="addCourse(null)" style="float:right">✚添加
              	</div>
              		<div id="courseInfo" style="display:none">
              		
              		 <p id="cname"></p>
              		 <p id="ctype"></p>
              		 <p id="camount"></p>
              		 
              		 <input name="cid" id="cid" type="hidden"/>
					 </div>
        
    </div>
</div> <br/>



 
             
<div class="addCtDIV">
<div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">会员信息</h3>
        </div>

            <div class="btn btn-div" onclick="addMember(null)" style="float:right">✚添加
            </div>
              	<div id="memberInfo" style="display:none">
              	   <p id="mname"></p>
              	   <p id="mgender"></p>
              	   <p id="mphone"></p>
              	   <input name="mid" id="mid" type="hidden"/>
               </div>
	 
</div>
</div>	<br/>	

<div class="addCtDIV">
<div class="panel-body">
		<table class="addCtTable">
  
			   <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
 
               </tr>
	</table>
	</div>
</div>

</form>

<div class="courseMask">
 <div class="addCtDIV"> 
	<div style="background-color:#E0ECFF;height:30px;width:150;color:#000000;font-size:18px;padding-left:10px;">
	课程信息<font style="float:right;padding-right:10px;" onclick="cancelEdit()">X</font>
	</div>
	
	<input type="text" id="cnameQuery" width="width:20%"/>
	
	<button class="btn"  onclick="searchCourse()">查询</button>
	<div id="courseList" style="border:2px solid #CCC;height:180px;overflow-y:scroll;margin:2px;">	
	</div>
	 <button class="btn" onclick="selectCourse()">确定</button>
 </div>	
</div><br/>

<div class="memberMask">
 <div class="addCtDIV">
	<div style="background-color:#E0ECFF;height:30px;width:150;color:#000000;font-size:18px;padding-left:10px;">
	会员信息<font style="float:right;padding-right:10px;" onclick="cancelEdit()">X</font>
	</div>
	
	<input type="text" id="mnameQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchMember()">查询</button>
	<div id="memberList" style="border:2px solid #CCC;height:180px;overflow-y:scroll;margin:2px;">
	
	</div>
	   <button class="btn" onclick="selectMember()">确定</button>
 </div>	
</div>

<div class="addDIV">
		<c:if test="${resultMessage!=null}">
		<div id="cancelWindowMask" style="display:block">
		<div style="background-color:#E0ECFF;height:70px;width:400;color:#FF3030;font-size:18px;padding-left:20px;">
		<font style="float:right;padding-right:20px;" onclick="cancelWindowMask()">X</font>
		<b>${resultMessage}</b>

		</div>
		</div>
		</c:if>
</div>


</body>
</html>