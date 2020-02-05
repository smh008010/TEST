<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="assets/images/favicon.png" type="image/png">

<title>Home</title>
<%@ include file="common/commoncss.jsp" %>
<%@ include file="common/commonjs.jsp" %>
<%@ include file="common/css.jsp" %>


     
</head>
<body >
   <div class="left-side sticky-left-side">

        <!--logo-->
        <div class="logo">
            <h5><a href="#" style="font-size: 20px;">美容机构管理系统</a></h5>
        </div>

        <div class="logo-icon text-center">
            
        </div>
        <!--logo-->
        <%@include file="leftmenu.jsp" %>
        <div class="left-side-inner">

	    </div>

</div>
   <!-- main content start-->
   <div class="main-content" >
        <!-- header section start-->
        <div class="header-section">
               
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            
            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">

                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img  alt="" src="/imageurl/${user.userphoto}" width="200" height="50"/>
                            ${user.username}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">

                          <li> <a href="login.jsp"> <i class="fa fa-lock"></i> Logout </a> </li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->

        </div>
        <!-- header section end-->
       <iframe name="menuFrame" id="menuFrame" width="100%" height="1000" scrolling="yes" frameborder="0" src="${pageContext.request.contextPath}/NewFile.jsp">
       
        <!--body wrapper start-->
       
             
         
					<!-- Start inbox widget-->
                 
                   <!--End row-->
			</iframe>
			    </div>
        <!-- End Wrapper-->

   <!--End main content -->
  
	<script type="text/javascript">
		//菜单点击事件
		$(function() {//加载事件
			
			 $(".custom-nav .active a").click(function(){
				 var mainUrl =  $(this).attr("dataurl");
				
				 if(mainUrl != null && mainUrl != ""){
					 $("#menuFrame").attr("src",mainUrl);
				 }
			 })
		});
	</script>
	
   

</body>
