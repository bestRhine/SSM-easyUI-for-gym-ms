<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
<title>健身管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<LINK rel="stylesheet" type="text/css"
	href="${baseurl}js/easyui/styles/default.css">
<%@ include file="/WEB-INF/jsp/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/common_js.jsp"%>
<SCRIPT type="text/javascript">
	var tabOnSelect = function(title) {
		//根据标题获取tab对象
		var currTab = $('#tabs').tabs('getTab', title);
		var iframe = $(currTab.panel('options').content);//获取标签的内容

		var src = iframe.attr('src');//获取iframe的src
		//当重新选中tab时将ifram的内容重新加载一遍，目的是获取当前页面的最新内容
		if (src)
			$('#tabs').tabs('update', {
				tab : currTab,
				options : {
					content : createFrame(src)
				//ifram内容
				}
			});

	};
	var _menus;
	$(function() {//预加载方法 
		//通过ajax请求菜单
		/* $.ajax({
			url : '${baseurl}menu.json',
			type : 'POST',
			dataType : 'json',
			success : function(data) {
				_menus = data;
				initMenu(_menus);//解析json数据，将菜单生成
			},
			error : function(msg) {
				alert('菜单加载异常!');
			}
		}); */

		//tabClose();
		//tabCloseEven();
		$('#tabs').tabs('add', {
			title : '欢迎使用',
			content : createFrame('${baseurl}welcome.jsp')
		}).tabs({
			//当重新选中tab时将ifram的内容重新加载一遍
			onSelect : tabOnSelect
		});
		
		//修改密码
		$('#modifypwd').click(menuclick);

	});
	
/* 	$(function() {//预加载方法 
		$('#tabs').tabs('add', {
			title : '个人中心',
			content : createFrame('${baseurl}personalcenter.action')
		}).tabs({
			//当重新选中tab时将ifram的内容重新加载一遍
			onSelect : tabOnSelect
		});
		
		//修改密码
		$('#personalcenter').click(menuclick);

	});
	 */

	//退出系统方法
	function logout() {
		_confirm('您确定要退出本系统吗?', null, function() {
			location.href = '${baseurl}logout.action';
		})
	}

	//帮助
	function showhelp() {
		window.open('${baseurl}help.html', '帮助文档');
	}
</SCRIPT>



<META name="GENERATOR" content="MSHTML 9.00.8112.16540">
</HEAD>

<BODY style="overflow-y: hidden;" class="easyui-layout" scroll="no">
	<DIV
		style='background: url("images/layout-browser-hd-bg.gif") repeat-x center 50% rgb(127, 153, 190); height: 30px; color: rgb(255, 255, 255); line-height: 20px; overflow: hidden; font-family: Verdana, 微软雅黑, 黑体;'
		border="false" split="true" region="north">
		<SPAN style="padding-right: 20px; float: right;" class="head">
			欢迎当前用户：${activeUser.username}&nbsp;&nbsp; 
			<A href=javascript:showhelp()>使用帮助</A> &nbsp;&nbsp; 
			<A title='个人中心' ref='personalcenter' href=javascript:addTab('个人中心','${baseurl}personalcenter.action') icon='icon-null' id="personalcenter">个人中心</A> &nbsp;&nbsp; 
			<A title='修改密码' ref='modifypwd' href="#" rel='${baseurl}user/updatepwd.action' icon='icon-null' id="modifypwd">修改密码</A> &nbsp;&nbsp; 
			<A id="loginOut" href=javascript:logout()>退出系统</A>

		</SPAN> 
		<SPAN style="padding-left: 10px; font-size: 16px;"><IMG
			align="absmiddle" src="images/gymlogo3.png" width="20" height="20">
			健身管理系统</SPAN> <SPAN style="padding-left: 15px;" id="News"></SPAN>
	</DIV>

	<DIV style="background: rgb(210, 224, 242); height: 30px;"
		split="false" region="south">

		<DIV class="footer">
			系统版本号：${fmsVersion.versionNumber}${fmsVersion.versionType}&nbsp;&nbsp;&nbsp;
			发布日期：<fmt:formatDate value="${fmsVersion.versionDate}" pattern="yyyy-MM-dd" /></DIV>
			
	</DIV>

	<DIV style="width: 180px;" id="west" title="导航菜单" split="true"
		region="west" hide="true">

		<DIV id="nav" class="easyui-accordion" border="false" fit="true">

