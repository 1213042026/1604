<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String roles=request.getSession().getAttribute("userType").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=path %>/css/metro.css">
<script type="text/javascript" src="<%=path %>/script/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path %>/script/jquery.carousel.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var box_h=$("#metro_box").height();
		var box_w=$("#metro_box").width();
		$("#metro_box").css("margin-top",(($(window).height()-box_h)/2)-10+"px");
		//var img_h=$(".arr_left img").height();
		//var img_w=$(".arr_left img").width();
		//$(".prev").css("position","absolute").css("left","10px").css("top",($(window).height()-img_h)/2);
		//$(".next").css("position","absolute").css("right","10px").css("top",($(window).height()-img_h)/2);
		//链接在新窗口打开
		$(".a_link dd a").attr("target","_blank");
		$(".a_link ul li>a").hover(function(){
			var a_href=$(this).attr("href");			
			$(this).siblings().find("a").attr("href",a_href);
		});
		
		//切屏-----------------------------------------------------------------
		$("#top dl dd a").click(function(){
			var now_class=$(this).attr("class");	
			$("#top dl dd a.a_index").attr("class","a_index");
			$("#top dl dd a.a_mzdw").attr("class","a_mzdw");
			$("#top dl dd a.a_spyy").attr("class","a_spyy");
			$("#top dl dd a.a_xwzx").attr("class","a_xwzx");
			$("#top dl dd a.a_gwtb").attr("class","a_gwtb");
			$("#top dl dd a.a_yxyl").attr("class","a_yxyl");
			$("#top dl dd a.a_sygj").attr("class","a_sygj");
			$("#top dl dd a.a_yszy").attr("class","a_yszy");
			$(this).attr("class",now_class).addClass(now_class+"_h");			
			var index=$(this).index();
			$("#metro_box dd").hide();
			$("#metro_box dd").eq(index).toggle(100);
			if(index==1){
				$("body").attr("class","bg0");	
			}
			switch (index){
				case 0:
					$("body").attr("class","");						
					break;
				case 1:
					$("body").attr("class","bg0");					
					break;
				case 2:
					$("body").attr("class","bg1");						
					break;
				case 3:
					$("body").attr("class","bg2");					
					break;
				case 4:
					$("body").attr("class","bg3");					
					break;
				case 5:
					$("body").attr("class","bg4");						
					break;	
				case 6:
					$("body").attr("class","bg5");						
					break;	
				default :
					$("body").attr("class","bg6");						
			}
			
		});
	});
</script>
</head>
<body>
<!--头部导航开始-->
<div id="top">
  <dl>
    <dd>
      <a class="a_index" href="<%=path %>/loginout.action" target="_self">首页</a>
      </dd>
  </dl>
