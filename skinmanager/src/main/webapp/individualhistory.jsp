<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>散客记录列表</title>
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
                    <h2 class="header-title">散客记录</h2>
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
            tel:{
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
    
    function isTel(tel){
    	let reg=/^1[3456789]\d{9}$/;
    	if(reg.test(tel)==false){
    		return false
    	}else{
    		return true
    	}
    }
	$.ajax({
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
		
});
	
    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
    	var name=$("#name").val();
    	var productid=$("#productid").val();
    	var tel=$("#tel").val();
    	var usedate=$("#usedate").val();
    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/individualhistory/insert", //请求路径
    	    data:{   	
    	        "name":name,
    	        "productid":productid,
    	        "tel":tel,
    	        "usedate":usedate
    	  
    	    },
    	 
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    success:function(){
    	    	location.href="${pageContext.request.contextPath}/individualhistory.jsp";
    	    	//$("#table").bootstrapTable("refresh");
    	    }
        });

    })	
  
});

</script> 
<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/individualhistory/queryall',
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
			field:'id',
			title:'编号'
		},{
			field:'name',
			title:'客户名'
		},{
			field:'tel',
			title:'电话'
		},{
			field:'product.productname',
			title:'产品名'
		},{
			field:'usedate',
			title:'使用时间'
		}]
	})
})

</script>

<!-- 添加模态框 -->
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">散客记录</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">客户姓名:</label>
						    <div class="col-sm-10">
						     <input type="text" class="form-control" id="name" name="name" placeholder="请输入客户姓名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入电话"> 
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品名</label>
						    <div class="col-sm-10">
						      <select id="productid" name="productid">
						      </select>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">使用时间:</label>
						    <div class="col-sm-10">
						      <input type="date" class="form-control" id="usedate" name="usedate" >
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