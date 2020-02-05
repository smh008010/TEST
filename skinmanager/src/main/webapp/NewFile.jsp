<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common/commoncss.jsp" %>
<%@ include file="common/commonjs.jsp" %>
<%@ include file="common/css.jsp" %>
<title>Insert title here</title>
<style type="text/css">
*{
			margin: 0;
			padding: 0;
		}
		#div1{
			width: 1700px;
			height: 1000px;
			position: relative;
			overflow: hidden;
			 
		}
		#div1 ul{
			position:absolute;
			left: 0;
			top: 0;
		}
		#div1 ul li {
			float: right;
			width: 1000px;
			height: 1000px;
			list-style: none;
			margin-left: 10px;
		}
</style>


</head>
<body>
   <div id="div1">
		<ul>
			<li><img src="assets/images/users/manager2.jpg" alt=""></li>
			<li><img src="assets/images/users/manager3.jpg" alt=""></li>
			<li><img src="assets/images/users/manager1.jpg" alt=""></li>
            <li><img src="assets/images/users/manager6.jpg" alt=""></li>
			<li><img src="assets/images/users/manager7.jpg" alt=""></li>
		</ul>
	</div>

 <script type="text/javascript">
 window.onload=function(){
		var oDiv  =  document.getElementById('div1');
		var oUl = document.getElementsByTagName('ul')[0];
		var Li = oUl.getElementsByTagName('li');//获取ul下的所有li
		oUl.innerHTML = oUl.innerHTML+oUl.innerHTML;//li下的内容进行想加
		oUl.style.width = Li[0].offsetWidth*Li.length+'px';//ul的宽度等于每个li的宽度乘以所有li的长度
		var speed = 2
		
		//主方法
		function move(){
			//如果左边横向滚动了长度一半之后,回到初始位置
			
			if(oUl.offsetLeft<-oUl.offsetWidth/speed){
				oUl.style.left = '0'
			}
			//如果右边横向滚动的距离大于0 就让他的位置回到一半
			if(oUl.offsetLeft>0){
				oUl.style.left = -oUl.offsetWidth/speed+'px';
			}
			//oUl.style.left = oUl.offsetLeft-2+'px';//进行左横向滚动
			oUl.style.left = oUl.offsetLeft+speed+'px';//进行右横向滚动
		}
		//调用方法
		var timer = setInterval(move,10)
		//鼠标指向的时候 暂停
		oDiv.onmouseover=function(){
			clearInterval(timer);
		}	
		//鼠标离开之后 继续滚动
		oDiv.onmouseout=function(){
			 timer = setInterval(move,10)
		}
		
		

	}

 </script>
</body>
</html>