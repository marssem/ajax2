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
<script >
var param = {
		cmd:'list',
		page:1
}
var members = '';
function abc(){
$.ajax({
	url:'/ajax/member',
	method:'GET',
	data : {
			json : JSON.stringify(param)
	},
	success:function(res){
		var html = '';
		for(var i = 0; i<res.list.length; i++){
			html += '<tr>'; 
			var memlist = res.list[i]
			$('th[data-li]').each(function(idx,th){
				var mem =  th.getAttribute('data-li');
				 html += '<td>'+memlist[mem]+'</td>'; 
			})
			html += '</tr>'
				$('#tbody').html(html);
		}
	},
	error : function(err){
		console.log(err.responseText);
	}

})
}

$(document).ready(abc);

</script>
<table class="table tabler-bordered">
	<tr>
		<th data-li="rNum"></th>
		<th data-li="miNum"></th>
		<th data-li="miId"></th>
		<th data-li="miName"></th>
		<th data-li="startRowNum"></th>
		<th data-li="endRowNum"></th>
		<th data-li="page"></th>
	</tr>
	<tbody id="tbody"></tbody>
</table>
</body>
</html>