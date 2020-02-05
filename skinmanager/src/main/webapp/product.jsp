<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品列表</title>
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
                    <h2 class="header-title">产品信息</h2>
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
        }
    });
    
    var bootstrapValidator = $('userLogin').data('bootstrapValidator');
    
    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
    	var productname=$("#productname").val();
    	var introduce=$("#introduce").val();
    	var isDelete=$("#isDelete").val();
    	var number=$("#number").val();
    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/product/insert", //请求路径
    	    data:{   	
    	        "productname":productname,
    	        "introduce":introduce,
    	        "isDelete":isDelete,
    	        "number":number
    	  
    	    },
    	 
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    success:function(){
    	    	location.href="${pageContext.request.contextPath}/product.jsp";
    	    	//$("#table").bootstrapTable("refresh");
    	    }
        });

    })	
  
});

</script> 
<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/product/queryall',
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
			field:'productid',
			title:'编号'
		},{
			field:'productname',
			title:'产品名'
		},{
			field:'introduce',
			title:'产品介绍'
		},{
			field:'number',
			title:'产品使用次数'
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
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.productid + ")\">修改</button>";
				oper += "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"del(" + row.productid + ")\">删除</button>";
				return oper;
				  }
		}]
	})
})

//修改
function edit(productid){
	$.ajax({
		url: "${pageContext.request.contextPath}/product/selectbyid",
		data:{productid:productid},
		dataType: "json",
		type: "post",
		success:function(data){
			$('#myUpdateModal').modal().on('shown.bs.modal', function () {
	        	$("#productid2").val(data.productid);
	        	$("#productname2").val(data.productname);
	        	$("#introduce2").val(data.introduce);
	        	$("#number2").val(data.number);
    	   })
       }
	})
}

function updateProduct(){
	var d={};
	var data=$("#updateform").serializeJSON();
	$.each(data,function(){
		d[this.name]=this.value;
	});
	//alert(JSON.stringify(d));
	 $.ajax({
	        url:"${pageContext.request.contextPath}/product/update", 
	        data:data,
	        type:"POST",
	        dataType: "json",
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

//删除
function del(productid){
	$.ajax({
		url: "${pageContext.request.contextPath}/product/selectbyid",
		data:{productid:productid},
		dataType: "json",
		type: "post",
		success:function(data){
			$('#myDeleteModal').modal().on('shown.bs.modal', function () {
	        	$("#productid1").val(data.productid);
	        	$("#productname1").val(data.productname);
	        	$("#introduce1").val(data.introduce);
	        	$("#number1").val(data.number);
	        	$("#isDelete1").val(data.isDelete);
    	   })
       }
	})
}

function deleteProduct(){
	var data=$("#deleteform").serializeArray();
	/*$.each(data,function(){
		d[this.name]=this.value;
	});
	alert(JSON.stringify(d));*/
	 $.ajax({
	        url:"${pageContext.request.contextPath}/product/update", 
	        data:data,
	        type:"POST",
	        dataType: "json",
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
					
				}
	                                                             
	        }
	    })
}
</script>

<!-- 添加模态框 -->
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">产品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="productname" class="form-control" id="productname" placeholder="请输入产品名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品介绍:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="introduce" class="form-control" id="introduce" placeholder="请输入产品介绍">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品使用次数:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="number" class="form-control" id="number" placeholder="请输入产品使用次数">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
						      <input type="hidden" class="form-control" id="isDelete" name="isDelete"  value="0">
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
<!-- 修改模态框 -->
 <div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">产品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="productid" id="productid2">
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="productname" class="form-control" id="productname2" placeholder="请输入产品名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品介绍:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="introduce" class="form-control" id="introduce2" placeholder="请输入产品介绍">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品使用次数:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="number" class="form-control" id="number2" placeholder="请输入产品使用次数">
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
                <h4 class="modal-title" id="myModalLabel">产品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="deleteform">
                  <input type="hidden" name="productid" id="productid1">
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="productname" class="form-control" id="productname1" placeholder="请输入产品名" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品介绍:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="introduce" class="form-control" id="introduce1" placeholder="请输入产品介绍" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品使用次数:</label>
						    <div class="col-sm-10">
						     <input type="text"  name="number" class="form-control" id="number1" placeholder="请输入产品使用次数" disabled>
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
                <button onclick=" deleteProduct()" type="button" class="btn btn-primary"  data-dismiss="modal">删除</button>
            </div>
        </div>
   </div>
 </div>

</body>
</html>