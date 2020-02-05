<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作人员签到列表</title>
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
                    <h2 class="header-title">工作人员签到信息</h2>
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
		url:'${pageContext.request.contextPath}/sign/querysign',
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
			field:'user.username',
			title:'姓名'
		},{
			field:'signyear',
			title:'年份',
			formatter:function(value,row,index){
				var result=row.signyear+'年';
				return result;
			}
		},{
			field:'signmonth',
			title:'月份',
			formatter:function(value,row,index){
				var result=row.signmonth+'月';
				return result;
			}
		},{
			field:'number',
			title:'签到天数'
		}]
	})
})

</script>         
</body>
</html>