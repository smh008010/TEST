<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药品列表</title>
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
                    <h2 class="header-title">药品信息</h2>
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
    
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/supplier/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			//回调函数
			//给下拉列表赋值
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].supplierid+'">'+data[i].name+'</option>';
				}
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#supplierid").html(optionhtml);
			}
			
			
		}
		
});
	
	
    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
    	var drugname = $("#drugname").val(); 
    	var number=$("#number").val();
    	var supplierid=$("#supplierid").val();
    	var isDelete=$("#isDelete").val();
    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/drug/insert", //请求路径
    	    data:{   	
    	    	"drugname":drugname,
    	        "number":number,
    	        "supplierid":supplierid,
    	        "isDelete":isDelete
    	    },
    	 
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    success:function(){
    	    	location.href="${pageContext.request.contextPath}/drug.jsp";
    	    	//$("#table").bootstrapTable("refresh");
    	    }
        });

    })	
  
});

</script>                  
  
<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/drug/queryall',
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
			field:'drugid',
			title:'药品编号'
		},{
			field:'drugname',
			title:'药品名'
		},{
			field:'number',
			title:'药品数量'
		},{
			field:'supplier.name',
			title:'供应商'
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
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.drugid + ")\">修改</button>";
				oper += "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"del(" + row.drugid + ")\">删除</button>";
				return oper;
				  }
		}]
	})
	
	//下拉列表动态读取数据
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/supplier/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].supplierid+'">'+data[i].name+'</option>';
				}
				//alert(optionhtml);
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#myUpdatePosition").html(optionhtml);
			}
			
			
		}
		
   })
})
//修改
function edit(drugid){
    //加载数据
	$.ajax({
		url: "${pageContext.request.contextPath}/drug/querybyid",
		data:{drugid:drugid},
		dataType: "json",
		type: "post",
		success:function(data){
			$('#myUpdateModal').modal().on('shown.bs.modal', function () {
	        	$("#drugid2").val(data.drugid);
	        	$("#drugname2").val(data.drugname);
	        	$("#number2").val(data.number);
	        	//给下拉列表赋初始值
		    	$("#myUpdatePosition").val(data.supplierid);
				
    	})
}
})
}
//修改
function updateDrug(){
	var d={};
	var data=$("#updateform").serializeJSON();
	$.each(data,function(){
		d[this.name]=this.value;
	});
	//alert(JSON.stringify(d));
	 $.ajax({
	        url:"${pageContext.request.contextPath}/drug/update", 
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

function del(drugid){
    //加载数据
	$.ajax({
		url: "${pageContext.request.contextPath}/drug/querybyid",
		data:{drugid:drugid},
		dataType: "json",
		type: "post",
		success:function(data){
			$('#myDeleteModal').modal().on('shown.bs.modal', function () {
	        	$("#drugid1").val(data.drugid);
	        	$("#drugname1").val(data.drugname);
	        	$("#number1").val(data.number);
	        	//给下拉列表赋初始值
		    	$("#supplierid1").val(data.supplierid);
	        	$("#isDelete1").val(data.isDelete)
				
    	})
}
})
}
//删除
function deleteDrug(){
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
	        url:"${pageContext.request.contextPath}/drug/update", 
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

<!-- 修改模态框 -->
 <div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">药品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="drugid" id="drugid2">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">药品名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="drugname" class="form-control" id="drugname2" placeholder="请输入姓名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">药品数量:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="number" id="number2" placeholder="请输入等级">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">供应商:</label>
						    <div class="col-sm-10">
						     <select id="myUpdatePosition" name="supplierid">
						       
						    </select> 
						    
						    </div>
						  </div>
						</form>
					</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateDrug()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button>
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
                <h4 class="modal-title" id="myModalLabel">药品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="deleteform">
                   <input type="hidden" name="drugid" id="drugid1">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">药品名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="drugname" class="form-control" id="drugname1" placeholder="请输入姓名" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">药品数量:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="number" id="number1" placeholder="请输入等级" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">供应商编号:</label>
						    <div class="col-sm-10">
						     <input type="text" class="form-control" name="supplierid" id="supplierid1" placeholder="请输入等级" disabled>
						    
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
                <button onclick="deleteDrug()" type="button" class="btn btn-primary"  data-dismiss="modal">删除</button>
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
                <h4 class="modal-title" id="myModalLabel">药品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
                   
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">药品名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="drugname" class="form-control" id="drugname" placeholder="请输入药品名">
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">数量:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="number" name="number" placeholder="请输入数量">
						    </div>   
						    </div>
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
						      <input type="hidden" class="form-control" id="isDelete" name="isDelete" placeholder="请输入状态" value="0">
						    </div>
						  </div> 					  
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">供应商名称:</label>
						    <div class="col-sm-10">
						     <select id="supplierid" name="supplierid">
						       
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
</body>
</html>