<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/css/member/join.css">
<title>회원가입 페이지</title>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
		<div class="join_wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="mId">
					</div>
					<span class="id_input_re_true">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_false">이미 존재하는 아이디입니다.</span>
					<span class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="mPw">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input">
					</div>
					<span class="final_pwck_ck">비밀번호 확인란을 입력해주세요.</span>
					<span class="pwCk_input_false">비밀번호가 일치하지 않습니다.</span>
					<span class="pwCk_input_true">비밀번호가 일치합니다.</span>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="mName">
					</div>
					<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div class="mail_wrap">
					<div class="mail_name">이메일</div> 
					<div class="mail_input_box">
						<input class="mail_input" name="mMail">
					</div>
					<span class="final_mail_ck">이메일을 입력해주세요.</span>
					<span class="mail_input_box_wrap"></span>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled" maxlength="6">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
					</div>
					<div class="clearfix"></div>
					<span id="mail_ck_input_box_warn"></span>
				</div>
				
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="mAddr1" readonly="readonly">
					</div>
					<div class="address_button" onclick="daum_address()">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
			</div>
			<div class ="address_input_2_wrap">
				<div class="address_input_2_box">
					<input class="address_input_2" name="mAddr2" readonly="readonly">
				</div>
			</div>
			<div class ="address_input_3_wrap">
				<div class="address_input_3_box">
					<input class="address_input_3" name="mAddr3" readonly="readonly">
				</div>
			</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
		
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 이메일 인증번호 저장 변수
	var code = "";
	
	// 유효성 검사 통과유무 전역변수
	var idCk = false;
	var idCkCk = false;
	var pwCk = false;
	var pwCkCk = false;
	var pwCkcorCk = false; //비밀번호 확인 일치 확인
	var nameCk = false;
	var mailCk = false;
	var mailNumCk = false;
	var addrCk = false;
	
	$(document).ready(function() {
		// 회원가입 버튼
		$(".join_button").click(function() {
			
			console.log("버튼 눌렸음");
			
			// 입력값 변수
			var id = $(".id_input").val(); // id 입력란
			var pw = $(".pw_input").val(); // 비밀번호 입력란
			var pwck = $(".pwck_input").val(); // 비밀번호 확인 입력란
			var name = $(".user_input").val(); // 이름 입력란
			var mail = $(".mail_input").val(); // 이메일 입력란
			var addr = $(".address_input_3").val(); // 주소 입력란
			
			
			
			// 아이디 유효성 검사
			if (id == "") {
				$('.final_id_ck').css("display", "block");
				// alert("아이디를 입력해주세요.");
				idCk = false;
			} else {
				$('.final_id_ck').css("display", "none");
				idCk = true;
			}
			
			// 아이디 입력 부분이 일치하지 않을시 input창으로 focus이동
			if (idCk == false) {
				alert("아이디를 다시 확인해주세요!");
				$(".id_input").focus();
			}
			
			// 비밀번호 유효성 검사
			if (pw == "") {
				$('.final_pw_ck').css("display", "block");
				alert("비밀번호를 입력해주세요.");
				pwCk = false;
			} else {
				$('.final_pw_ck').css("display", "none");
				pwCk = true;
			}
			
			// 비밀번호 입력 부분이 일치하지 않을시 input창으로 focus이동
			if (pwCk == false) {
				alert("비밀번호를 다시 확인해주세요!");
				$(".pw_input").focus();
			}
			
			// 비밀번호 일치 유효성 검사
			if (pwck == "") {
				$('.final_pwck_ck').css("display", "block");
				pwCkCk = false;
			} else {
				$('.final_pwck_ck').css("display", "none");
				pwCkCk = true;
			}
			
			// 비밀번호 입력 부분이 일치하지 않을시 input창으로 focus이동
			if (pwCkCk == false) {
				alert("비밀번호를 다시 확인해주세요!");
				$(".pw_input").focus();
			}
			
			// 이름 유효성 검사
			if (name == "") {
				$('.final_name_ck').css("display", "block");
				nameCk = false;
			} else {
				$('.final_name_ck').css("display", "none");
				nameCk = true;
			}
			
			// 이름 입력 부분이 일치하지 않을시 input창으로 focus이동
			if (nameCk == false) {
				alert("이름을 다시 확인해주세요!");
				$(".user_input").focus();
			}
			
			// 이메일 유효성 검사
			if (mail == "") {
				$('.final_mail_ck').css("display", "block");
				mailCk = false;
			} else {
				$('.final_mail_ck').css("display", "none");
				mailCk = true;
			}
			
			// 이메일 입력 부분이 일치하지 않을시 input창으로 focus이동
			if (mailCk == false) {
				alert("이메일을 다시 확인해주세요!");
				$(".mail_input").focus();
			}

			// 우편번호 유효성 검사
			if (addr == "") {
				$('.final_addr_ck').css("display", "block");
				addrCk = false;
			} else {
				$('.final_addr_ck').css("display", "none");
				addrCk = true;
			}
			
			// 주소 입력 부분이 일치하지 않을시 input창으로 focus이동
			if (addrCk == false) {
				alert("주소 다시 확인해주세요!");
				$(".mail_input").focus();
			}
			
			// 비밀번호 확인 부분이 일치하지 않을시 input창으로 focus이동
			if (pwCkcorCk == false) {
				alert("비밀번호를 확인해주세요!");
				$(".address_input_1").focus();
			}
			
			console.log("우편번호 최종 사이 로그");
			// 최종 유효성 검사

			if (idCk&&idCkCk&&pwCk&&pwCkCk&&pwCkcorCk&&nameCk&&mailCk&&mailNumCk&&addrCk != "") {
				console.log("최종유효성검사 내부");
				$("#join_form").attr("action", "/member/join");
				$("#join_form").submit();
			}
			
			return false;
		});
	});
		
	// 아이디 중복 검사
	$(".id_input").on("propertychange change keyup paste input", function() {
		
		var mId = $('.id_input').val();
		var data = {mId : mId} // '컨트롤러에 넘길 데이터' : 'input에 입력되는 데이터'
		
		$.ajax({
			type : "POST",
			url : "/member/memberIdCk",
			data : data,
			success : function(result) {
				
				if(result == "success") {
					console.log("아이디중복검사 : " + result + ", 아이디 : " + mId);
					$(".id_input_re_true").css("display", "inline-block");
					$(".id_input_re_false").css("display", "none");
					idCkCk = true;
				} else if (result == "fail"){
					console.log("fail : " + result);
					$(".id_input_re_false").css("display", "inline-block");
					$(".id_input_re_true").css("display", "none");
					idCkCk = false;
				} else if (result == "null") {
					console.log("null : " + result);
					$(".id_input_re_false").css("display", "none");
					$(".id_input_re_true").css("display", "none");
					idCkCk = false;
				}
			}
		});
	});
	
	// 인증번호 이메일 전송
	$(".mail_check_button").click(function () {
		var email = $(".mail_input").val(); // 입력한 이메일
		var ckBox = $(".mail_check_input"); // 인증번호 입력란
		var ckBoxWrap = $(".mail_check_input_box"); // 인증번호 입력 박스
		var warnMsg = $(".mail_input_box_wrap"); // 이메일 입력 경고글
		
		// 이메일 형식 유효성 검사
		if (mailFormCk(email)) {
			warnMsg.html("이메일이 전송되었습니다. 이메일을 확인해주세요.");
			warnMsg.css("display", "inline-block");
		} else {
			warnMsg.html("올바르지 못한 이메일 형식입니다.");
			warnMsg.css("display", "inline-block");
			return false;
		}
		
		$.ajax({
			type : "GET",
			url : "mailCk?email=" + email,
			success : function(data) {
				ckBox.attr("disabled", false);
				ckBoxWrap.attr("id", "mail_check_input_box_true");
				code = data;
			}
		});
	});
	
	// 이메일 인증번호 비교
	$(".mail_check_input").blur(function() {
		
		var inputCode = $(".mail_check_input").val(); // 입력코드
		var ckResult = $("#mail_ck_input_box_warn"); // 비교 결과
		
			if (inputCode == code) {
				ckResult.html("인증번호가 일치합니다.");
				ckResult.attr("class", "correct");
				$(".mail_check_input").attr("disabled", true);
				mailNumCk = true;
			} else if (inputCode != code || inputCode < 6){
				ckResult.html("인증번호를 확인해주세요.");
				ckResult.attr("class", "incorrect");
				mailNumCk = false;
			}
	});
	
	// 우편번호 검색(다음 주소 연동)
	function daum_address() {
		new daum.Postcode({
		       oncomplete: function(data) {
		    	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 주소변수 문자열과 참고황목 문자열 합치기
							addr += extraAddr;
	                    
	                } else {
							addr += ' ';
	                }
					$(".address_input_1").val(data.zonecode);
					// $("[name="mAddr1]").val(data.zonecode); // 대체 가능
					$(".address_input_2").val(addr);
					// $("[name="mAddr2]").val(data.zonecode); // 대체 가능
					// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동
					$(".address_input_3").attr("readonly", false);
					$(".address_input_3").focus();
	            }
	        }).open();
	    }
	
	// 비밀번호 일치 체크 유효성 검사
	$(".pwck_input").on("propertychange change keyup paste input", function() {
		var mPw = $('.pw_input').val();
		var mPwCk = $('.pwck_input').val();
		$(".final_pwck_ck").css("display", "none");
		
			if (pwCkcorCk == false ) {
				$(".pwCk_input_false").css("display", "none");
				console.log(pwCkcorCk);
			}
			
			if(mPw == mPwCk) {
				console.log("비밀번호 일치");
				$(".pwCk_input_true").css("display", "inline");
				$(".pwCk_input_false").css("display", "none");
				pwCkcorCk = true;
			} else if (mPw != mPwCk){
				console.log("비밀번호 불일치");
				$(".pwCk_input_true").css("display", "none");
				$(".pwCk_input_false").css("display", "inline");
				pwCkcorCk = false;
			}
	});
	
	// 비밀번호 일치 체크 유효성 검사
	$(".pw_input").on("propertychange change keyup paste input", function() {
		var mPw = $('.pw_input').val();
		var mPwCk = $('.pwck_input').val();
		$(".final_pwck_ck").css("display", "none");
		
			if(mPw == mPwCk || mPw == "" || mPwCk == "") {
				console.log("비밀번호 일치");
				$(".pwCk_input_false").css("display", "none");
				pwCkcorCk = true;
			} else if (mPw != mPwCk){
				console.log("비밀번호 불일치");
				$(".pwCk_input_true").css("display", "none");
				$(".pwCk_input_false").css("display", "block");
				pwCkcorCk = false;
			}
	});
	
	
	// input 이메일 형식 유효성 검사
	function mailFormCk(email) {
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}
	
</script>

</body>
</html>