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
			field:'garde',
			title:'等级'
		},{
			field:'position.poname',
			title:'职位'
		},{
			field:'position.posalary',
			title:'工资',
			formatter:function(value,row,index){
				var result=row.position.posalary+row.garde*10;
				return result;
			}
		},{
			field:'isDelete',
			title:'是否删除',
			formatter:function(value){
				if(value=='1'){result='是';color='red';}
				else if(value=='0'){result='否';color='green';}
				return '<div  style="color: ' + color + '">' +result+'</div>';
			}
		},{
			title:'操作',
			formatter:function(value,row,index){
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.userid + ")\">修改</button>";
				return oper;
				  }
		}]
	})
	
	//下拉列表动态读取数据
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/position/queryallpo',//访问后台的地址   查询所有的岗位信息
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			//alert(data[0].poname);
			//回调函数
			//给下拉列表赋值  <select id="myUpdatePosition">   <option="管理员">管理员</option>
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				//alert(data.length);
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].poid+'">'+data[i].poname+'</option>';
				}
				//alert(optionhtml);
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#myUpdatePosition").html(optionhtml);
			}
			
			
		}
		
   })
})
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
	        	$("#userid").val(data.userid);
	        	$("#username").val(data.username);
	        	$("#garde").val(data.garde);
	        	//给下拉列表赋初始值
		    	$("#myUpdatePosition").val(data.poid);
				
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
	alert(JSON.stringify(d));
	 $.ajax({
	        url:"${pageContext.request.contextPath}/user/updateuser", 
	        data:data,
	        type:"POST",
	        dataType: "json",
	        success: function(data){  ///处理页面成功后输出
	        	//alert(data.userid);
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
</script>

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
                   <input type="hidden" name="userid" id="userid">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="username" class="form-control" id="username" placeholder="请输入姓名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">等级:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="garde" id="garde" placeholder="请输入等级">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">岗位名称:</label>
						    <div class="col-sm-10">
						     <select id="myUpdatePosition" name="poid">
						       
						    </select> 
						    
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
</body>
</html>