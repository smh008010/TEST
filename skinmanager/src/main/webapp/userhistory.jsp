<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品使用情况列表</title>
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
               <!-- Start responsive Table-->
                <div class="col-md-12">
                 <div class="white-box">
                    <h2 class="header-title">产品使用情况信息</h2>
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
</div>
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
		url:'${pageContext.request.contextPath}/customer/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			//回调函数
			//给下拉列表赋值
			if(data != null){
				 $("#customerid").html("<option value=''>--请选择--");
				//var optionhtml = '';//定义一个字符串变量
				for(var i=0;i<data.length;i++){
					//optionhtml +='<option value="'+data[i].customerid+'">'+data[i].customername+'</option>';
					$("#customerid").append(
					$("<option value='"+data[i].customerid+"'>"+ data[i].customername + "</option>")
					)
				}
				//给下拉列表赋值  text()、val()、html()、attr()等
				//$("#customerid").html(optionhtml);
			}

		}
		
    });
    $("#customerid").change(function(){
    	var customerid = $("#customerid").val();
    	$.ajax({
    	   type:'post',//提交方式
		   url:'${pageContext.request.contextPath}/buyhistory/querypro',
		   async:false,//  true：异步     false:同步
		   dataType: "json",//数据类型
    	   data:{"customerid":customerid},
    	   success:function(data){
    		alert(data.customerid);
    	       $("#productid").html("<option value=''>--请选择--");
    	       for(var i = 0;i<data.length;i++){
    		$("#productid").append(
    	         $("<option value='"+data[i].productid+"'>"+ data[i].productname+ "</option>"));
    	       }
    	   }

    	});
    });

    /*$.get("${pageContext.request.contextPath}/customer/queryall",function(res){
    	for (var i = 0; i < res.length; i++) {
			$("#customerid").append(
					$("<option value='"+res[i].customerid+"'>"+ res[i].customername + "</option>")
					);						
		}
    	$("customerid").change();

    },"json");

    $("#customerid").change(function(){
    	$.get("${pageContext.request.contextPath}/buyhistory/querypro","customerid="+$(this).val(),function(res){
    		$("#productid").empty(); // 清空原内容
    		for(var i=0; i<res.length; i++){
				$("#productid").append($("<option value='"+res[i].productid+"'>"+res[i].productname+"</option>"));
			}
    		$("#productid").change();
        }, "json");
    });*/
    /*$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/product/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			//回调函数
			//给下拉列表赋值
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].productid+'">'+data[i].productname+'</option>';
				}
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#productid").html(optionhtml);
			}		
		}
		
    });*/
    $.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/user/selectalluser',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			//回调函数
			//给下拉列表赋值
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].userid+'">'+data[i].username+'</option>';
				}
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#userid").html(optionhtml);
			}	
		}
		
    });
    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
        
        var customerid = $("#customerid").val();
    	var productid = $("#productid").val();
    	var usedate = $("#usedate").val(); 
    	var userid=$("#userid").val();
    	var state=$("#state").val()
    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/userhistory/insert", //请求路径
    	    data:{   	
    	    	"customerid":customerid,
    	        "productid":productid,
    	        "usedate":usedate,
    	        "userid":userid, 
    	        "state":state
    	    },
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    
    	    success:function(){
    	    	location.href="${pageContext.request.contextPath}/userhistory.jsp";
    	    	//$("#table").bootstrapTable("refresh");
    	    }
        });

    })	
  
});

</script>
<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/userhistory/queryall',
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
			field:'useproid',
			title:'编号'
		},{
			field:'customer.customername',
			title:'客户姓名'
		},{
			field:'customer.product.productname',
			title:'产品名',
		},{
			field:'customer.product.user.username',
			title:'员工名'
		},{
			field:'usedate',
			title:'使用时间',
		},{
			field:'state',
			title:'状态',
			formatter:function(value){
				if(value=='1'){result='已确认';color='red';}
				else if(value=='0'){result='未确认';color='green';}
				return '<div  style="color: ' + color + '">' +result+'</div>';
			}
		},{
			title:'操作',
			formatter:function(value,row,index){
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.useproid + ")\">确认</button>";
				return oper;
				  }
		}]
	})
})

function edit(useproid){
	//加载数据
	$.ajax({
		url: "${pageContext.request.contextPath}/userhistory/queryone",
		data:{useproid:useproid},
		dataType: "json",
		type: "post",
		success:function(data){
			$('#myUpdateModal').modal().on('shown.bs.modal', function () {
	        	$("#useproid1").val(data.useproid);
	        	$("#customerid1").val(data.customer.customername);
	        	$("#productid1").val(data.customer.product.productname);
	        	$("#userid1").val(data.customer.product.user.username);
	        	$("#state1").val(data.state);
	        	$("#usedate1").val(data.usedate)
    	   })
       }
})
	
}
function updateUserhistory(){
	var d={};
	var data=$("#updateform").serializeJSON();
	$.each(data,function(){
		d[this.name]=this.value;
	});
	//alert(JSON.stringify(d));
	 $.ajax({
	        url:"${pageContext.request.contextPath}/userhistory/update", 
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
                <h4 class="modal-title" id="myModalLabel">产品使用情况</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="useproid" id="useproid1">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">客户姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="customerid" class="form-control" id="customerid1" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="productid" id="productid1" disabled>
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">员工名:</label>
						    <div class="col-sm-10">
						      <input name="userid" type="text" id="userid1" class="form-control" disabled/> 
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">使用时间:</label>
						    <div class="col-sm-10">
						      <input name="usedate" type="text" id="usedate1" class="form-control" disabled/> 
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">是否确认:</label>
						    <div class="col-sm-10">
						     <select name="state" id="state1"> 
						        <option value="1">是</option>
						        <option value="0">否</option>
						      </select>
						    </div>
						  </div> 
						</form>
					</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateUserhistory()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button>
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
                <h4 class="modal-title" id="myModalLabel">产品使用情况信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">客户姓名:</label>
						    <div class="col-sm-10">
						     <select id="customerid" name="customerid">
						     <option value="">--请选择--</option>
						     </select>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						      <select id="productid" name="productid">
						      <option value="">--请选择--</option>
						      </select>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">员工名:</label>
						    <div class="col-sm-10">
						     <select id="userid" name="userid">
						       
						    </select> 
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">使用时间:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="usedate" id="usedate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label"></label>
						    <div class="col-sm-10">
						      <input type="hidden" class="form-control" id="state" name="state" value="0">
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