<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>岗位列表</title>
<%@ include file="common/commoncss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/mui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/sweetalert2.min.css"/>

<%@ include file="common/commonjs.jsp" %>



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
                    <h2 class="header-title">岗位信息</h2>        
       <!-- 打开添加窗口 -->
    <div id="toolbar">
	  <button  class="btn btn-primary btn-lg"  data-toggle="modal" data-target="#myAddModal">
	     Add
	  </button>
	</div>
               <!-- Start responsive Table-->
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
           
            poname: {
                message: 'The poname is not valid',
                validators: {
                    notEmpty: {
                        message: 'The poname is required and cannot be empty'
                    }
                }
            },
            
            posalary: {
                validators: {
                    notEmpty: {
                        message: 'The posalary is required and cannot be empty'
                    }
                }
            }
          
        }
    
    });
    
    var bootstrapValidator = $('userLogin').data('bootstrapValidator');
    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
        
        var poname = $("#poname").val();
    	var posalary = $("#posalary").val();
    	var isDelete=$("#isDelete").val();

    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/position/insertpo", //请求路径
    	    data:{   	
    	    	"poname":poname,
    	        "posalary":posalary,
    	        "isDelete":isDelete
    	  
    	    },
    	 
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    success:function(){
    	    	swal({
        			text:"添加成功",
        		    type:"success",
        		    confirmButtonText:'确认',
        		    confirmButtonColor:'#4cd964',
        		
        		})
    	    	//location.href="${pageContext.request.contextPath}/user.jsp";
    	    	$("#table").bootstrapTable("refresh");
    	    }
        });
    })	
  
});

</script>      
<script type="text/javascript">
$(function(){

	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/position/queryallpo',
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
			field:'poid',
			title:'岗位编号'
		},{
			field:'poname',
			title:'岗位名'
		},{
			field:'posalary',
			title:'岗位工资',
		},{
			field:'isDelete',
			title:'是否删除',
			formatter:function(value){
				if(value=='1'){result='是';color='red';}
				else if(value=='0'){result='否';color='green';}
				return '<div  style="color: ' + color + '">' +result+'</div>';
			}

		},{
			field:'-',
			title:'操作',width:400,formatter: function(value,row,index){
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.poid + ")\">修改</button>";
				oper += "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"del(" + row.poid + ")\">删除</button>";
				oper += "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"authority(" + row.poid + ")\">分配权限</button>";
				return oper;
			}
		}]
	})
})
	//删除
	function del(poid){ 
	swal({
		text:"确认要删除吗！",
	    type:"warning",
	    confirmButtonText:'确认',
	    confirmButtonColor:'#4cd964',
	
	})
		$.ajax({
			url: "${pageContext.request.contextPath}/position/selectbypoid",
			data:{poid:poid},
			dataType: "json",  
			type: "post",
			success:function(data){
				//alert(poid);
				
				$('#myDeleteModal').modal().on('shown.bs.modal', function () {
		        	//$save_form.bootstrapTable('resetView');
		        	$("#poid1").val(data.poid);
		        	$("#poname1").val(data.poname);
					$("#posalary1").val(data.posalary);
					$("#isDelete1").val(data.isDelete);
	    	})
				
			}
		})
	}

