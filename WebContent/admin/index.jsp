<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String names = request.getSession().getAttribute("realname").toString();
	String userType = request.getSession().getAttribute("userType").toString();
    
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>基于SSH的4S店汽车试驾系统</title>
<link href="<%=path %>/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=path %>/admin/assets/css/ace-skins.min.css" />
<script src="<%=path %>/admin/assets/js/ace-extra.min.js"></script>
<script src="<%=path %>/admin/assets/js/jquery-2.0.3.min.js"></script>
<link href="<%=path %>/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/style/js.js"></script>
</head>

<body id="index">
<div class="top-nav">
	<div>基于SSH的4S店汽车试驾系统</div>
	<div id="userInfo">你好，管理员<%=names %></div>
</div>

<div class="main-container-inner">
	<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
<div class="sidebar" id="sidebar">
	<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
<ul class="nav nav-list">
	<h2>管理菜单</h2>

	<%if(userType.equals("管理员")){ %>
	<li class="active">
		<a href="<%=path %>/adminmana.action" target="frameBord">
			<i class="icon-user"></i>
			<span class="menu-text"> 客户管理 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/bjmana.action" target="frameBord">
			<i class="icon-life-ring"></i>
			<span class="menu-text"> 品牌管理 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/carmana.action" target="frameBord">
			<i class="icon-car"></i>
			<span class="menu-text"> 车辆管理 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/tsmana.action" target="frameBord">
			<i class="icon-bitbucket"></i>
			<span class="menu-text"> 用户留言 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/yymana2.action" target="frameBord">
			<i class="icon-yahoo"></i>
			<span class="menu-text"> 预约信息 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/xwmana.action" target="frameBord">
			<i class="icon-snapchat"></i>
			<span class="menu-text"> 信息通知 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/carmanatj.action" target="frameBord">
			<i class="icon-xing"></i>
			<span class="menu-text"> 车辆推荐 </span>
		</a>
	</li>
	<%}else{ %>
	<li>
		<a href="<%=path %>/tsmana2.action" target="frameBord">
			<i class="icon-wechat"></i>
			<span class="menu-text"> 我的留言 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/xwmana2.action" target="frameBord">
			<i class="icon-snapchat"></i>
			<span class="menu-text"> 信息通知 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/carmana2.action" target="frameBord">
			<i class="icon-car"></i>
			<span class="menu-text"> 车辆查看 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/yymana.action" target="frameBord">
			<i class="icon-yahoo"></i>
			<span class="menu-text"> 我的预约 </span>
		</a>
	</li>

	<li>
		<a href="<%=path %>/carmanatj.action" target="frameBord">
			<i class="icon-car"></i>
			<span class="menu-text"> 车辆推荐 </span>
		</a>
	</li>
	<%} %>
	<li>
		<a href="<%=path %>/admin/login.jsp">
			<i class="icon-sign-out"></i>
			<span class="menu-text"> 安全退出 </span>
		</a>
	</li>
</ul>
</div>
<div class="main-content">
<iframe id="frameBord" name="frameBord" frameborder="0" width="100%" height="100%" src="<%=path %>/xwmana2.action"></iframe>
</div>
</div>

<script src="<%=path %>/admin/assets/js/bootstrap.min.js"></script>
		<script src="<%=path %>/admin/assets/js/typeahead-bs2.min.js"></script>
		<script src="<%=path %>/admin/assets/js/ace-elements.min.js"></script>
		<script src="<%=path %>/admin/assets/js/ace.min.js"></script>
</body>
</html>

 