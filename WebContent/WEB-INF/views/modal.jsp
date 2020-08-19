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
<h1>H1</h1>
	<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#modal">눌러바~</button>
	<div class="modal" id="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" >안녕 난 모달이라고해</h4>
					<button class="close" data-dismiss="modal">X</button>
				</div>
				<div class="modal-body">
					내용을 쓰면 됩니다.
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>





