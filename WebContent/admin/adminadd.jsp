<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=path %>/admin/css/global.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/list.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/menu.css" type="text/css"/>
<script src="<%=path %>/admin/js/fixPNG.js" type="text/javascript"></script>
</head>

<body>
<!-- content -->
<div class="content">
<div class="content_box">
<div class="current">客户新增</div>
<script type="text/javascript">
$(function (){
	$("input.mh_date").manhuaDate({					       
		Event : "click",//可选				       
		Left : 0,//弹出时间停靠的左边位置
		Top : -16,//弹出时间停靠的顶部边位置
		fuhao : "-",//日期连接符默认为-
		isTime : false,//是否开启时间值默认为false
		beginY : 2010,//年份的开始默认为1949
		endY :2015//年份的结束默认为2049
	});
});
</script>
<script type="text/javascript">

function ok(){
	
	var cpno = document.getElementById("realname").value;
	if(cpno==''){
		alert("用户名不能为空！");
		return;
	}
	
	document.ThisForm.submit();
	
}

</script> 
<div class="infolist">
<form method="post" action="<%=path %>/adminadd.action" method="post" name="ThisForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6" class="title center">客户信息 
    </td>
    </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">用户名：</td>
    <td width="90%" class="jianju20"><input type="text" id="username" name="username" class="text width300" /></td>
  </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">密码：</td>
    <td width="90%" class="jianju20"><input type="text" id="password" name="password" class="text width300" /></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">电话：</td>
    <td width="90%" class="jianju20"><input type="text" id="tel" name="tel" class="text width300" /></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">邮箱：</td>
    <td width="90%" class="jianju20"><input type="text" id="email" name="email" class="text width300" /></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">真实姓名：</td>
    <td width="90%" class="jianju20"><input type="text" id="realname" name="realname" class="text width300" /></td>
  </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">身份证：</td>
    <td width="90%" class="jianju20"><input type="text" id="no" name="no" class="text width300" /></td>
  </tr>
  <tr class="line_g">
    <td colspan="2">
    <input type="button" value="保存" class="btn" onclick="ok()"/>
    </td>
    </tr>
</table>
</form>
</div>
</div>
</div>
</body>
</html>

