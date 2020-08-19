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
<ul class="nav nav-tabs">
	<li class="nav-item">
		<a class="nav-link active" data-toggle="tab" href="#t1">TAB1</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#t2">TAB2</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#t3">TAB3</a>
	</li>
</ul>
<div class="tab-content">
	<div class="tab-pane container active" id="t1">난 TAB1내용임</div>
	<div class="tab-pane container" id="t2">난 TAB2내용임</div>
	<div class="tab-pane container" id="t3">난 TAB3내용임</div>
</div>
</body>
</html>









