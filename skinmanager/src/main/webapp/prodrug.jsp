<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品药品列表</title>
<%@ include file="common/commoncss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/mui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/sweetalert2.min.css"/>
<%@ include file="common/commonjs.jsp" %>
<script src="${pageContext.request.contextPath}/plugin/js/jquery.serializejson.min.js"></script>   
</head>
<body>
<div class="wrapper">
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
                    <h2 class="header-title">产品药品信息</h2>
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
    
	//下拉列表动态读取数据
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/product/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].productid+'">'+data[i].productname+'</option>';
				}
				//alert(optionhtml);
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#proid").html(optionhtml);
			}
			
			
		}
		
    });
	
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/drug/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].drugid+'">'+data[i].drugname+'</option>';
				}
				//alert(optionhtml);
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#drugid").html(optionhtml);
			}
			
			
		}
		
   })
	
	
    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
    	var proid=$("#proid").val();
    	var drugid=$("#drugid").val();
    	var number=$("#number").val();
    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/prodrug/insert", //请求路径
    	    data:{   	
    	        "proid":proid,
    	        "drugid":drugid,
    	        "number":number
    	    },
    	 
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    success:function(){
    	    	location.href="${pageContext.request.contextPath}/prodrug.jsp";
    	    	//$("#table").bootstrapTable("refresh");
    	    }
        });

    })	
  
});

</script>   
<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/prodrug/queryall',
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
			field:'prodrugid',
			title:'编号'
		},{
			field:'product.productname',
			title:'产品名'
		},{
			field:'product.drug.drugname',
			title:'药品名'
		},{
			field:'number',
			title:'每次使用药品数量'
		},{
			title:'操作',
			formatter:function(value,row,index){
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.prodrugid + ")\">修改</button>";
				oper += "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"del(" + row.prodrugid + ")\">删除</button>";
				return oper;
			}
		}]
	})
	
	//下拉列表动态读取数据
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/product/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].productid+'">'+data[i].productname+'</option>';
				}
				//alert(optionhtml);
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#proid2").html(optionhtml);
			}
			
			
		}
		
    });
	
	$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/drug/queryall',
		async:false,//  true：异步     false:同步
		dataType: "json",//数据类型
		success: function(data){
			if(data != null){
				var optionhtml = '';//定义一个字符串变量
				
				for(var i=0;i<data.length;i++){
					optionhtml +='<option value="'+data[i].drugid+'">'+data[i].drugname+'</option>';
				}
				//alert(optionhtml);
				//给下拉列表赋值  text()、val()、html()、attr()等
				$("#drugid2").html(optionhtml);
			}
			
			
		}
		
   })
})
//修改
function edit(prodrugid){
    //加载数据
	$.ajax({
		url: "${pageContext.request.contextPath}/prodrug/queryone",
		data:{prodrugid:prodrugid},
		dataType: "json",
		type: "post",
		success:function(data){
			$('#myUpdateModal').modal().on('shown.bs.modal', function () {
	        	$("#prodrugid2").val(data.prodrugid);
	        	$("#proid2").val(data.proid);
	        	$("#drugid2").val(data.drugid);
		    	$("#number2").val(data.number);
				
    	})
}
})
}
//修改
function updateProdrug(){
	var d={};
	var data=$("#updateform").serializeJSON();
	$.each(data,function(){
		d[this.name]=this.value;
	});
	//alert(JSON.stringify(d));
	 $.ajax({
	        url:"${pageContext.request.contextPath}/prodrug/update", 
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
                <h4 class="modal-title" id="myModalLabel">产品药品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="prodrugid" id="prodrugid2">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						      <select id="proid2" name="proid">
						      </select>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">药品名:</label>
						    <div class="col-sm-10">
						     <select id="drugid2" name="drugid">						       
						    </select> 						    
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">每次使用药品数量:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="number" id="number2" placeholder="请输入每次使用药品数量">
						    </div>
						  </div>
						</form>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateProdrug()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button>
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
                <h4 class="modal-title" id="myModalLabel">产品药品信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						      <select id="proid" name="proid">
						      </select>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">药品名:</label>
						    <div class="col-sm-10">
						     <select id="drugid" name="drugid">						       
						    </select> 						    
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">每次使用药品数量:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="number" id="number" placeholder="请输入等级">
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