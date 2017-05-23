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
<link href="<%=path %>/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/ace-skins.min.css" />
<script src="<%=path %>/admin/assets/js/ace-extra.min.js"></script>
<script src="<%=path %>/admin/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path %>/admin/assets/js/bootstrap.min.js"></script>
<script src="<%=path %>/admin/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=path %>/admin/assets/js/ace-elements.min.js"></script>
<script src="<%=path %>/admin/assets/js/ace.min.js"></script>

<link rel="stylesheet" href="<%=path %>/admin/css/global.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/list.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/menu.css" type="text/css"/>
<script src="<%=path %>/admin/js/fixPNG.js" type="text/javascript"></script>
</head>

<body>
<!-- content -->
<div class="content">
<div class="content_box">
<div class="breadcrumbs" id="breadcrumbs">
  <script type="text/javascript">
    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
  </script>

  <ul class="breadcrumb">
    <li>
      <i class="icon-home home-icon"></i>
      <a href="#">首页</a>
    </li>
    <li class="active">客户管理</li>
    <li class="active">客户新增</li>
  </ul>
</div>

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
<table id="sample-table-1" class="table">
<thead>
    <tr><th colspan="2" style="text-align: center;">客户信息 </th>
    </tr>
    </thead>
    <tbody>

  <tr>
    <td>用户名：</td>
    <td><input type="text" id="username" name="username" class="text width300" /></td>
  </tr>
  <tr>
    <td>密码：</td>
    <td><input type="text" id="password" name="password" class="text width300" /></td>
  </tr>
   <tr>
    <td>电话：</td>
    <td><input type="text" id="tel" name="tel" class="text width300" /></td>
  </tr>
   <tr>
    <td>邮箱：</td>
    <td><input type="text" id="email" name="email" class="text width300" /></td>
  </tr>
   <tr>
    <td>真实姓名：</td>
    <td><input type="text" id="realname" name="realname" class="text width300" /></td>
  </tr>
  <tr>
    <td>身份证：</td>
    <td><input type="text" id="no" name="no" class="text width300" /></td>
  </tr>
  <tr>
    <td colspan="2" style="text-align: center;">
    <button type="button" class="btn btn-info" onclick="ok()">保存<i class="icon-arrow-right icon-on-right bigger-110"></i></button>

    </td>
    </tr>
    </tbody>
</table>
</form>
</div>
</div>
</div>
</body>
</html>