</div>
<!--头部导航结束--> 
<!--logo区开始-->
<div id="metro_box" class="a_link">

  <dl>
    <dd style="display:none;"></dd>
    <dd style="display:bolck;">
    <!--名站导航-->
      <ul>
      <%if(roles.equals("教师")){ %>
      <li class="one" id="logo_001"><a href="<%=path %>/stumana.action"><img src="images/logo_001.png" width="240" height="120" alt="google"></a><span><a href="#">信息管理</a></span></li>
      <li id="logo_002"><a href="<%=path %>/cjmana.action"><img src="images/logo_baidu.png" width="240" height="120" alt=""></a><span><a href="#">成绩管理</a></span></li>
       <li id="logo_003"><a href="<%=path %>/zymana.action"><img src="images/logo_003.png" width="240" height="120" alt=""></a><span><a href="#">作业管理</a></span></li>
       <li class="one" id="logo_005"><a href="<%=path %>/qjmana.action"><img src="images/logo_005.png" width="240" height="120" alt=""></a><span><a href="#">考勤管理</a></span></li>
      <li id="logo_006"><a href="#"><img src="images/logo_006.png" width="239" height="120" alt=""></a><span><a href="#">文章分析</a></span></li>
       <li id="logo_007"><a href="<%=path %>/zpmana.action"><img src="images/logo_007.png" width="240" height="120" alt=""></a><span><a href="#">风采展示</a></span></li>
      
        <li class="four" id="logo_008"><a href="<%=path %>/ltmana.action"><img src="images/logo_008.png" width="240" height="120" alt=""></a><span><a href="#">家长论坛</a></span></li>
         <li class="one" id="logo_009"><a href="<%=path %>/xwmana.action"><img src="images/logo_004d.png" width="240" height="120" alt="3399小游戏"></a><span><a href="#">班级通知</a></span></li>
           <li id="logo_010"><a href="<%=path %>/tsmana.action"><img src="images/logo_009.png" width="240" height="120" alt=""></a><span><a href="#">悄悄话</a></span></li>
      <%}else if(roles.equals("家长")){ %>
      <li class="one" id="logo_001"><a href="<%=path %>/stumana2.action"><img src="images/logo_001.png" width="240" height="120" alt="google"></a><span><a href="#">信息管理</a></span></li>
      <li id="logo_002"><a href="<%=path %>/cjmana2.action"><img src="images/logo_baidu.png" width="240" height="120" alt=""></a><span><a href="#">成绩管理</a></span></li>
      <li id="logo_003"><a href="<%=path %>/zymana2.action"><img src="images/logo_003.png" width="240" height="120" alt=""></a><span><a href="#">作业管理</a></span></li>
     <li class="one" id="logo_005"><a href="<%=path %>/qjmana2.action"><img src="images/logo_005.png" width="240" height="120" alt=""></a><span><a href="#">考勤管理</a></span></li>
      <li id="logo_006"><a href="#"><img src="images/logo_006.png" width="239" height="120" alt=""></a><span><a href="#">文章分析</a></span></li>
       <li id="logo_007"><a href="<%=path %>/zpmana2.action"><img src="images/logo_007.png" width="240" height="120" alt=""></a><span><a href="#">风采展示</a></span></li>
        <li class="four" id="logo_008"><a href="<%=path %>/ltmana.action"><img src="images/logo_008.png" width="240" height="120" alt=""></a><span><a href="#">家长论坛</a></span></li>
      <li class="one" id="logo_009"><a href="<%=path %>/xwmana2.action"><img src="images/logo_004d.png" width="240" height="120" alt="3399小游戏"></a><span><a href="#">班级通知</a></span></li>
      <%}else{ %>
      <li class="one" id="logo_001"><a href="<%=path %>/stumana2.action"><img src="images/logo_001.png" width="240" height="120" alt="google"></a><span><a href="#">信息管理</a></span></li>
    <li id="logo_002"><a href="<%=path %>/cjmana2.action"><img src="images/logo_baidu.png" width="240" height="120" alt=""></a><span><a href="#">成绩管理</a></span></li>
     <li id="logo_003"><a href="<%=path %>/zymana2.action"><img src="images/logo_003.png" width="240" height="120" alt=""></a><span><a href="#">作业管理</a></span></li>
      <li class="one" id="logo_005"><a href="<%=path %>/qjmana2.action"><img src="images/logo_005.png" width="240" height="120" alt=""></a><span><a href="#">考勤管理</a></span></li>
      <li id="logo_006"><a href="#"><img src="images/logo_006.png" width="239" height="120" alt=""></a><span><a href="#">文章分析</a></span></li>
       <li id="logo_007"><a href="<%=path %>/zpmana2.action"><img src="images/logo_007.png" width="240" height="120" alt=""></a><span><a href="#">风采展示</a></span></li>
        <li class="four" id="logo_008"><a href="<%=path %>/ltmana.action"><img src="images/logo_008.png" width="240" height="120" alt=""></a><span><a href="#">家长论坛</a></span></li>
         <li class="one" id="logo_009"><a href="<%=path %>/xwmana2.action"><img src="images/logo_004d.png" width="240" height="120" alt="3399小游戏"></a><span><a href="#">班级通知</a></span></li>
           <li id="logo_010"><a href="<%=path %>/tsmana2.action"><img src="images/logo_009.png" width="240" height="120" alt=""></a><span><a href="#">悄悄话</a></span></li>
      <%} %>
        
        
       
       
       
       
       
      
      </ul>
    </dd>
  
   
  </dl>
  
 
</div>
<!--logo区结束--> 
<!--左右箭头开始-->
<div class="prev"><img src="images/arr_left.png" width="31" height="67"></div>
<div class="next"><img src="images/arr_right.png" width="31" height="67"></div>
<!--左右箭头结束-->
<!-- Baidu Button END -->
<span style="display:none;">
<script src="<%=path %>/script/tj.js"></script>
</span>

</body>
</html>
