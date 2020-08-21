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
<nav class="navbar navbar-expand-sm bg-light">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a href="" class="nav-link">메뉴1</a>
		</li>
		<li class="nav-item">
			<a href="" class="nav-link">메뉴2</a>
		</li>
		<li class="nav-item">
			<a href="" class="nav-link">메뉴3</a>
		</li>
		<li class="nav-item">
			<a href="" class="nav-link">메뉴4</a>
		</li>
	</ul>
</nav>
<div class="container">
	${sessionScope.user.uiName}님 반갑습니다.<br>
	<c:if test="${sessionScope.user.uiAdmin == '1'}">
		<a href="/views/list"><button class="btn btn-info">유저리스트</button></a>
	</c:if>
	<button class="btn btn-info" onclick="doLogout()">로그아웃</button>
	<a href="/views/modify"><button class="btn btn-info" >정보수정</button></a> 
	<button class="btn btn-info" onclick="toggleDeleteDiv('')">탈퇴하기</button>
	<div style="display:none" class="container" id="deleteDiv">
		정말로 삭제할라고?<br>
		<input type="password" name="ui_pwd" id="ui_pwd">
		<button onclick="doDeleteAccount()">확인</button>
		<button onclick="toggleDeleteDiv('none')">취소</button>
	</div>
</div>
<script >
function toggleDeleteDiv(type){
	document.querySelector('#deleteDiv').style.display=type;
}
function doLogout(){
	$.ajax({
		url:'/ajax/user',
		method:'POST',
		data : JSON.stringify({cmd:'logout'}),
		success : function(res){
			if(res.result){
				alert('로그아웃 되었습니다.');
				location.href='/views/login';
			}
		}
	})
	
}
function doDeleteAccount(){
	var data = {
		cmd : 'deleteAccount',
		uiPwd : document.querySelector('#ui_pwd').value
	}
	$.ajax({
		url : '/ajax/user',
		method:'POST',
		data:JSON.stringify(data),
		contentType:'application/json',
		success : function(res){
			if(res.result===1){
				alert('탈퇴되었습니다.');
				location.href='/views/login';
			}else if(res.result===-1){  
				alert('비밀번호가 올바르지 않습니다.');
			}else{
				alert('실패하였습니다.');
			}
		}
	})
}
</script>
</body>
</html>





