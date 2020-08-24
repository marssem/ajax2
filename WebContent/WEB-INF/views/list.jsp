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
<div id="userListDiv">
	<table class="table table-bordered">
		<tr>
			<th data-col="uiNum">번호</th>
			<th data-col="uiAge">나이</th>
			<th data-col="uiName">이름</th>
			<th data-col="uiId">아이디</th>
			<th data-col="uiBirth">생년월일</th>
			<th data-col="uiEmail">이메일</th>
			<th data-col="uiCredat">가입일</th>
			<th data-col="uiNickname">별명</th>
			<th data-col="uiAdmin">어드민</th>
		</tr>
	</table>
</div>
<script >
/* $("#userListDiv").html('하하하~'); */
$(document).ready(function(){
	$.ajax({
		url:'/ajax/user',
		method:'GET',
		data: {cmd:'list'},
		success:function(res){
			var html = '<table border="1">';
			html += '<tr><th>이름</th>';
			html += '<th>나이</th>';
			html += '<th>생년월일</th>';
			html += '<th>아이디</th>';
			html += '<th>핸드폰</th>';
			html += '<th>이메일</th>';
			html += '<th>생성일</th>';
			html += '<th>별명</th>';
			html += '<th>어드민</th></tr>';
			for(var i=0;i<res.list.length;i++){
				var user = res.list[i];
				console.log(user);
				html += '<th>'+user.uiName+'</th>';
				html += '<th>'+user.uiAge+'</th>';
				html += '<th>'+user.uiBirth+'</th>';
				html += '<th>'+user.uiId+'</th>';
				html += '<th>'+user.uiPhone+'</th>';
				html += '<th>'+user.uiEmail+'</th>';
				html += '<th>'+user.uiCredat+'</th>';
				html += '<th>'+user.uiNickname+'</th>';
				html += '<th>'+user.uiAdmin+'</th></tr>';
			}
			html += '</table>';
			$('#userListDiv').html(html);
		}
	})
	
})
</script>
<h3>유저리스트</h3>
<div id="userListDiv"></div>
</body>
</html>