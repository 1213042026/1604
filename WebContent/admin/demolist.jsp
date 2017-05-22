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
<title>无标题文档</title>
<style type="text/css">

<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->

</style>

<script type="text/javascript">

  function frist()
		{
		 	with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/demomana.action?index=1";
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
			             action = "<%=path %>/demomana.action?index="+pageNo;
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
		        action = "<%=path %>/demomana.action?index="+pageNo;
		        submit();
		    }
		}
        
        function last()
		{ 
		   var totlePage='<%=totlePage%>';
			with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/demomana.action?index="+totlePage;
	            submit();
	        }
		}
		
		function add(){
			
			window.location.href="<%=path%>/admin/ggadd.jsp";
		
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
		            action = "<%=path %>/viewgmzn.action?id="+j;
		            submit();
		        }
		    }
		}
		function deletes() {
		    var flag = false;
		    var j=0;
		    for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
		        if (document.getElementsByName("selectFlag")[i].checked) {
		            flag = true;
		            j=document.getElementsByName("selectFlag")[i].value;
		        }
		    }
		    if (!flag) {
		        alert("请选择需要删除的数据！");
		        return;
		    }
		    if (window.confirm("确认删除吗？")) {
		        with (document.getElementById("memberForm")) {
		            method = "post";
		            action = "<%=path %>/ggdel.action?id="+j;
		            submit();
		        }
		    }
		}

</script>

</head>

<body>
<h3>基本信息</h3>
 <form id="memberForm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">
          <table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="<%=path %>/admin/images/mod.gif" width="14" height="14" onclick="modify()" /></div></td>
                    <td class="STYLE1"><div align="center">修改</div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
       <td height="22" bgcolor="#FFFFFF" width="5%"><div align="center"><strong><span class="STYLE1"></span></strong></div></td>
       <td height="22" bgcolor="#FFFFFF" width="15%"><div align="center"><strong><span class="STYLE1">类别</span></strong></div></td>
       <td height="22" bgcolor="#FFFFFF" width="20%"><div align="center"><strong><span class="STYLE1">更新时间</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">内容</span></strong></div></td>
      </tr>
			 <%
			for(int i = 0;i<list.size();i++){
				Demo bean = (Demo)list.get(i);
			%>
			<tr>
       <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><input type="checkbox" name="selectFlag" id="selectFlag" class="checkbox1"
                                       value="<%=bean.getId()%>"></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=bean.getTypes() %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=bean.getTimes() %></span></div></td>
         <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=bean.getDescs() %></span></div></td>
      </tr>
			<%} %>					
      
    </table></td>
  </tr>
  <tr>
    <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="75%" valign="top" class="STYLE1"><div align="right">
            <table width="652" height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
              <td width="362" height="22" valign="middle"><div align="right">   当前第<%=currentPage %>页/共<%=totlePage %>页&nbsp;&nbsp;共<%=totleNum %>条记录&nbsp;&nbsp;</div></td>
           
                <td width="62" height="22" valign="middle"><div align="right"><img src="<%=path %>/admin/images/page_first_1.gif" width="48" height="20" onclick="frist()" /></div></td>
                <td width="50" height="22" valign="middle"><div align="right"><img src="<%=path %>/admin/images/page_back_1.gif" width="55" height="20" onclick="back()"/></div></td>
                <td width="54" height="22" valign="middle"><div align="right"><img src="<%=path %>/admin/images/page_next.gif" width="58" height="20" onclick="next()"/></div></td>
                <td width="49" height="22" valign="middle"><div align="right"><img src="<%=path %>/admin/images/page_last.gif" width="52" height="20" onclick="last()"/></div></td>
              </tr>
            </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
