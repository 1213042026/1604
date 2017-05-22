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
<title>G.net综合信息服务管理平台</title>
<link rel="stylesheet" href="<%=path %>/admin/css/global.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/list.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/menu.css" type="text/css"/>
<script src="<%=path %>/admin/js/fixPNG.js" type="text/javascript"></script>
</head>

<body>
<!-- header -->
<jsp:include page="top.jsp" flush="false"></jsp:include>
<!-- content -->
<div class="content">
<div class="content_box">
<div class="current"><a href="#">个人桌面</a><span> > </span> <a href="#">基础信息</a><span>></span>组织机构</div>
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
<div class="infolist">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6" class="title center">新建日志（2013-05-20 星期一） 
    </td>
    </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">日志标题：</td>
    <td width="90%" class="jianju20"><input type="text" class="text width300" /><a href="#">清空</a></td>
  </tr>
  <tr class="line_g">
    <td class="jianju10">日志类型：</td>
    <td class="jianju20"><div class="list_date">
    <form name="form" id="form">
      <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)"  class="select">
        <option>全部</option>
        <option>工作日志</option>
      </select>
    </form>
    </div>
    </td>
  </tr>
  <tr class="line_g">
    <td class="jianju10">创建日期：</td>
    <td class="jianju20"><pre><input type="text" class="mh_date" readonly="true" /></pre></td>
  </tr>
  <tr class="line_g">
    <td colspan="2">
    <input type="button" value="保存" class="btn" />
    <input type="button" value="取消" class="btn" />
    </td>
    </tr>
</table>
</div>
</div>
</div>

<!-- footer -->

<div id="footer">
   
    <div class="clear"></div>
  </div>
</body>
</html>