<%-- 			<c:if test="${activeUser.menus!=null }">
				<ul>
					<c:forEach items="${activeUser.menus }" var="menu">
						<li><div>
								<a title="${menu.name }" ref="1_1" href="#"
									rel="${baseurl }${menu.url }" icon="icon-log"> <span
									class="icon icon-log">&nbsp;</span> <span class="nav"> <a
										href=javascript:addTab('${menu.name }','${baseurl }/${menu.url }')>${menu.name }</a>
								</span>
								</a>
							</div></li>
					</c:forEach>
				</ul>
			</c:if> --%>
			
			<ul id="tt" class="easyui-tree">
				<li><span>教学管理</span>
					<ul>

						<li><span class="nav"><a href=javascript:addTab('合同添加','${baseurl}editContract.action')>合同添加</a></span></li>

						<li><span><a href=javascript:addTab('合同查询','${baseurl}findBy.action')>合同查询</a></span>
						</li>
						<li><span><a href=javascript:addTab('合同管理','${baseurl}ctOperate.action')>合同操作</a></span></li>
						
												
						
						
						<li><span><a href=javascript:addTab('课时报表','${baseurl}listCtTable.action')>课时报表</a></span></li>
						
						
						<li><span>课程管理</span>
						<ul>
						<li><span><a href=javascript:addTab('团课发布','${baseurl}listCourseTable.action')>团课发布</a></span></li>
						
						<li><span><a href=javascript:addTab('课程管理','${baseurl}getCourses.action')>课程管理</a></span></li>
						</ul></li>
					</ul></li>
				<li><span>会籍管理</span>
					<ul>
						<li><span><a href=javascript:addTab('会员管理','${baseurl}userInfo/getUser.action')>会员管理</a></span>
						</li>
						<li><span><a href=javascript:addTab('会员卡管理','${baseurl}vipCardInfo/getCard.action')>卡种管理</a></span>
						</li>
					</ul></li>
					
					<li><span>会员卡操作</span>
					<ul>
						<li><span><a href=javascript:addTab('办卡','${baseurl}userCard/addCard.action')>办卡</a></span>
						</li>
						<li><span><a href=javascript:addTab('会籍合同','${baseurl}userCard/activeCardHome.action')>卡激活</a></span>
						</li>
						<li><span><a href=javascript:addTab('转卡','${baseurl}userCard/transCardHome.action')>转卡</a></span>
						</li>
						<li><span><a href=javascript:addTab('卡延长/续期','${baseurl}userCard/cardRenewalsHome.action')>卡延长/续期</a></span>
						</li>
					</ul></li>
					
				<li><span>员工管理</span>
					<ul>
						<li><span><a href=javascript:addTab('员工管理','${baseurl}empManager/getEmps.action')>员工管理</a></span>
						</li>
						<li><span><a href=javascript:addTab('角色管理','${baseurl}roleManager/getRoles.action')>角色管理</a></span>
						</li>
					</ul></li>
				<li><span>
					
						<a href=javascript:addTab('租户管理','${baseurl}tenantManager/getTenants.action')>租户管理</a></span>
						
				
					</li>
			</ul>
		</DIV>
	</DIV>

	<DIV style="background: rgb(238, 238, 238); overflow-y: hidden;"
		id="mainPanle" region="center">
		<DIV id="tabs" class="easyui-tabs" border="false" fit="true"></DIV>
	</DIV>


</BODY>
</HTML>
