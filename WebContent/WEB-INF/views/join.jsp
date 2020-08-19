<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('/res/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-49"> SIGN UP </span>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="ID is reauired">
						<span class="label-input100">User ID</span> <input
							class="input100" type="text" name="ui_id" id="ui_id"
							placeholder="Type your ID"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<span class="label-input100">PassWord</span> <input
							class="input100" type="password" name="ui_password"
							id="ui_password" placeholder="Type your password"> <span
							class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="NAME is reauired">
						<span class="label-input100">User Name</span> <input
							class="input100" type="text" name="ui_name" id="ui_name"
							placeholder="Type your NAME"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="AGE is reauired">
						<span class="label-input100">User Age</span> <input
							class="input100" type="text" name="ui_age" id="ui_age"
							placeholder="Type your AGE"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="BIRTH is reauired">
						<span class="label-input100">User Birth</span> <input
							class="input100" type="date" name="ui_birth" id="ui_birth"
							placeholder="Type your BIRTH"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="PHONE is reauired">
						<span class="label-input100">User Phone Number</span> <input
							class="input100" type="text" name="ui_phone" id="ui_phone"
							placeholder="Type your PHONE"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="EMAIL is reauired">
						<span class="label-input100">User Email</span> <input
							class="input100" type="text" name="ui_email" id="ui_email"
							placeholder="Type your EMAIL"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="NICNAME is reauired">
						<span class="label-input100">User NickName</span> <input
							class="input100" type="text" name="ui_nickname" id="ui_nickname"
							placeholder="Type your NICKNAME"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>

					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" class="login100-form-btn"
								onclick="doLogin()">JOIN</button>
						</div>
					</div>


					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1"> <i
							class="fa fa-facebook"></i>
						</a> <a href="#" class="login100-social-item bg2"> <i
							class="fa fa-twitter"></i>
						</a> <a href="#" class="login100-social-item bg3"> <i
							class="fa fa-google"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
</body>
</html>