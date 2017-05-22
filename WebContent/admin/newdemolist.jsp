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
<div class="infolist">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6" class="title">
    <ul class="zsgc fleft">
      <li><a href="#">新增</a></li>
      <li><a href="#">删除</a></li>
      <li><a href="#">修改</a></li> 
      <li><a href="#">编辑</a></li>
    </ul>
    <div class="list_date fright">
    <form name="form" id="form">
      <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)"  class="select">
        <option>全部</option>
        <option>组织机构</option>
      </select>
    </form>
    </div>
    </td>
    </tr>
  <tr class="line_g hover_bg">
    <td width="5%" align="center"><form id="form1" name="form1" method="post" action="">
      <p>
        <label>
          <input type="checkbox" name="CheckboxGroup1" value="单选框" id="CheckboxGroup1_0" /></label>
      </p>
    </form></td>
    <td width="5%" align="center"><strong>编号</strong></td>
    <td width="6%" align="center"><strong>类型</strong></td>
    <td width="68%" class="jianju10"><strong>标题</strong></td>
    <td width="10%" align="center"><strong>更新时间</strong></td>
    <td width="8%" align="center"><strong>发布人</strong></td>
  </tr>
  <tr class="line_g hover_bg">
    <td width="5%" align="center"><form id="form1" name="form1" method="post" action="">
      <p>
        <label>
          <input type="checkbox" name="CheckboxGroup1" value="单选框" id="CheckboxGroup1_0" /></label>
      </p>
    </form></td>
    <td align="center">1</td>
    <td align="center">通报</td>
    <td class="jianju10"><a href="#" class="color_red">关于免去贾留华大学生创业网总经理职务的决定</a></td>
    <td align="center">2013-04-27</td>
    <td align="center"><a href="#" class="name">赵常升</a></td>
  </tr>
  <tr class="title">
    <td colspan="6" valign="middle">
     <ul class="zsgc fleft mt7">
      <li><a href="#">新增</a></li>
      <li><a href="#">删除</a></li>
      <li><a href="#">修改</a></li> 
      <li><a href="#">编辑</a></li>
    </ul>
    <div class="page fright">
    <ul>
     <li>共<strong class="color_red">126</strong>条</li>
     <li>首页</li>
     <li>上一页</li>
     <li>1/3</li>
     <li><a href="#">下一页</a></li>
     <li><a href="#">尾页</a></li>
     <li>转到第<input type="text" class="page_numble" />页</li>
     <li><input type="button" value="" class="go mt7" /></li>
    </ul>
    </div>
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

