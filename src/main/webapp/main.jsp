<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginInfo.nickName}님환영합니다!!</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/main/main.css">
<link rel="stylesheet" href="./css/main/gallery/gallery.css">
<link rel="stylesheet" href="./css/main/login.css">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.3/fotorama.css"
	rel="stylesheet">
<!-- 3 KB -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.3/fotorama.js"></script>
<!-- 16 KB -->
<script type="text/javascript" src="./js/bootstrap.min.js"></script>

<!-- Gallery  -->
<script type="text/javascript"
	src="./js/main/gallery/jquery.bxslider.js"></script>
<link href="./css/main/gallery/jquery.bxslider.css" rel="stylesheet" />
<script type="text/javascript">
	$(document).ready(function() {
		$('.slider5').bxSlider({
			slideWidth : 300,
			minSlides : 3,
			maxSlides : 3,
			moveSlides : 3,
			slideMargin : 10
		});
	});
</script>
<!-- Gallery End -->

<!-- Login -->
<script>
	$(document).ready(function() {
		$("#login_btn").click(function() {
			$(".login_layer").show();
			$(".join_layer").hide();
		});
		$("#join_btn").click(function() {
			$(".login_layer").hide();
			$(".join_layer").show();
		});
	});
</script>
<!-- Login End -->
<!-- JOIN -->
<script>
	var checkedId = false;
	function checkId() {
		var id = $('#j_id').val();
		$.getJSON("member/check.do?id=" + id, function(obj) {
			if (obj.result == "") {
				alert("사용가능한 아이디입니다.");
				checkedId = true;
			} else {
				alert("이미 존재하는 아이디입니다.");
			}

		});
	}
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
</script>
<!-- JOIN END -->

<style>
.main_btn{
border-radius:60px;
-moz-border-radius:60px;
-webkit-border-radius:60px;
border:3px solid Thistle;
}

.main_logo{
  margin:auto;
  width:300px;
  height:244px;
  line-height:330px;
}
.main_logo img{
vertical-align:middle;
}
</style>
</head>


<body>
	<div class="wrap">
		<div class="container">
			<div class="main_top">
			<div class="main_logo">
			 <img src="./images/logo2.png">
			 </div>
			</div>
			<div class="main_bottom">
				<div class="main_menu">
					<c:choose>
						<c:when test="${empty loginInfo}">
							<span><a href="#" class="btn-example"
								onclick="layer_open('layer2');return false;"> <img class="main_btn"
									src="./images/logo.png" style="width: 100px; height: 100px"></a></span>
						</c:when>
						<c:otherwise>
							<span><a href="member/logout.do" class="btn-example">
									<img src="files/${loginInfo.photo}" class="main_btn"
									style="width: 100px; height: 100px;">
							</a></span>
						</c:otherwise>
					</c:choose>
					<span><a href="member/colouringbook.do" class="btn-example"> <img class="main_btn"
							src="./images/logo.png" style="width: 100px; height: 100px"></a></span>
					<span><a href="#" class="btn-example"
						onclick="layer_open('layer2');return false;"> <img class="main_btn"
							src="./images/logo.png" style="width: 100px; height: 100px"></a></span>
					<span><a href="#" class="btn-example"
						onclick="layer_open('layer2');return false;"> <img class="main_btn"
							src="./images/logo.png" style="width: 100px; height: 100px"></a></span>
				</div>
				<div class="main_gallery">
					<div class="slider5">
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar1">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar2">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar3">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar4">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar5">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar6">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar7">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar8">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar9">
						</div>
						<div class="slide">
							<img src="http://placehold.it/300x150&text=FooBar10">
						</div>
					</div>
				</div>
			</div>



			<!-- 로그인 팝업창  -->
			<div class="layer">
				<div class="bg"></div>
				<div id="layer2" class="pop-layer">
					<div class="pop-container">
						<div class="login_layer">
							<div class="pop-conts">
								<!--content //-->
								<form class="form-horizontal" action="member/login.do"
									method="post">
									<h1>LOGIN</h1>
									<div class="form-group">
										<label for="id" class="col-sm-2 control-label"> ID</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="l_id" name="id"
												placeholder="ID">
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">Password</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="l_password"
												name="password" placeholder="Password">
										</div>
									</div>
									<div style="text-align: right">
										<a id="join_btn" style="cursor: pointer;">Join&gt;</a>
									</div>
									<div class="btn-r">
										<button type="submit" class="btn btn-default"
											id="login_submit">OK</button>
									</div>
								</form>
							</div>


						</div>
						<div class="join_layer" style="display: none;">
							<div class="pop-conts">
								<!--content //-->
								<form class="form-horizontal" action="member/signUp.do"
									method="post" enctype="multipart/form-data"
									onsubmit="return validate();">
									<h1>JOIN</h1>
									<div class="form-group">
										<label for="file" class="col-sm-2 control-label">IMAGE</label>
										<div class="col-sm-10">
											<input class="form-control" name="file" type="file">
										</div>

									</div>
									<div class="form-group">
										<label for="id" class="col-sm-2 control-label">ID</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="j_id" name="id"
												placeholder="ID">
											<button type="button" onclick="checkId()">중복검사</button>
										</div>

									</div>
									<div class="form-group">
										<label for="id" class="col-sm-2 control-label">NickName</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="j_nickname"
												name="nickName" placeholder="ID">
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">Password</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="j_password"
												name="password" placeholder="Password">
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">Check
											Password</label>
										<div class="col-sm-10">
											<input type="password" class="form-control"
												id="j_password_chk" name="password_chk"
												placeholder="Password check">
										</div>
									</div>
									<div style="text-align: left;">
										<a id="login_btn" style="cursor: pointer;">&lt;Login</a>
									</div>
									<div class="btn-r">
										<button type="submit" class="btn btn-default" id="join_submit">OK</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
<script>
	function onSelectEsc() {
		location.href = '../index.html'
	}
</script>
<script type="text/javascript">
	function layer_open(el) {

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		if (bg) {
			$('.layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		} else {
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height())
			temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
		else
			temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width())
			temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
		else
			temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e) {
			if (bg) {
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			} else {
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});
	}
</script>
</html>