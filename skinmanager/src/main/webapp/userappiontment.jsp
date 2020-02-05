<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当天预约</title>
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
             </div>
              <!--End Page Title-->          
               <!-- Start responsive Table-->
                <div class="col-md-12">
                 <div class="white-box">
                    <h2 class="header-title">个人当天客户预约</h2>
        
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
		url:'${pageContext.request.contextPath}/user/queryapp',
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
			field:'user.customer.customername',
			title:'客户姓名'
		},{
			field:'user.customer.product.productname',
			title:'产品名',
		},{
			field:'date',
			title:'预约时间',
		},{
			field:'state',
			title:'状态',
			formatter:function(value){
				if(value=='1'){result='已完成';color='red';}
				else if(value=='0'){result='未完成';color='green';}
				else if(value=='2'){result='取消';color='grey';}
				return '<div  style="color: ' + color + '">' +result+'</div>';
			}
		},{
			title:'操作',
			formatter:function(value,row,index){
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.appid + ")\">完成</button>";
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
		url:"${pageContext.request.contextPath}/appiontment/complete", 
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
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
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