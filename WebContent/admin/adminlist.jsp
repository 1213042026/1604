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

  function frist()
		{
		 	with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/adminmana.action?index=1";
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
			             action = "<%=path %>/adminmana.action?index="+pageNo;
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
		        action = "<%=path %>/adminmana.action?index="+pageNo;
		        submit();
		    }
		}
        
        function last()
		{ 
		   var totlePage='<%=totlePage%>';
			with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/adminmana.action?index="+totlePage;
	            submit();
	        }
		}
		
		function add(){
			
			window.location.href="<%=path%>/admin/adminadd.jsp";
		
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
		            action = "<%=path %>/admin/gzadd.jsp?id="+j;
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
		        show("请选择需要删除的数据！");
		        return;
		    }
		    if (window.confirm("确认删除吗？")) {
		        with (document.getElementById("memberForm")) {
		            method = "post";
		            action = "<%=path %>/admindel.action?id="+j;
		            submit();
		        }
		    }
		}
		
		 function search()
			{ 
				with (document.getElementById("memberForm")) {
		            method = "post";
		            action = "<%=path %>/adminmana.action";
		            submit();
		        }
			}
			
		 function checkAll() {
			    for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			        document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
			    }
			}
			
			function show(message) {
				$('#tipMessage label .context').text(message);
				$('#tipMessage').show(500, function() {
					window.setTimeout(function() {
						$('#tipMessage').hide(500);
					}, 1500)
				});
			}
</script>
</head>

<body>
<div class="alert alert-info" style="text-align:center;display:none;" id="tipMessage">
	<button type="button" class="close" data-dismiss="alert">
		<i class="icon-remove"></i>
	</button>

	<label class="context">11</label>
	<br />
</div>

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
		<li class="active">客户管理</li>
	</ul>
</div>

<div class="infolist">
 <form id="memberForm">
 <div class="row">
	<div class="col-xs-12">
	<div class="row">
	<div class="col-xs-12">
	<div class="table-responsive">
	<div>
	<a style="margin: 2px 10px 2px 0px;" href="javascript:void(0);" class="btn btn-sm btn-info" onclick="add()"><i class="icon-plus bigger-120"></i>新增</a>
	<a style="margin: 2px 10px 2px 0px;" href="javascript:void(0);" class="btn btn-sm btn-danger" onclick="deletes()"><i class="icon-trash bigger-120"></i>删除</a>
	</div>
<table id="sample-table-1" class="table table-striped table-bordered table-hover">
      <thead>
		<tr>
			<th class="center">
				
			</th>
			<th>用户名</th>
			<th>密码</th>
			<th>电话</th>
			<th>邮箱</th>
			<th class="hidden-480">姓名</th>
			<th>身份证</th>
		</tr>
	</thead>
  	
  	<tbody>
  
   <%
			for(int i = 0;i<list.size();i++){
				TAdmin bean = (TAdmin)list.get(i);
			%>
  <tr>
    <td class="vt-al">
    <label>
			<input type="checkbox" class="ace" name="selectFlag" id="selectFlag" value="<%=bean.getId()%>" />
			<span class="lbl"></span>
		</label>
   </td>
    <td class="vt-al"><%=bean.getUsername() %></td>
    <td class="vt-al"><%=bean.getPassword() %></td>
    <td class="vt-al"><%=bean.getTel() %></td>
     <td class="vt-al"><%=bean.getEmail() %></td>
    <td class="vt-al hidden-480">
    <span class="label label-sm label-warning"><%=bean.getRealname() %></span>
    </td>
      <td class="vt-al"><%=bean.getNo() %></td>
  </tr>
  <%} %>
  <tr class="title">
    <td colspan="7" valign="middle">
    <div>
		<ul class="pagination">
			<li>
				<a href="#">共<%=totleNum %>条</a>
			</li>

			<li>
				<a href="#" onclick="frist()">首页</a>
			</li>

			<li>
				<a href="#" onclick="back()">上一页</a>
			</li>

			<li class="active">
				<a href="#"><%=currentPage %>/<%=totlePage %></a>
			</li>

			<li>
				<a href="#" onclick="next()">
					下一页
				</a>
			</li>

			<li>
				<a href="#" onclick="last()">尾页</a>
			</li>
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

