var $id = function(id) {
	return document.getElementById(id)
}

var index = {};

index.login = function() {
	let frm = $id("login_form");
	if ($id("login_button")) {
		$id("login_button").onClick = function() {
			if (frm.mId.value == "" || frm.mPw.value == "") {
				alert("아이디와 비밀번호를 확인해 주세요.");
				return;
			}
			frm.login_form.value = "result";
			frm.action = "member/login";
			frm.submit();
		}
	}
}