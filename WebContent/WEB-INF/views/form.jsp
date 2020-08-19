<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<form method="post" action="/ajax/user">
	<input type="hidden" name="cmd" id="cmd" value="login">
	<input type="text" id="ui_id" name="ui_id">
	<input type="text" id="ui_password" name="ui_password">
	<button type="button" onclick="doLogin()">로그인</button>
</form>
<script>
function doLogin(){
	var param = {
			ui_id : document.querySelector('#ui_id').value,
			ui_password : document.querySelector('#ui_password').value,
			cmd : 'login'
	}
	param = JSON.stringify(param);
	var conf = {
			url : '/ajax/user',
			method : 'POST',
			data : param,
			success : function(res){
				alert(res.msg);
				if(res.isLogin=='true'){
					location.href='/'
				}
			},
			error : function(res){
				
			},
			contentType:'application/json'
	}
	$.ajax(conf);
}
</script>
</body>
</html>