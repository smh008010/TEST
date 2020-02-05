<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="assets/images/favicon.png" type="image/png">
<title>登录</title>
<%@ include file="common/commoncss.jsp" %>
<%@ include file="common/commonjs.jsp" %>

	
</head>
<body  class="sticky-header">
 
 <!--Start login Section-->
  <section class="login-section">
       <div class="container">
           <div class="row">
               <div class="login-wrapper">
                   <div class="login-inner">
                       
                       <div class="logo">
                         <img src="assets/images/logo-dark.png"  alt="logo"/>
                       </div>
                   		
                   		<h2 class="header-title text-center">登录</h2>
    
    <form method="post" action="${pageContext.request.contextPath}/login">
		<input name="action" value="login" type="hidden">
		<div class="form-group">
		<input name="username" placeholder="用户名" required="" type="text" class="form-control">
		<hr class="hr15">
		</div>
		<div class="form-group">
		<input name="userpwd" placeholder="密码" required="" type="password" class="form-control">
		<hr class="hr15">
		</div>
		<div class="form-group">
		<img id="imgObj" alt="" src="${pageContext.request.contextPath}/kaptcha.do" title="看不清，点击刷新">
		<hr class="hr15">
		<input name="code" placeholder="验证码" required="" type="text">
		<hr class="hr15">
		</div>
		 
		<div class="form-group">
		<input value="登录" style="width:100%;" type="submit" class="btn btn-primary btn-block">
		<hr class="hr20">
        </div>
        
       
	</form>
	</div>
   </div>
</div>
</div>
</section>
<script type="text/javascript">
   $(function(){//jquery加载事件  text()、attr()、val()、html()
	   $("#imgObj").click(function(){
		   $(this).attr("src","${pageContext.request.contextPath}/kaptcha.do");
	   })
	   
   })
</script>
<script>
$(function(){
	// 默认显示
	$(".dropdown-toggle").dropdown('toggle');
}); 
</script>

</body>
</html>