<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
 	Pagination p = (Pagination)request.getAttribute("page");
	int totleNum = p.getTotle();
	int totlePage = p.getTotlePage();
	int currentPage = p.getIndex();
	List list = p.getData();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=path %>/admin/css/global.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/list.css" type="text/css"/>
<link rel="stylesheet" href="<%=path %>/admin/css/menu.css" type="text/css"/>
<script src="<%=path %>/admin/js/fixPNG.js" type="text/javascript"></script>
<script type="text/javascript">

  function frist()
		{
		 	with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/carmana.action?index=1";
	            submit();
	        }
		}
        
        
		function back()
		{
		    var pageNo= '<%=currentPage%>';
		    if(pageNo<2){
		 	   alert("当前已经是第一页");
		 	   return;
		    }else{
		 	   pageNo=Number(pageNo)-1;
		    }
				 with (document.getElementById("memberForm")) {
			            method = "post";
			             action = "<%=path %>/carmana.action?index="+pageNo;
			            submit();
			        }
		}
        
		function next()
		{
			   var pageNo= '<%=currentPage%>';
			   var totlePage='<%=totlePage%>';
		    if(pageNo==totlePage){
		 	   alert("当前已经是最后一页");
		 	   return;
		    }else{
		 	   pageNo=Number(pageNo)+1;
		    }  
		    with (document.getElementById("memberForm")) {
		        method = "post";
		        action = "<%=path %>/carmana.action?index="+pageNo;
		        submit();
		    }
		}
        
        function last()
		{ 
		   var totlePage='<%=totlePage%>';
			with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/carmana.action?index="+totlePage;
	            submit();
	        }
		}
		
		function add(){
			
			window.location.href="<%=path%>/admin/stuadd.jsp";
		
		}
		function modify() {
		    var count = 0;
		    var j = 0;
		    for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
		        if (document.getElementsByName("selectFlag")[i].checked) {
		            j = document.getElementsByName("selectFlag")[i].value;
		            count++;
		        }
		    }
		    if (count == 0) {
		        alert("请选择需要修改的数据！");
		        return;
		    }
		    if (count > 1) {
		        alert("一次只能修改一个数据！");
		        return;
		    }
		    if (count == 1) {
		        with (document.getElementById("memberForm")) {
		            method = "post";
		            action = "<%=path %>/stumodifybefore.action?id="+j;
		            submit();
		        }
		    }
		}
		function deletes() {
		    var flag = false;
		    var j = 0;
		    for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
		        if (document.getElementsByName("selectFlag")[i].checked) {
		         j = document.getElementsByName("selectFlag")[i].value;
		            flag = true;
		        }
		    }
		    if (!flag) {
		        alert("请选择需要删除的数据！");
		        return;
		    }
		    if (window.confirm("确认删除吗？")) {
		        with (document.getElementById("memberForm")) {
		            method = "post";
		            action = "<%=path %>/studel.action?id="+j;
		            submit();
		        }
		    }
		}
		
		 function search()
			{ 
				with (document.getElementById("memberForm")) {
		            method = "post";
		            action = "<%=path %>/carmana.action";
		            submit();
		        }
			}
			
		 function checkAll() {
			    for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			        document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
			    }
			}
			
</script>
</head>

<body>
<!-- content -->
<div class="content">
<div class="content_box">
<div class="current">车辆信息</div>
<div class="infolist">
 <form id="memberForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="11" class="title">
    <ul class="zsgc fleft">
    </ul>
   
    </td>
    </tr>
  <tr class="line_g hover_bg">
     <td width="10%" align="center"><strong>车号</strong></td>
    <td width="10%" align="center"><strong>车名</strong></td>
    <td width="10%" align="center"><strong>品牌</strong></td>
    <td width="10%" align="center"><strong>图片</strong></td>
    <td width="8%" class="jianju10"><strong>级别</strong></td>
    <td width="8%" align="center"><strong>价格</strong></td>
    <td width="8%" align="center"><strong>排量</strong></td>
    <td width="10%" align="center"><strong>开始预约</strong></td>
    <td width="10%" align="center"><strong>结束预约</strong></td>
     <td width="10%" align="center"><strong>描述</strong></td>
       <td width="10%" align="center"><strong>操作</strong></td>
  </tr>
  
   <%
			for(int i = 0;i<list.size();i++){
				Car bean = (Car)list.get(i);
				String pic=path+"/"+bean.getUrl();
			%>
  <tr class="line_g hover_bg">
  <td align="center"><%=bean.getNo() %></td>
    <td align="center"><%=bean.getStuname() %></td>
     <td align="center"><%=bean.getBjnames() %></td>
        <td align="center"><img alt="" src="<%=pic%>" height="100" width="100"></td>
    <td class="jianju10"><%=bean.getJzname() %></td>
    <td align="center"><%=bean.getTel() %></td>
     <td align="center"><%=bean.getAddress() %></td>
     <td align="center"><%=bean.getBt() %></td>
     <td align="center"><%=bean.getEt() %></td>
    <td align="center"><%=bean.getDw() %></td>
      <td align="center"><button type="button" class="btn btn-default btn-lg" style="margin:0 auto"><a href="<%=path %>/admin/yyadd.jsp?id=<%=bean.getId() %>">预约 </a> </td></button> 

  </tr>
  <%} %>
  <tr class="title">
    <td colspan="11" valign="middle">
    
    <div class="page fright">
    </div>
    </td>
    </tr>
</table>
</form>

</div>
</div>
</div>

</body>
</html>

