<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Car bean = (Car)request.getAttribute("bean");
	List list = (ArrayList)request.getAttribute("list");
	String pic=path+"/"+bean.getUrl();
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
<div class="current">学生修改</div>
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
		alert("学号不能为空！");
		return;
	}
	
	document.ThisForm.submit();
	
}

</script> 
<div class="infolist">
<form method="post" action="<%=path %>/carmodify.action" method="post" name="ThisForm">
<input type="hidden" id="id" name="id" value="<%=bean.getId() %>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6" class="title center">车辆信息 
    </td>
    </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">车号：</td>
    <td width="90%" class="jianju20"><input type="text" id="no" name="no" class="text width300" value="<%=bean.getNo() %>"/></td>
  </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">车名：</td>
    <td width="90%" class="jianju20"><input type="text" id="stuname" name="stuname" class="text width300" value="<%=bean.getStuname() %>"/></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">级别：</td>
    <td width="90%" class="jianju20">
     <select id="jzname" name="jzname">
      <option  value="<%=bean.getJzname() %>"><%=bean.getJzname() %></option>
     <option  value="SUV">SUV</option>
     <option  value="紧凑">紧凑</option>
     <option  value="中型">中型</option>
     <option  value="中大型">中大型</option>
     <option  value="大型">大型</option>
    </select>
    </td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">价格：</td>
    <td width="90%" class="jianju20"><input type="text" id="tel" name="tel" class="text width300" value="<%=bean.getTel() %>"/></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">排量：</td>
    <td width="90%" class="jianju20"><input type="text" id="address" name="address" class="text width300" value="<%=bean.getAddress() %>"/></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">预约开始时间：</td>
    <td width="90%" class="jianju20"><input type="text" id="bt" name="bt" class="text width300" value="<%=bean.getBt() %>"/></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">预约结束时间：</td>
    <td width="90%" class="jianju20"><input type="text" id="et" name="et" class="text width300" value="<%=bean.getEt() %>"/></td>
  </tr>
   <tr class="line_g">
    <td width="10%" class="jianju10">图片：</td>
    <td width="90%" class="jianju20"><input type="file" name="image" size="20"/>
    <img alt="" src="<%=pic %>">
    </td>
  </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">品牌：</td>
    <td width="90%" class="jianju20">
    <select id="bjnames" name="bjnames">
     <option  value="<%=bean.getBjnames() %>"><%=bean.getBjnames() %></option>
     <%
			for(int i = 0;i<list.size();i++){
				Pp bean2 = (Pp)list.get(i);
			%>
     <option  value="<%=bean2.getNames() %>"><%=bean2.getNames() %></option>
     <%} %>
    </select>
    </td>
  </tr>
  <tr class="line_g">
    <td width="10%" class="jianju10">描述：</td>
    <td width="90%" class="jianju20">
    
    <textarea rows="20" cols="50" id="dw" name="dw"><%=bean.getDw() %></textarea>
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

