<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预约列表</title>
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
                    <h2 class="header-title">预约信息</h2>
                     <div class="table-responsive">
                         <table class="table table-bordered" id="table">
                         </table>
                     </div>
                 </div>
                </div>
</div>   

<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/appiontment/queryall',
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
			field:'appid',
			title:'编号'
		},{
			field:'user.customer.customername',
			title:'客户姓名'
		},{
			field:'user.username',
			title:'员工姓名'
		},{
			field:'date',
			title:'预约日期'
		},{
			field:'user.customer.product.productname',
			title:'产品名'
		},{
			field:'state',
			title:'预约状态',
			formatter:function(value){
				if(value=='1'){result='已完成';color='red';}
				else if(value=='0'){result='未完成';color='green';}
				else if(value=='2'){result='取消';color='green';}
				else if(value=='3'){result='已删除';color='grey';}
				return '<div  style="color: ' + color + '">' +result+'</div>';
			}
		},{
			title:'操作',
			formatter:function(value,row,index){
				var oper= "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"edit(" + row.appid + ")\">删除</button>";
				return oper;
				  }
		}]
	})
})


//修改
function edit(appid){
	$.ajax({
		url:"${pageContext.request.contextPath}/appiontment/selectbyid",
		data:{appid:appid},
		dataType:"json",
		type:"post",
		success:function(data){
			$('#myUpdateModal').modal().on('shown.bs.modal', function (){
				$("#appid").val(data.appid);
				$("#customername").val(data.user.customer.customername);
				$("#username").val(data.user.username);
				$("#productname").val(data.user.customer.product.productname);
				$("#date").val(data.date);
				$("#state").val(data.state)
			})
		}
	})
}

function updateCustomer(){
	var d={};
	var data=$("#updateform").serializeJSON();
	$.each(data,function(){
		d[this.name]=this.value;
	});
	//alert(JSON.stringify(d));
	$.ajax({
		url:"${pageContext.request.contextPath}/appiontment/delete", 
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
</script>
<!-- 修改模态框 -->
 <div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">客户信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="appid" id="appid">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">客户姓名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="customername" class="form-control" id="customername" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">产品名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="productname" id="productname" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">员工名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="username" id="username" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">预约日期:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="date" id="date" disabled>
						    </div>
						  </div>
						</form>
					</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateCustomer()" type="button" class="btn btn-primary"  data-dismiss="modal">完成</button>
            </div>
        </div>
    </div>
 </div>    
</body>
</html>