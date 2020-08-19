<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var h = {
		name : '동동',
		age : 22
}
h = JSON.stringify(h);
h = JSON.parse(h);
alert(h.name);
</script>
나나~~
</body>
</html>