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
	            action = "<%=path %>/tsmana.action?index=1";
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
			             action = "<%=path %>/tsmana.action?index="+pageNo;
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
		        action = "<%=path %>/tsmana.action?index="+pageNo;
		        submit();
		    }
		}
        
        function last()
		{ 
		   var totlePage='<%=totlePage%>';
			with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/tsmana.action?index="+totlePage;
	            submit();
	        }
		}
		
		function add(){
			
			window.location.href="<%=path%>/admin/qqhadd.jsp";
		
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
		            action = "<%=path %>/zpmodifybefore.action?id="+j;
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
		            action = "<%=path %>/tsdel.action?id="+j;
		            submit();
		        }
		    }
		}
		
		 function search()
			{ 
				with (document.getElementById("memberForm")) {
		            method = "post";
		            action = "<%=path %>/tsmana.action";
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
<div class="current">用户留言</div>
<div class="infolist">
 <form id="memberForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="7" class="title">
   
    </td>
    </tr>
  <tr class="line_g hover_bg">
    <td width="10%" align="center"><strong>内容</strong></td>
     <td width="10%" align="center"><strong>发布人</strong></td>
    <td width="10%" class="jianju10"><strong>发布时间</strong></td>
     <td width="10%" align="center"><strong>回复内容</strong></td>
      <td width="10%" align="center"><strong>操作</strong></td>
  </tr>
  
   <%
			for(int i = 0;i<list.size();i++){
				Ts bean = (Ts)list.get(i);
			%>
  <tr class="line_g hover_bg">
    <td align="center"><%=bean.getDescs() %></td>
     <td align="center"><%=bean.getNames() %></td>
    <td class="jianju10"><%=bean.getTimes() %></td>
     <td align="center"><%=bean.getHfdescs() %></td>
        <td align="center"><a href="<%=path %>/admin/hfadd.jsp?id=<%=bean.getId() %>">回复</a> </td>
  </tr>
  <%} %>
  <tr class="title">
    <td colspan="7" valign="middle">
    
    <div class="page fright">
    <ul>
     <li>共<strong class="color_red"><%=totleNum %></strong>条</li>
     <li><a href="#" onclick="frist()">首页</a></li>
     <li><a href="#" onclick="back()">上一页</a></li>
     <li><%=currentPage %>/<%=totlePage %></li>
     <li><a href="#" onclick="next()">下一页</a></li>
     <li><a href="#" onclick="last()">尾页</a></li>
     
    </ul>
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

