<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List list = (ArrayList)request.getAttribute("list");
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
    <li class="active">车辆新增</li>
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
	
	var cpno = document.getElementById("no").value;
	if(cpno==''){
		alert("车号不能为空！");
		return;
	}
	
	document.ThisForm.submit();
	
}

</script> 
<div class="infolist">
<form method="post" action="<%=path %>/caradd.action" method="post" name="ThisForm" enctype="multipart/form-data">
<table id="sample-table-1" class="table">
    <thead>
    <tr><th colspan="2" style="text-align: center;">车辆信息 </th>
    </tr>
    </thead>
    <tbody>
  <tr>
    <td>车号：</td>
    <td><input type="text" id="no" name="no" /></td>
  </tr>
  <tr>
    <td>车名：</td>
    <td><input type="text" id="stuname" name="stuname" /></td>
  </tr>
   <tr>
    <td>级别：</td>
    <td>
     <select id="jzname" class="form-control" name="jzname">
     <option  value="SUV">SUV</option>
     <option  value="紧凑">紧凑</option>
     <option  value="中型">中型</option>
     <option  value="中大型">中大型</option>
     <option  value="大型">大型</option>
    </select>
    </td>
  </tr>
   <tr>
    <td>价格：</td>
    <td><input type="text" id="tel" name="tel"/></td>
  </tr>
   <tr>
    <td>排量：</td>
    <td><input type="text" id="address" name="address" /></td>
  </tr>
   <tr >
    <td >预约开始时间：</td>
    <td ><input type="text" id="bt" name="bt" /></td>
  </tr>
   <tr>
    <td >预约结束时间：</td>
    <td ><input type="text" id="et" name="et"  /></td>
  </tr>
   <tr >
    <td >图片：</td>
    <td >
        <input type="file" name="image" size="20" id="id-input-file-2" />
    </td>
  </tr>
  <tr >
    <td>品牌：</td>
    <td>
    <select class="form-control" id="bjnames" name="bjnames">
     <%
			for(int i = 0;i<list.size();i++){
				Pp bean = (Pp)list.get(i);
			%>
     <option  value="<%=bean.getNames() %>"><%=bean.getNames() %></option>
     <%} %>
    </select>
    </td>
  </tr>
  <tr>
    <td >描述：</td>
    <td >
    
    <textarea style="resize: none;" rows="20" cols="80" id="dw" name="dw"></textarea>
    </td>
  </tr>
  <tr>
    <td colspan="2" style="text-align: center;">
    <button type="button" class="btn btn-info" onclick="ok()">保存<i class="icon-arrow-right icon-on-right bigger-110"></i></button>
    </td>
    </tr>
    <tbody>
</table>
</form>
</div>
</div>
</div>
</body>
</html>

