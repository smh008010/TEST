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
           <span class="signIn"></span>
             </div>
              <!--End Page Title-->  
                <div class="col-md-12">
                 <div class="white-box">
                    <h2 class="header-title">个人信息</h2>        
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="userid" id="userid" value="${user.userid }">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="username" class="form-control" id="username" value="${user.username }">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="usertel" id="usertel" value="${user.usertel }">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="userpwd" id="userpwd" value="${user.userpwd }">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">头像:</label>
						    <div class="col-sm-10">
						      <input name="userphoto" type="hidden" id="userphoto" value="${user.userphoto }" /> 
						      <img id="myUpdateImage" alt="" src="/imageurl/${user.userphoto}" width="100" height="100">
						      <input type="button" id="myPhotoButton" value="选择头像" />选择头像
						      
						    </div>
						  </div> 
						<div class="modal-footer">
                         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                         <button onclick="updateUser()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button> 
                       </div>
                     </form>
					</div>
        </div>
    </div>

<script type="text/javascript">
$(document).ready(function(){
	var signIn="/assets/images/users/signin.png";
	var noSignIn="/assets/images/users/nosignin.png";
	$.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/user/sign",
        dataType: "json",
        success: function(data) {
            if (data.result == "true") {
            	$(".signIn").append("<img src=\"" + "${pageContext.request.contextPath}"+ signIn + "\"/>");
            	$(".signIn").unbind("click");
            }else{
            	$(".signIn").append("<img src=\"" + "${pageContext.request.contextPath}"+ noSignIn + "\"/>");
            }
        },
        error: function(data) {
        	alert("对不起,找不到界面了");
        }
    });
	$(".signIn").click(function(){
		$.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/sign/toSignIn",
	        dataType: "json",
	        success: function(data) {
	        	if (data.result == "true") {
	        		$(".signIn").empty();
	            	$(".signIn").append("<img src=\"" + "${pageContext.request.contextPath}"+ signIn + "\"/>");
	            	$(".signIn").unbind("click");
	            }else{
	            	alert("对不起,签到失败");
	            }
	        },
	        error: function(data) {
	        	alert("对不起,找不到界面了");
	        }
	    });
	});
});
</script>  
<script type="text/javascript">

function updateUser(){
	var d={};
	var data=$("#updateform").serializeJSON();
	$.each(data,function(){
		d[this.name]=this.value;
	});
	 $.ajax({
	        url:"${pageContext.request.contextPath}/user/updateuser", 
	        data:data,
	        type:"POST",
	        dataType: "json",
	        success: function(data){  ///处理页面成功后输出
	        	//alert(data.userphoto);
	        	if(data == 1){

	        		swal({
	        			text:"修改成功",
	        		    type:"success",
	        		    confirmButtonText:'确认',
	        		    confirmButtonColor:'#4cd964',
	        		
	        		})
					$("#updateform").bootstrapTable("refresh");
				}else{
					swal({
	        			text:"修改失败",
	        		    type:"error",
	        		    confirmButtonText:'确认',
	        		    confirmButtonColor:'#f27474',
	        		
	        		})
				}
	                                                             
	        }
	    })
}

$(function(){
	 KindEditor.ready(function(K) {
			var editor = K.editor({
				allowFileManager : true
			});
			K('#myPhotoButton').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						imageUrl : K('#userphoto').val(),//取值
						clickFn : function(url, title, width, height, border, align) {
							var startUrl='d://photo';
							var newUrl = url.substr(startUrl.length);
							K('#userphoto').val(newUrl);
							//alert(newUrl);
							$("#myUpdateImage").attr("src","/imageurl/"+newUrl);
							editor.hideDialog();
						}
					});
				});
			});
		})
})

</script>
 
</body>
</html>