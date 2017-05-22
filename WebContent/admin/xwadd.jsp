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
<div class="current">通知新增</div>
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
	
	var cpno = document.getElementById("titles").value;
	if(cpno==''){
		alert("标题不能为空！");
		return;
	}
	
	document.ThisForm.submit();
	
}

</script> 
<div class="infolist">
<form method="post" action="<%=path %>/xwadd.action" method="post" name="ThisForm" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6" class="title center">通知信息 
    </td>
    </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">标题：</td>
    <td width="90%" class="jianju20"><input type="text" id="titles" name="titles" class="text width300" /></td>
  </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">图片：</td>
    <td width="90%" class="jianju20"><input type="file" name="image" size="20"/></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">内容：</td>
    <td width="90%" class="jianju20">
    <textarea rows="20" cols="50" id="descs" name="descs"></textarea>
    
    </td>
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

