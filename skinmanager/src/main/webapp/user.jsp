<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作人员列表</title>
<%@ include file="common/commoncss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/mui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/sweetalert2.min.css"/>
<%@ include file="common/commonjs.jsp" %>
<script src="${pageContext.request.contextPath}/plugin/js/jquery.serializejson.min.js"></script>   
</head>
<body >
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
               <!-- Start responsive Table-->
                <div class="col-md-12">
                 <div class="white-box">
                    <h2 class="header-title">工作人员信息</h2>
                            <!-- 打开添加窗口 -->
    <div id="toolbar">
	  <button  class="btn btn-primary btn-lg"  data-toggle="modal" data-target="#myAddModal">
	   Add
	  </button>
	</div>
                     <div class="table-responsive">
                         <table class="table table-bordered" id="table">
                         </table>
                     </div>
                 </div>
                 </div>
               <!-- End responsive Table-->               
               
			    </div>
        <!-- End Wrapper-->
   
      <!--End main content -->
                   
<!-- 添加 -->
<script type="text/javascript">

$(document).ready(function() {
	
	   
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#addform').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
           
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 3,
                        max: 10,
                        message: 'The username must be more than 3 and less than 10 characters long'
                    },
                    different: {
                        field: 'userpwd',
                        message: 'The username and password cannot be the same as each other'
                    }
                }
            },
            
            userpwd: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    identical: {
                        field: 'reuserpwd',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    }
                }
            },
            reuserpwd: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and cannot be empty'
                    },
                    identical: {
                        field: 'userpwd',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    }
                }
            },
            usertel:{
            	validators: {
                    notEmpty: {
                        message: 'The confirm lxrdh is required and cannot be empty'
                    },
                    
                    callback: {
                        message: '电话格式错误',
                        callback: function (value, validator) {
                            if (!value) {
                                return true
                            } else if (isTel(value)) {
                                return true;
                            } else {
                                return false;
                            }
                        }
	
           	        }
                }
            }
          
        }
        
    
    });
    
    var bootstrapValidator = $('userLogin').data('bootstrapValidator');
    
    function isTel(usertel){
    	let reg=/^1[3456789]\d{9}$/;
    	if(reg.test(usertel)==false){
    		return false
    	}else{
    		return true
    	}
    }
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/position/queryallpo',//访问后台的地址   查询所有的岗位信息
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			//回调函数
			//给下拉列表赋值
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].poid+'">'+data[i].poname+'</option>';
				}
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#poid").html(optionhtml);
			}
			
			
		}
		
});
	
	
    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
    	var userpwd = $("#userpwd").val();
    	var username = $("#username").val(); 
    	var usertel=$("#usertel").val();
    	var poid=$("#poid").val();
    	var isDelete=$("#isDelete").val();
    	var garde = $("#garde").val(); 
    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/user/adduser", //请求路径
    	    data:{   	
    	    	"username":username,
    	        "userpwd":userpwd,
    	        "usertel":usertel,
    	        "poid":poid,
    	        "isDelete":isDelete,
    	        "garde":garde
    	  
    	    },
    	 
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    success:function(){
    	    	location.href="${pageContext.request.contextPath}/user.jsp";
    	    	//$("#table").bootstrapTable("refresh");
    	    }
        });

    })	
  
});

</script> 
<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/user/selectalluser',
		pagination: true,//允许分页
		search: true,//可以搜索
		pageSize:3,//每页显示3条数据
		pageList:[2,3,4,5,8,10],//每页显示的条数列表
		showColumns:true,//选择显示的列
		showRefresh:true,//允许刷新
		showExport:true,//允许导出
		exportDataType:'all',
		exportTypes:['txt','doc','excel'],
		columns:[{
			field:'userid',
			title:'编号'
		},{
			field:'username',
			title:'姓名'
		},{
			field:'userphoto',
			title:'照片',
			formatter:function(value,row,index){
			    	//value:值   row：行      index:索引
				var imageUrl="<img onclick=\"myPhotoClick('/imageurl/"+row.userphoto+"')\" alt=\"\" src=\"/imageurl/"+row.userphoto+"\" width=\"50\" height=\"50\">";
				return imageUrl;
			}
		},{
			field:'usertel',
			title:'电话'
		},{
			field:'position.poname',
			title:'职位'
		},{
			field:'isDelete',
			title:'状态',
			formatter:function(value){
				if(value=='1'){result='是';color='red';}
				else if(value=='0'){result='否';color='green';}
				return '<div  style="color: ' + color + '">' +result+'</div>';
			}
		},{
			title:'操作',
			formatter:function(value,row,index){
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.userid + ")\">修改</button>";
				oper += "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"del(" + row.userid + ")\">删除</button>";
				return oper;
				  }
		}]
	})
})


/**
 * 头像放大效果
 */
function myPhotoClick(photoValue){
		
	    $('#myModal').modal().on('shown.bs.modal',
	    function() {
	         $("#myDialogImage").attr("src",photoValue);
	    })
}

