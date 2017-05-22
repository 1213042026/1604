<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String types = request.getSession().getAttribute("userType").toString();
String names = "";
if(types.equals("1")){
 TAdmin	bean = (TAdmin)request.getSession().getAttribute("admin");
 	names = bean.getUsername();
}else{
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新月出租车公司管理系统</title>
<style type="text/css">
body {background: #686868; font-family:Arial, Helvetica, sans-serif; font-size:12px; margin:0px; margin-bottom:2px;border-bottom: 1px #ccc solid;}
h1 {color: #FFF;}
a {color: #FFF; text-decoration: none;/*防止滤镜下链接失效*/position:relative;}
ul { list-style:none;}
#all {width: 100%;}
#banner {margin-top: 8px; margin-left: 32px;}
#main {width: 100%; margin-bottom: 2px; background:#eeeeee; margin-left: 0px; margin-right:0px; height: 30px; color: #000; line-height: 2.4;overflow: auto;}
#main a {color:#000;}
#welcome { float:left; width: 40%; font-weight: 800; padding-left: 8px; position:relative;}
#adminop { float:left; width: 59%; position:relative; text-align:right; line-height:1; *line-height:2.2;}
#adminop ul li {float: right; width: 80px;}
#nav {width: 100%; clear: both;}
#nav ul li {float: right; width:82px; height:25px; line-height: 2.1; text-align: center;}
.inactive { background-image/**/:url(images/admin/nav_bg_inactive2.png) !important;background: none; margin-left: 2px; margin-right:2px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=images/admin/nav_bg_inactive2.png);}
.inactive a {color: #000;}
.active {background:url(images/admin/nav_bg_active2.png) !important;background: none; margin-left: 2px; margin-right:2px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=images/admin/nav_bg_active2.png);}
.active a {color:#fff;}
.blankgray {background:#bbb; height:2px; width:100%; margin:0; padding:0; clear:both; font-size:2px;}
</style>
<script type="text/javascript" language="javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
var oplist = new Array('about', 'user', 'news', 'mars', 'jielong', 'box', 'school', 'config', 'other');
$(document).ready(function() {
	$('#nav').find("a").click(function() {
		var id = $(this).attr('id');
		$.each(oplist, function(i, n) {
			$('#'+n).attr('class', 'inactive');
		});
		$(this).parents("li").attr('class', 'active');
	});
});

function loginout(){

    window.parent.location.href="<%=path %>/loginout.action";
}

function index(){

    window.parent.location.href="<%=path %>/index.action";
}
</script>
</head>

<body>
<div id="all">
	<div id="banner"><h1>新月出租车公司管理系统</h1></div>
    <div id="nav">
    	<ul>
        </ul>
    </div>
    <div id="main">
    	<div id="welcome">  欢迎你回来,<%=names %>!</div>
        <div id="adminop">
            <ul> 
            <li><a href="#"  onclick="loginout()">注销</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
