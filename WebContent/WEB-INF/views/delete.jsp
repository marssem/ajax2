<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<div>
비밀번호 입력
	<input type="password" id="ui_pwd" name="ui_pwd"> 
	<button onclick="userDelete()">탈퇴</button>
</div>
<script>
function userDelete(){
	var uiP = document.querySelector('#ui_pwd');
	var cmd = 'delete';
	var param = {
		uiPwd : uiP,
		cmd : cmd
	}
	  $.ajax({
		  url : '/ajax/user',
		  method : 'POST',
		  data : JSON.stringify(param),
		  contentType : 'application/json',
		  success : function(res){
			  if(res.result===1){
				  alert('탈퇴 되었습니다');
				  location.href='/';
			  }else if(res.result===-1){
				  alert('탈퇴 되었습니다');
			  }else{
				  alert('문제 있음');
			  }
		  }
	  })
}
</script>
</body>
</html>