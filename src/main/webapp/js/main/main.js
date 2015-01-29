/*회원 가입 부분*/

var checkedId = false;	// 아이디 체크 변수

//아이디 체크 함수
function checkId() {	
	var id = $('#j_id').val();
	$.getJSON("member/check.do?id=" + id, function(obj) {
		if (obj.result == "") {
			alert("사용가능한 아이디입니다.");
			checkedId = id;
		} else {
			alert("이미 존재하는 아이디입니다.");
		}

	});
}
//모든 입력란에 값을 넣었는지 확인하는 함수
function validate() {	
	if ($('#j_id').val() == "") {
		alert("아이디는 필수 입력 항목입니다.");
		return false;
	}
	if ($('#j_password').val() == "") {
		alert("비밀번호는 필수 입력 항목입니다.");
		return false;
	}
	if ($('#j_nickname').val() == "") {
		alert("닉네임은 필수 입력 항목입니다.");
		return false;
	}
	if ($('#j_password').val() != $('#j_password_chk').val()) {
		alert("비밀번호와 비밀번호확인이 다릅니다.");
		return false;
	}

	if (!checkedId) {
		alert("아이디 중복검사를 실행해주세요.");
		return false;
	}
	return true;
}

//회원 정보 체크 함수
function info_check() {
	if ($('#info_password_now').val() == "") {
		alert("비밀번호는 필수 입력 항목입니다.");
		return false;
	}
	/*if ($('#info_password_now').val() != ${loginInfo.password}) {
		      alert("현재 비밀번호가 다릅니다");
		      return false;
		}*/

	if ($('#info_nickname').val() == "") {
		alert("닉네임은 필수 입력 항목입니다.");
		return false;
	}
	if ($('#info_password_after').val() != $('#info_password_chk').val()) {
		alert("바꿀 비밀번호와 비밀번호확인이 다릅니다.");
		return false;
	}
	return true;
}

//이미지 미리보기 함수
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('info_img').src = e.target.result;
		}
		reader.readAsDataURL(input.files[0]);
	}
}
function readURL_join(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('j_img').src = e.target.result;
		}
		reader.readAsDataURL(input.files[0]);
	}
}

/* 회원가입 끝 부분*/