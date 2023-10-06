<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/css/member/login.css">
<title>로그인 페이지</title>
</head>
<body>

	<div class="wrapper">
		<form id="login_form" method="post">
			<div class="wrap">
				<div class="logo_wrap">
					<span>로그인</span>
				</div>
				<div class="login_wrap"> 
					<div class="id_wrap">
							<span>아이디</span>
							<div class="id_input_box">
							<input class="id_input" name="mId">
						</div>
					</div>
					<div class="pw_wrap">
						<span>비밀번호</span>
						<div class="pw_input_box">
							<input class="pw_iput" name="mPw">
						</div>
						<c:if test="${result == 0}">
							<div class="login_warn">아이디 또는 비밀번호를 다시 확인해 주세요.</div>
						</c:if>
					</div>
					<div class="login_button_wrap">
						<input type="button" class="login_button" value="로그인">
					</div>			
				</div>
				
				
			</div>
		</form>
	</div>
	
	<script>
		// 로그인 버튼 클릭
		$(".login_button").click(function() {
			alert("로그인 버튼 작동")
			$("#login_form").attr("action", "/member/login");
			$("#login_form").submit();
		});
	</script>

</body>
</html>
<%@ include file="../includes/footer.jsp"%>