<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设备列表</title>
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
                    <h2 class="header-title">设备信息</h2>
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
	

    // Validate the form manually
    $('#submitbtn').click(function() {
        $('#addform').bootstrapValidator('validate');
    	var name = $("#name").val();
    	var begintime = $("#begintime").val(); 
    	var introduce=$("#introduce").val();
    	var suppliername=$("#suppliername").val();
    	var principal=$("#principal").val();
    	var tel = $("#tel").val(); 
    	var isDelete=$("#isDelete").val();
    	
        $.ajax({//通过ajax传给一个servlet处理
    	    type:"post", //请求方式
    	    url:"${pageContext.request.contextPath}/instrument/insert", //请求路径
    	    data:{   	
    	    	"name":name,
    	        "begintime":begintime,
    	        "introduce":introduce,
    	        "suppliername":suppliername,
    	        "principal":principal,
    	        "isDelete":isDelete,
    	        "tel":tel
    	  
    	    },
    	 
    	    traditional: true,//加上这个就可以传数组
    	    dataType : 'json', 
    	    success:function(){
    	    	location.href="${pageContext.request.contextPath}/instrument.jsp";
    	    	//$("#table").bootstrapTable("refresh");
    	    }
        });

    })	
  
});

</script> 
<script type="text/javascript">
$(function(){
	$('#table').bootstrapTable({
		url:'${pageContext.request.contextPath}/instrument/queryall',
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
			field:'instrutmentid',
			title:'编号'
		},{
			field:'name',
			title:'设备名'
		},{
			field:'begintime',
			title:'开始使用时间'
		},{
			field:'suppliername',
			title:'供应商'
		},{
			field:'principal',
			title:'负责人'
		},{
			field:'tel',
			title:'电话'
		},{
			field:'isDelete',
			title:'状态',
			formatter:function(value){
				if(value=='1'){result='已过期';color='red';}
				else if(value=='0'){result='正在使用';color='green';}
				return '<div  style="color: ' + color + '">' +result+'</div>';
			}
		},{
			title:'操作',
			formatter:function(value,row,index){
				var oper = "<button type=\"button\" class=\"btn btn-info\" onclick=\"edit(" + row.instrutmentid + ")\">修改</button>";
				oper += "&nbsp;<button type=\"button\" class=\"btn btn-danger\"  onclick=\"del(" + row.instrutmentid + ")\">删除</button>";
				return oper;
				  }
		}]
	})
})

//修改
function edit(instrutmentid){
	$.ajax({
		url:"${pageContext.request.contextPath}/instrument/querybyid",
		data:{instrutmentid:instrutmentid},
		dataType:"json",
		type:"post",
		success:function(data){
			$('#myUpdateModal').modal().on('shown.bs.modal', function (){
				$("#instrutmentid2").val(data.instrutmentid);
				$("#name2").val(data.name);
				$("#begintime2").val(data.begintime);
				$("#introduce2").val(data.introduce);
				$("#suppliername2").val(data.suppliername);
				$("#principal2").val(data.principal);
				$("#tel2").val(data.tel)
			})
		}
	})
}

function updateInstrument(){
	var d={};
	var data=$("#updateform").serializeJSON();
	$.each(data,function(){
		d[this.name]=this.value;
	});
	//alert(JSON.stringify(d));
	$.ajax({
		url:"${pageContext.request.contextPath}/instrument/update", 
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
function del(instrutmentid){
	$.ajax({
		url:"${pageContext.request.contextPath}/instrument/querybyid",
		data:{instrutmentid:instrutmentid},
		dataType:"json",
		type:"post",
		success:function(data){
			$('#myDeleteModal').modal().on('shown.bs.modal', function(){
				$("#instrutmentid1").val(data.instrutmentid);
				$("#name1").val(data.name);
				$("#begintime1").val(data.begintime);
				$("#introduce1").val(data.introduce);
				$("#suppliername1").val(data.suppliername);
				$("#principal1").val(data.principal);
				$("#tel1").val(data.tel);
				$("isDelete1").val(data.isDelete)
			})
		}
	})
	
}

function deleteInstrument(){
	var data=$("#deleteform").serializeArray();
	/*$.each(data,function(){
		d[this.name]=this.value;
	});
	alert(JSON.stringify(d));*/
	 $.ajax({
	        url:"${pageContext.request.contextPath}/instrument/update", 
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
<!-- 修改模态框 -->
 <div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">设备信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="updateform">
                   <input type="hidden" name="instrutmentid" id="instrutmentid2">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">设备名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="name" class="form-control" id="name2" placeholder="请输入设备名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">开始使用时间:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="begintime" class="form-control" id="begintime2" placeholder="请输入开始使用时间">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">介绍:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="introduce" class="form-control" id="introduce2" placeholder="请输入介绍">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">供应商:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="suppliername" class="form-control" id="suppliername2" placeholder="请输入供应商">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">负责人:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="principal" class="form-control" id="principal2" placeholder="请输入负责人">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="tel" id="tel2" placeholder="请输入电话:">
						    </div>
						  </div>
						</form>
					</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateInstrument()" type="button" class="btn btn-primary"  data-dismiss="modal">修改</button>
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
                <h4 class="modal-title" id="myModalLabel">设备信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="deleteform">
                   <input type="hidden" name="instrutmentid" id="instrutmentid1">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">设备名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="name" class="form-control" id="name1" placeholder="请输入设备名" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">开始使用时间:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="begintime" class="form-control" id="begintime1" placeholder="请输入开始使用时间" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">介绍:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="introduce" class="form-control" id="introduce1" placeholder="请输入介绍" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">供应商:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="suppliername" class="form-control" id="suppliername1" placeholder="请输入供应商" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">负责人:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="principal" class="form-control" id="principal1" placeholder="请输入负责人" disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="tel" id="tel1" placeholder="请输入电话:" disabled>
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
                <button onclick="deleteInstrument()" type="button" class="btn btn-primary"  data-dismiss="modal">删除</button>
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
                <h4 class="modal-title" id="myModalLabel">设备信息</h4>
            </div>
            <div class="modal-body">
                  <form class="form-horizontal" id="addform">
						 <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">设备名:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="name" class="form-control" id="name" placeholder="请输入设备名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">开始使用时间:</label>
						    <div class="col-sm-10">
						      <input type="date"  name="begintime" class="form-control" id="begintime" placeholder="请输入开始使用时间">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">介绍:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="introduce" class="form-control" id="introduce" placeholder="请输入介绍">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">供应商:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="suppliername" class="form-control" id="suppliername" placeholder="请输入供应商">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">负责人:</label>
						    <div class="col-sm-10">
						      <input type="text"  name="principal" class="form-control" id="principal" placeholder="请输入负责人">
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
						      <input type="text" class="form-control" name="tel" id="tel" placeholder="请输入电话:">
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