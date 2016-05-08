<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>Index Page</h1>	 
	<div>  
		<%  
		    String inputCode = request.getParameter("inputCode");  
		    String verifyCode = (String)session.getAttribute("validateCode");  
		    if(inputCode!=null && verifyCode!=null){  
		        out.print("真正的验证码：" + verifyCode + "<br/>" + "用户输入的验证码：" + inputCode + "<br/>");  
		        inputCode = inputCode.toUpperCase();//不区分大小写  
		        out.print("比较验证码证明用户输入 " + (inputCode.equals(verifyCode)?"正确":"错误") + "！");  
		    }  
		%>  
		
		<form action="index.jsp">  
			验证码：<input name="inputCode" value=""/>   
			<img src="VerifyCodeServlet" align="middle" title="看不清，请点我"  onclick="javascript:refresh(this);" onmouseover="mouseover(this)"/><br/>  
			<input name="submit" type="submit" value="提交"/>  
		</form>  
	</div>  
	
	<script>  
	    function refresh(obj){  
	         obj.src = "VerifyCodeServlet?" + Math.random();  
	    }  
	      
	    function mouseover(obj){  
	        obj.style.cursor = "pointer";  
	    }  
	</script>  
</body>  
</html>  