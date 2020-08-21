<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>

   <div class="limiter">
      <div class="container-login100"
         style="background-image: url('/res/images/bg-01.jpg')">
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form">
            <input type="hidden" name="ui_num" id="ui_num" value="${user.uiNum }">
               <span class="login100-form-title p-b-24"> 회원정보수정 </span>

               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="ID is reauired">
                  <span class="label-input100">User ID</span> 
                  <input class="input100" type="text" value="${user.uiId}" name="ui_id" id="ui_id" style="width:70%;"placeholder="아이디를 입력하세요" readonly>
                  <span class="focus-input100" data-symbol="&#xf206;"></span> 
               </div>
               <div class="wrap-input100 validate-input"
                  data-validate="Password is required">
                  <span class="label-input100">Password</span> <input
                     class="input100" type="password" name="ui_pwd"
                     id="ui_pwd" placeholder="비밀번호를 입력하세요"
                     value="${user.uiPwd}"> <span
                     class="focus-input100" data-symbol="&#xf190;"></span>
               </div>
               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="ID is reauired">
                  <span class="label-input100">User Name</span> <input
                     class="input100" value="${user.uiName}" type="text" name="ui_name" id="ui_name"
                     placeholder="성명을 입력하세요"> <span class="focus-input100"
                     data-symbol="&#xf206;"></span>
               </div>
               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="ID is reauired">
                  <span class="label-input100">User Birth</span> <input
                     class="input100" type="date" value="${user.uiBirth}" name="ui_birth" id="ui_birth" onchange="setUiAge(this)">
                  <span class="focus-input100" data-symbol="&#xf206;" ></span>
               </div>
               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="ID is reauired">
                  <span class="label-input100">User Age</span> <input
                     class="input100" type="number" value="${user.uiAge}" name="ui_age" id="ui_age">
                  <span class="focus-input100" data-symbol="&#xf206;"></span>
               </div>
               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="ID is reauired">
                  <span class="label-input100">User Email</span> <input
                     class="input100" type="text" value="${user.uiEmail}"  name="ui_email" id="ui_email"
                     placeholder="이메일을 입력하세요"> <span class="focus-input100"
                     data-symbol="&#xf206;"></span>
               </div>
               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="ID is reauired">
                  <span class="label-input100">User Phone</span> <input
                     class="input100" type="number"  value="${user.uiPhone}" name="ui_phone" id="ui_phone"
                     placeholder="휴대전화를 입력하세요"> <span class="focus-input100"
                     data-symbol="&#xf206;"></span>
               </div>
               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="ID is reauired">
                  <span class="label-input100">User Nickname</span> <input
                     class="input100" type="text" name="ui_nickname"  value="${user.uiNickname}" id="ui_nickname"
                     placeholder="닉네임을 입력하세요"> <span class="focus-input100"
                     data-symbol="&#xf206;"></span>
               </div>


               <div class="container-login100-form-btn">
                  <div class="wrap-login100-form-btn">
                     <div class="login100-form-bgbtn"></div>
                     <button type="button" class="login100-form-btn"
                        onclick="doSignUp()">회원 수정 완료</button>
                  </div>
               </div>



               <div class="flex-col-c p-t-155">
                  <span class="txt1 p-b-17">이용약관 </span> <a href="#" class="txt2">
                     2020 Copylight by PKH </a>
               </div>
            </form>
         </div>
      </div>
   </div>

   <div id="dropDownSelect1"></div>
<script>
   function doSignUp() {
 	  var els = document.querySelectorAll('input');
 	  var params = {};
 	  for(var i=0;i<els.length;i++){
 		  var el = els[i];
 		  var keys = el.name.split('_');
 		  for(var j=1;j<keys.length;j++){
 			  keys[j] = keys[j].substring(0,1).toUpperCase() + keys[j].substring(1); 
 		  }
 		  params[keys.join('')] = el.value;
 	  }
 	 params.cmd = 'modify';
 	  $.ajax({
 		  url : '/ajax/user',
 		  method : 'POST',
 		  data : JSON.stringify(params),
 		  contentType : 'application/json',
 		  success : function(res){
 			  if(res.result===1){
 				  alert('회원정보 수정이 되었습니다');
 				  location.href='/';
 			  }else if(res.result===-1){
 				  alert('회원정보 수정이 안 되었습니다');
 			  }else{
 				  alert('문제 있음');
 			  }
 		  }
 	  })
   }
   function setUiAge(f){
	   var birthDate = new Date(f.value);
	   var toDate = new Date();  
	   document.querySelector('#ui_age').value = (toDate.getFullYear()-birthDate.getFullYear()+1);
   }
  
</script>
</body>
</html>