function deletepo(){
	//var d={};
	var data=$("#deleteform").serializeArray();
	/*$.each(data,function(){
	d[this.name]=this.value;
    });
    alert(JSON.stringify(d));*/
	 $.ajax({
	        url:"${pageContext.request.contextPath}/position/updateposition", 
	        data:data,
	        type:"POST",
	        dataType:"json",
	        success: function(data){  ///处理页面成功后输出
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
					//alert("修改失败");
				}
	                                                             
	        }
	    })
}
	
        //修改
		function edit(poid){
			//加载数据
			$.ajax({
				url: "${pageContext.request.contextPath}/position/selectbypoid",
				data:{poid:poid},
				dataType: "json",
				type: "post",
				success:function(data){
					$('#myUpdateModal').modal().on('shown.bs.modal', function () {
			        	//$save_form.bootstrapTable('resetView');
			        	$("#poid2").val(data.poid);
			        	$("#poname2").val(data.poname);
						$("#posalary2").val(data.posalary);

		    	})
		}
	})
  }

        function update(){
        	var data=$("#updateform").serializeArray();
        	 $.ajax({
			        url:"${pageContext.request.contextPath}/position/updateposition", 
			        data:data,
			        type:"POST",
			        dataType:"json",
			        success: function(data){  ///处理页面成功后输出
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
        
        //分配权限
		function authority(poid){
			$('#myAuthorityModal').modal().on('shown.bs.modal', function (){
				 $("#myAuthorityRole").val(poid);
				var zTreeObj;
				   
				   // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
				   var setting = {
						   check: {
								enable: true//复选框
							},
							view: {
								showLine: false
							},
							async: {
								enable: true,
								url: "${pageContext.request.contextPath}/sendAuthority?poid="+poid  //访问json数据
							}
				   };
				   
				   $(document).ready(function(){
					      zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, null);
					   });
			})
		}
	
</script>
    
	<!--修改模态框  -->
	<div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">岗位信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                  <input type="hidden" name="poid" id="poid2">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">岗位名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="poname" class="form-control" id="poname2" placeholder="请输入岗位名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">岗位工资:</label>
						    <div class="col-sm-10">
						      <input type="text" name="posalary" class="form-control" id="posalary2" placeholder="请输入岗位工资">
						    </div>
						  </div>
                  </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="update()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- 删除模态框 -->
<div class="modal fade" id="myDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">岗位信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="deleteform">
                  <input type="hidden" name="poid" id="poid1">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">岗位名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="poname" class="form-control" id="poname1" placeholder="请输入岗位名" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">岗位工资:</label>
						    <div class="col-sm-10">
						      <input type="text" name="posalary" class="form-control" id="posalary1" placeholder="请输入岗位工资" disabled>
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
                <button onclick="deletepo()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 添加模态框 -->
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">岗位信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
                   <!-- <input type="hidden" name="userid" id="userid"> -->
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">岗位名称:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="poname" class="form-control" id="poname" placeholder="请输入姓名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">工资:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="posalary" id="posalary" placeholder="请输入工资">
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
						      <input type="hidden" class="form-control" id="isDelete" name="isDelete2" placeholder="请输入描述" value="0">
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

<!-- 分配权限模态框（Modal） -->
<div class="modal fade" id="myAuthorityModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">分配权限</h4>
            </div>
            <div class="modal-body">
                  <form id="myAuthorityForm" class="form-horizontal">
                  <input type="hidden" id="myAuthorityRole" name="myRoleId">
                         <ul id="treeDemo" class="ztree"></ul>
                  </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="btnSaveAthority"  type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">

//用于获取选中的菜单id集合
function zTreeOnCheck(){
	
	//获取树形结构对象
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	
	//获取选中的菜单
	var nodes = treeObj.getCheckedNodes(true);
	
	//菜单id集合对象
	var v = [];
	
	//循环
	for(var i=0;i<nodes.length;i++){
		//alert(nodes[i].tid)
		v.push(nodes[i].tid);//把数据添加到数组中
	}
	return v;
}

 $(function(){
	 $("#btnSaveAthority").click(function(){
		
		 //岗位id
		  var poid = $("#myAuthorityRole").val();
		 
		 //获取选中的菜单id集合
		 var menuIds =  zTreeOnCheck();
		  
		$.ajax({
			  type:"post",//提交方式为post
			  url:"${pageContext.request.contextPath}/saveAuthority?menuIds="+menuIds,//访问后台的地址
			  data:{poid:poid},//传递到后台的数据
			  dataType:"json",
			  success:function(data){
				  if(data>0){
					  //分配权限成功
					  
					  //提示分配失败的
					  swal({
							title: '温馨提示',
							text: "分配权限成功",
							confirmButtonText: '确认',
							confirmButtonColor: 'Green',
						})
					  
					  //关闭窗体
					  $('#myAuthorityModal').modal("hide");
				  }else{
					  //提示分配失败的
					  swal({
							title: '错误提示',
							text: "分配权限失败",
							confirmButtonText: '确认',
							confirmButtonColor: 'Green',
						})
					//alert("修改失败");	
				  }
			  }
		 })
	 })
 })
</script>
</body>
</html>