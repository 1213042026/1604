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


<div class="header">
<div class="logo fleft"><h1><font color="white">班级管理系统</font> </h1></div>
<div class="header_right">
<ul>
  <li><a href="#" title="刷新" id="home"></a></li>
  <li><a href="<%=path %>/loginout.action" title="注销登录" id="logout"></a></li>
</ul>
</div>
</div>
