<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<html>
<head>
<TITLE>健身管理系统</TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<LINK rel="stylesheet" type="text/css" href="${baseurl}styles/style.css">
<LINK rel="stylesheet" type="text/css" href="${baseurl}styles/login.css">
<LINK rel="stylesheet" type="text/css"	href="${baseurl}js/easyui/themes/default/easyui.css">
<LINK rel="stylesheet" type="text/css"	href="${baseurl}js/easyui/themes/icon.css">

<STYLE type="text/css">
#content{
	width:800px;
	height:746px;
	margin:0 auto;
	display:flex;
}
.div-inline-1{
	width:600px;
	margin:auto;
}
.div-inline-2{
	width:200px;
	margin:auto;
}
.btnalink {
	cursor: hand;
	display: block;
	width: 80px;
	height: 29px;
	float: left;
	margin: 12px 28px 12px 65px;
	line-height: 30px;
	background: url('${baseurl}images/login/btnbg.jpg') no-repeat;
	font-size: 14px;
	color: #fff;
	font-weight: bold;
	text-decoration: none;
}
</STYLE>


</HEAD>
<BODY style="background: #f6fdff url(${baseurl}images/login/bg1.jpg) repeat-x;">
	<div id="content">
	<div class = "div-inline-1" >
		<h1 style = "color:white;"> <font size="7">SaaS+大数据+物联网</font></h1>
		<img width="500px"  alt="picture" src="${baseurl}images/banner-4.png">
	</div>
	<div class = "div-inline-2" >
		<a href="first.action"><input type="button"  class="btnalink" value="登&nbsp;&nbsp;录" /></a>
		<a href="register.jsp"><input type="button"  class="btnalink" value="注&nbsp;&nbsp;册" /></a>
	</div>
	</div>
</BODY>
</HTML>
