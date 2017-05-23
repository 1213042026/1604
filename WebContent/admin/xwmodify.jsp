<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Xw bean = (Xw)request.getAttribute("bean");
	String pic=path+"/"+bean.getUrl();
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
<script type="text/javascript">
  $(function() {
    $('#id-input-file-1 , #id-input-file-2').ace_file_input({
          no_file:'No File ...',
          btn_choose:'Choose',
          btn_change:'Change',
          droppable:false,
          onchange:null,
          thumbnail:false //| true | large
          //whitelist:'gif|png|jpg|jpeg'
          //blacklist:'exe|php'
          //onchange:''
          //
        });
  })
</script>
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
    <li class="active">车辆管理</li>
    <li class="active">通知修改</li>
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
	
	var cpno = document.getElementById("titles").value;
	if(cpno==''){
		alert("标题不能为空！");
		return;
	}
	
	document.ThisForm.submit();
	
}

</script> 
<div class="infolist">
<form method="post" action="<%=path %>/xwmodify.action" method="post" name="ThisForm" enctype="multipart/form-data">
<input type="hidden" id="id" name="id" value="<%=bean.getId() %>">
<table id="sample-table-1" class="table">
<thead>
    <tr><th colspan="2" style="text-align: center;">通知信息 </th>
    </tr>
    </thead>
    <tbody>
  <tr>
    <td>标题：</td>
    <td><input type="text" id="titles" name="titles" value="<%=bean.getTitles() %>"/></td>
  </tr>
  <tr>
    <td>图片：</td>
    <td><input id="id-input-file-2" type="file" name="image" size="20"/>
    <img alt="" src="<%=pic %>">
    </td>
  </tr>
   <tr>
    <td>内容：</td>
    <td>
    <textarea style="resize: none;" rows="20" cols="50" id="descs" name="descs"><%=bean.getDescs() %></textarea>
    
    </td>
  </tr>
  <tr>
    <td colspan="2" style="text-align: center;">
    <button type="button" class="btn btn-info" onclick="ok()">保存<i class="icon-arrow-right icon-on-right bigger-110"></i></button>
    </td>
    </tr>
</table>
</form>
</div>
</div>
</div>

</body>
</html>

