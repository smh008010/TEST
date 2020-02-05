<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="common/commoncss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/mui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/css/sweetalert2.min.css"/>
<%@ include file="common/commonjs.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(function () {
            NOW();
        });
        //初始化时间控件
        function NOW() {
            var now = new Date();
            var nowYear = now.getFullYear(); //年
            var nowMonth = now.getMonth() + 1 < 10 ? "0" + (now.getMonth() + 1) : now.getMonth(); //月
            var nowDay = now.getDate() < 10 ? "0" + now.getDate() : now.getDate(); //日期
            var nowHour = now.getHours() < 10 ? "0" + now.getHours() : now.getHours(); //时
            var nowMinute = now.getMinutes() < 10 ? "0" + now.getMinutes() : now.getMinutes(); //分
            var nowDate = nowYear + "-" + nowMonth + "-" + nowDay;
            var nowTime = nowHour + ":" + nowMinute;
 
            $("#nowDate").val(nowDate);
            $("#nowTime").val(nowTime);
        }
 
        $(function () {
            $("#btnNow").click(function () {
                NOW();
            });
        });
    </script>
<script type="text/javascript">
        $(function () {
            NOW2();
        });
        //初始化时间控件
        function NOW2() {

            $("#nowdatetime").val(nowdatetime);
        }
 
        $(function () {
            $("#btnNow2").click(function () {
                NOW2();
            });
        });
    </script>

</head>
<body>
<div>
        <input type="date" id="nowDate" />
        <input type="time" id="nowTime" />
        <input type="datetime-local" id="nowdatetime">
        <input type="button" id="btn" value="获取时间" />
        <input type="button" id="btnNow" value="当前时间" />
        <input type="button" id="btnNow2" value="获取当前时间" />
    </div>
<script type="text/javascript">
    $(function () {
        $("#btn").click(function () {
            var nDate = $("#nowDate").val();
            var nTime = $("#nowTime").val();
            alert(nDate + " " + nTime);
        }); 
    });
</script>
</body>
</html>

