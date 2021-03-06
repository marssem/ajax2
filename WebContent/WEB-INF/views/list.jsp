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
<script>
var func = function(){
	document.querySelector('#deleteBtn').onclick = function(){
		var uiNumObjs = document.querySelectorAll('[name=uiNum]:checked');
		if(!uiNumObjs.length){//else if를 계속 붙여주면, 전부 해석을 해야 되기 때문에 이렇게 하는 것이 좋다.
			alert('선택을 하고 누르라고!');
			return;
		}
		var uiNums = [];
		for(var i=0;i<uiNumObjs.length;i++){
			uiNums.push(uiNumObjs[i].value);
		}

		var params = {
				uiNums : uiNums,
				cmd :'deleteUsers' 
		}
		$.ajax({
			url : '/ajax/user',
			method : 'post',
			data : JSON.stringify(params),
			success : function(res){
				if(res.result){
					alert('삭제 완료');
				}
			}
		})
	}
	document.querySelector('#allCheck').onchange = function(){
		$('input[name=uiNum]').prop('checked',this.checked);//확실히 하기 위해서 name의 앞에 input을 달아 주었다. 없어도 상관없음.
	}
	$.ajax({
		url:'/ajax/user',
		method:'GET',
		data : {cmd:'list'},
		success:function(res){
			var ths = document.querySelectorAll('th[data-col],th[data-pk]');
			var html = '';
			for(var i=0;i<res.list.length;i++){
				var user = res.list[i];
				html += '<tr>';
				for(var j=0;j<ths.length;j++){
					var th = ths[j];
					var col = th.getAttribute('data-col');
					if(col){
						html += '<td>' + user[col] + '</td>';
					}else{
						col = th.getAttribute('data-pk');
						html += '<td><input type="checkbox" name="'+ col + '" value="' + user[col] +'"></td>';
					}
				}
				html += '</tr>';
			}
			$('#tBody').html(html);
		}
	})
}
$(document).ready(func);
</script>

<h3>유저리스트</h3>
<input type="text" data-type="text" id="in">
<div id="userListDiv">
	<table class="table table-bordered">
		<tr>
			<th data-pk="uiNum"><input type="checkbox" id="allCheck"><br>
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
		<tbody id="tBody">
	</table>
	<button class="btn btn-primary" id="deleteBtn">유저삭제</button>
</div>
<!-- <script >
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
</script> -->

</body>
</html>