//修改
function edit(userid){
    //加载数据
	$.ajax({
		url: "${pageContext.request.contextPath}/user/selectbyid",
		data:{userid:userid},
		dataType: "json",
		type: "post",
		success:function(data){
			$('#myUpdateModal').modal().on('shown.bs.modal', function () {
	        	$("#userid2").val(data.userid);
	        	$("#username2").val(data.username);
	        	$("#usertel2").val(data.usertel);
				//给隐藏框赋值（以便于传值到后台）
				$("#userphoto").val(data.userphoto);
				 
		    	 //给图片控件赋值
		    	 $("#myUpdateImage").attr("src","/imageurl/"+data.userphoto);
		    	 
				
    	   })
       }
})
}
//修改
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
					$("#table").bootstrapTable("refresh");
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

/**
 * 根据id查出删除的信息
 */
function del(userid){
	$.ajax({
		url: "${pageContext.request.contextPath}/user/selectbyid",
		data:{userid:userid},
		dataType: "json",
		type: "post",
		success:function(data){
			//alert(userid);
			$('#myDeleteModal').modal().on('shown.bs.modal', function () {
	        	$("#userid1").val(data.userid);
	        	$("#username1").val(data.username);
				$("#usertel1").val(data.usertel);
				$("#isDelete1").val(data.isDelete);
				
    	})
     }
   })
}
//删除
function deleteUser(){
	swal({
		text:"确认要删除吗！",
	    type:"warning",
	    confirmButtonText:'确认',
	    confirmButtonColor:'#4cd964',
	
	})
	//var d={};
	var data=$("#deleteform").serializeArray();
	/*$.each(data,function(){
		d[this.name]=this.value;
	});
	alert(JSON.stringify(d));*/
	 $.ajax({
	        url:"${pageContext.request.contextPath}/user/updateuser", 
	        data:data,
	        type:"POST",
	        dataType: "json",
	        success: function(data){  ///处理页面成功后输出
	        	//alert(data.userid);
	        	if(data == 1){
	        		swal({
	        			text:"删除成功",
	        		    type:"success",
	        		    confirmButtonText:'确认',
	        		    confirmButtonColor:'#4cd964',
	        		
	        		})
					$("#table").bootstrapTable("refresh");
				}else{
					swal({
	        			text:"删除失败",
	        		    type:"error",
	        		    confirmButtonText:'确认',
	        		    confirmButtonColor:'#f27474',
	        		
	        		})
					
				}
	                                                             
	        }
	    })
}



</script>
<!-- 头像模态框 -->
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">我的头像</h4>
            </div>
            <div class="modal-body">
                <img id="myDialogImage" alt="" src="" width="300" height="300">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               
            </div>
        </div>
    </div>
</div>

<!-- 修改模态框 -->
 <div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">工作人员信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="userid" id="userid2">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="username" class="form-control" id="username2" placeholder="请输入姓名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="usertel" id="usertel2" placeholder="请输入电话:">
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">头像:</label>
						    <div class="col-sm-10">
						      <input name="userphoto" type="hidden" id="userphoto" value="" /> 
						      <img id="myUpdateImage" alt="" src="" width="100" height="100">
						      <input type="button" id="myPhotoButton" value="选择头像" />选择头像
						      
						    </div>
						  </div>
						</form>
					</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateUser()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button>
            </div>
        </div>
    </div>
 </div>
 <!-- 删除模态框 -->
 <div class="modal fade" id="myDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">工作人员信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="deleteform">
                   <input type="hidden" name="userid" id="userid1">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="username" class="form-control" id="username1" placeholder="请输入姓名" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="usertel" id="usertel1" placeholder="请输入电话:" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">是否删除:</label>
						    <div class="col-sm-10">
						     <select name="isDelete" id="isDelete1"> 
						        <option value="1">是</option>
						        <option value="0">否</option>
						      </select>
						    </div>
						  </div> 
			    </form>
	</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="deleteUser()" type="button" class="btn btn-primary"  data-dismiss="modal">删除</button>
            </div>
        </div>
   </div>
 </div>
<!-- 添加模态框 -->
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">工作人员信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
                   <!-- <input type="hidden" name="userid" id="userid"> -->
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="username" class="form-control" id="username" placeholder="请输入姓名">
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="userpwd" name="userpwd" placeholder="请输入密码">
						    </div>   
						    </div>
						    <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">确认密码:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="reuserpwd" name="reuserpwd" placeholder="请输入确认密码">
						    </div>
						  </div> 
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
						      <input type="hidden" class="form-control" id="isDelete" name="isDelete" placeholder="请输入状态" value="0">
						    </div>
						  </div> 
						  
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						   <input type="text" class="form-control" id="usertel" name="usertel" placeholder="请输入电话"> 
						    </div> 
						  </div> 
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
						   <input type="hidden" class="form-control" id="garde" name="garde" placeholder="请输入等级" value="0"> 
						    </div> 
						  </div> 
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">岗位名称:</label>
						    <div class="col-sm-10">
						     <select id="poid" name="poid">
						       
						    </select> 
						    </div>
						  </div>
						</form>
				</div>                
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button  type="button" class="btn btn-primary" id="submitbtn" data-dismiss="modal">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
 <script type="text/javascript">
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
							var startUrl='d://photo/';
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