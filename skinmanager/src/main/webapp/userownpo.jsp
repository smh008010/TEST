<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>

<%@ include file="common/commoncss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/mui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/sweetalert2.min.css"/>
<%@ include file="common/commonjs.jsp" %>
<script src="${pageContext.request.contextPath}/plugin/js/jquery.serializejson.min.js"></script>  
</head>
<body>
 <div class="wrapper">
              
          <!--Start Page Title-->
           <div class="page-title-box">
                <h4 class="page-title">Table</h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">Dashboard</a>
                    </li>
                    <li>
                        <a href="#">Table</a>
                    </li>
                    <li class="active">
                        Responsive Table
                    </li>
                </ol>
                <div class="clearfix"></div>
             </div>
              <!--End Page Title-->  
                <div class="col-md-12">
                 <div class="white-box">
                    <h2 class="header-title">个人信息</h2> 

                         
                     <form class="form-horizontal" id="updateform">
                      <input type="hidden" name="userid" id="userid" value="${user.userid}">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="username" class="form-control" id="username" value="${user.username}" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">岗位名称:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="poid" id="poid" value="${position.poname}" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
                              <input type="hidden" class="form-control" name="garde" id="garde" value="${user.garde}" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
                              <input type="hidden" class="form-control" name="posalary" id="posalary" value="${position.posalary}" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">工资:</label>
						    <div class="col-sm-10">
                              <input  id="sum" value="点击查看" type="text">
						    </div>
						  </div>
					       
                     </form> 
 
                
					</div>
        </div>
    </div>
<script type="text/javascript">

$(function (){
		$("input").blur(function (){
			var sum = parseInt($("#posalary").val()) + 10*parseInt($("#garde").val());
			$("#sum").val(sum);
		})
	})


</script>


</body>
</html>