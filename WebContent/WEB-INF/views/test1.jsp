<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<style>
div>div{
	border:1px solid
}	
</style>
</head>
<body>
<img src="/res/images/cat.jpg" width="300px" class="rounded-circle mx-auto d-block">
<div class="row">
	<div class="col-sm-3">1row, 1col</div>
	<div class="col-sm-3">1row, 2col</div>
	<div class="col-sm-3">1row, 3col</div>
	<div class="col-sm-3">1row, 4col</div>
</div>

<div class="row">
	<div class="col-sm-2">2row, 1col</div>
	<div class="col-sm-7">2row, 2col</div>
</div>
<table class="table table-bordered table-hover table-dark">
	<tr>
		<td>td1</td>
		<td>td2</td>
		<td>td3</td>
	</tr>
	<tr>
		<td>td1</td>
		<td>td2</td>
		<td>td3</td>
	</tr>
	<tr>
		<td>td1</td>
		<td>td2</td>
		<td>td3</td>
	</tr>
</table>

<button>눌러1</button>
<button class="btn btn-primary">눌러2</button>
<div class="dropdown">
	<button class="btn dropdown-toggle" data-toggle="dropdown">드랍다운</button>
	<div class="dropdown-menu">
		<a href="" class="dropdown-item">다운1</a>
		<a href="" class="dropdown-item">다운2</a>
		<a href="" class="dropdown-item">다운3</a>
	</div>
</div>
<br>
<br>
<br>
</body>
</html>





