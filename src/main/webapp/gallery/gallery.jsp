<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>CollagePlus for jQuery Example</title>


<link rel="stylesheet" type="text/css"
	href="../css/gallery/examples.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="../css/gallery/transitions.css" media="all" />

<!--[if lt IE 9]>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <![endif]-->
<!--[if (gte IE 9) | (!IE)]><!-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
<!--<![endif]-->
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
</script>
<![endif]-->
<link rel="stylesheet" href="../css/board/board.css">
<link rel="stylesheet" href="../css/main/login.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<script src="../js/gallery/jquery.collagePlus.js"></script>
<script src="../js/gallery/jquery.removeWhitespace.js"></script>
<script src="../js/gallery/jquery.collageCaption.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/board/jasny-bootstrap.min.js"></script>
<script type="text/javascript">
		// All images need to be loaded for this plugin to work so
		// we end up waiting for the whole window to load in this example
		$(window).load(function() {
			$(document).ready(function() {
				collage();
				$('.Collage').collageCaption();
			});
		});

		// Here we apply the actual CollagePlus plugin
		function collage() {
			$('.Collage').removeWhitespace().collagePlus({
				'fadeSpeed' : 2000,
				'targetHeight' : 200,
				'effect' : 'effect-1',
				'direction' : 'vertical'
			});
		};

		// This is just for the case that the browser window is resized
		var resizeTimer = null;
		$(window).bind('resize', function() {
			// hide all the images until we resize them
			$('.Collage .Image_Wrapper').css("opacity", 0);
			// set a timer to re-apply the plugin
			if (resizeTimer)
				clearTimeout(resizeTimer);
			resizeTimer = setTimeout(collage, 200);
		});
	</script>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	background-color:white;
}

.wrap {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	background-color: white; <!--
	background-color: #ebfbff;
	-->
}

.container {
  width:80%;
	height: 100%;
	margin: 0 auto;
}

.main_btn {
	border-radius: 60px;
	-moz-border-radius: 60px;
	-webkit-border-radius: 60px;
	border: 3px solid #444444;
}
.img-responsive {
  width: 100%;
  height: 400px;
}
.Image_Wrapper img{
  cursor:pointer;
}
</style>
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

$("#info_btn").click(function() {
  $('#myModal').modal();
  $('#myModal').on('shown.bs.modal', function() {

  });
});
$("#info_img").click(function() {
    $("input[id='info_file']").click();
  });

$("#j_id").focus(function(){
    $("#j_id").css('border', '1px solid #66afe9');  
     $("#j_id").css('box-shadow', 'inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6)'); 
    
  });
  $("#j_id").blur(function(){
          var id = $('#j_id').val();
         
          $.ajax({
          dataType: "json",
          type: "POST",
          url: "../member/check.do", //이페이지에서 중복체크를 한다
          data: "id="+ id ,//test.asp에 id 값을 보낸다
          cache: false,
          success: function(obj){
            if (id != "" && obj.result =="") {
                $("#j_id").css('box-shadow', 'none');
                    $("#j_id").css('border', '2px solid green');
                  checkedId = true;
                  $("#check_label").hide("slow");
                } else if(id == ""){
                  $("#j_id").css('box-shadow', 'inset 0 1px 1px rgba(0, 0, 0, .075)');  
                   $("#j_id").css('border', '1px solid #ccc');             
                   $("#check_label").hide("slow");
                }
            
            else {
                  $("#j_id").css('box-shadow', 'none');
                  $("#j_id").css('border', '2px solid tomato');
                  $("#check_label").show("slow");
                  //alert("이미 존재하는 아이디입니다.");
                }
          }
          });
      });
  $("#j_password_chk").blur(function(){
    var pwd = $('#j_password').val();
    var pwd_chk = $('#j_password_chk').val();
    
    if(pwd != pwd_chk)
     $("#pwd_check_label").show("slow");
    else
      $("#pwd_check_label").hide("slow");
  });
  $("#j_img").click(function() {
      $("input[id='j_file']").click();
    });
  $('.Image_Wrapper img').on('click', function() {
      var src = $(this).attr('src');
      var img = '<img src="' + src + '" class="img-responsive"/>';
      var title = $(this).attr('id');
      $('#' + title + '_g_modal').modal();
      $('#' + title + '_g_modal').on('shown.bs.modal', function() {
        $('#' + title + '_g_modal .modal-body').html(img);
      });
      $('#' + title + '_g_modal').on('hidden.bs.modal', function() {
        $('#' + title + '_g_modal .modal-body').html('');
      });
    });
});
function check(src){
var check = "<c:out value = "${loginInfo}"/>";

if(check == "")
{
  alert("Please Login");
} else {
  location.href = src;
}  
}
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
      temp.css('margin-top', '-' + $(document).height() / 3 + 'px');
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
<script type="text/javascript">
var checkedId = false;
function checkId() {
  var id = $('#j_id').val();
  $.getJSON("../member/check.do?id=" + id, function(obj) {
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
function info_check() {
  if ($('#info_password_now').val() == "") {
    alert("비밀번호는 필수 입력 항목입니다.");
    return false;
  }
 /* if ($('#info_password_now').val() != ${loginInfo.password}) {
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

</script>
</head>
<body>
	<div class="wrap">
		<div class="menubar">
			<span><a href="../main.do" class="btn-example"> <img
					class="main_btn" src="../images/logo.png"
					style="width: 80px; height: 80px"></a></span>
			<c:choose>
				<c:when test="${empty loginInfo}">
					<span><a href="#" class="btn-example"
						onclick="layer_open('layer2');return false;"> <img
							class="main_btn" src="../images/login.png"
							style="width: 80px; height: 80px"></a></span>
				</c:when>
				<c:otherwise>
					<span><a href="#" id="info_btn" class="btn-example"> <img
							src="../files/${loginInfo.photo}" class="main_btn"
							style="width: 80px; height: 80px;">
					</a></span>
				</c:otherwise>
			</c:choose>
			<span><a href="../member/colouringbook.do" class="btn-example">
					<img class="main_btn" src="../images/paint.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="../board/list.do" class="btn-example"> <img
					class="main_btn" src="../images/board.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="#" class="btn-example"> <img
					class="main_btn" src="../images/gallery.png"
					style="width: 80px; height: 80px"></a></span>
		</div>
		<div class="container">
			<section class="Collage effect-parent">
				<c:forEach var="gallery" items="${gallery}">
					<div class="Image_Wrapper">
						<a><img id="img_${gallery.no}" src="../files/${gallery.u}" style="border:1px solid #444;"></a>
					</div>
				</c:forEach>
			</section>
			<c:forEach var="gallery" items="${gallery}">
				<div class="modal fade" id="img_${gallery.no}_g_modal" tabindex="-1"
					role="dialog" aria-labelledby="myModal4" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body"></div>
							<div class="col-md-3 col-sm-3 col-xs-6" style="width: 100%">
								<div class="panel panel-info active-plan-price">
									<div id="d_title" class="panel-heading" style = "text-align:center">${gallery.writer}</div>
								</div>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- 회원 정보 팝업창 -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">${loginInfo.nickName}
            님의 정보</h4>
        </div>
        <form class="form-horizontal" action="../member/modify.do"
          method="post" enctype="multipart/form-data"
          onsubmit="return info_check();">
          <div class="modal-body" style="width: 45%; margin: 0 auto;">
            <img id="info_img" style="width: 250px; height: 250px;"
              src="../files/${loginInfo.photo}" /> <input id="info_file"
              name="file" type="file" onchange="readURL(this);">
          </div>
          <div class="info_value"
            style="width: 80%; margin: 0 auto; text-align: center;">

            <div class="form-group">
              <label for="info_id" class="col-sm-2 control-label">아이디:
              </label>
              <div class="col-sm-8">
                <input id="info_id" name="id" class="form-control"
                  value="${loginInfo.id}" size="5" readonly />
              </div>
            </div>
            <div class="form-group">
              <label for="info_name" class="col-sm-2 control-label">닉네임:
              </label>
              <div class="col-sm-8">
                <input id="info_name" name="nickName" class="form-control"
                  value="${loginInfo.nickName}" />
              </div>
            </div>
            <div class="form-group">
              <label for="info_password_after" class="col-sm-2 control-label">현재
                비밀번호: </label>
              <div class="col-sm-8">
                <input id="info_password_now" class="form-control"
                  type="password" value="" />
              </div>
            </div>
            <div class="form-group">
              <label for="info_password_after" class="col-sm-2 control-label">바꿀
                비밀번호: </label>
              <div class="col-sm-8">
                <input id="info_password_after" name="password" type="password"
                  class="form-control" value="" />
              </div>
            </div>
            <div class="form-group">
              <label for="info_password_chk" class="col-sm-2 control-label">재입력:
              </label>
              <div class="col-sm-8">
                <input id="info_password_chk" name="password_chk"
                  class="form-control" type="password" value="" />
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">변경하기</button>
            <button type="button" class="btn btn-primary"
              onClick="location.href = '../member/logout.do'">로그아웃</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
          </div>
        </form>
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
						<form class="form-horizontal" action="../member/login.do"
							method="post">
							<h1>LOGIN</h1>
							<div class="form-group">
								<div class="col-sm-12">
									<input type="text" class="form-control" id="l_id" name="id"
										placeholder="ID">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<input type="password" class="form-control" id="l_password"
										name="password" placeholder="Password">
								</div>
							</div>
							<div style="text-align: right">
								<a id="join_btn" style="cursor: pointer;">Join&gt;</a>
							</div>
							<div class="btn-r">
								<button type="submit" class="btn btn-default" id="login_submit">OK</button>
							</div>
						</form>
					</div>


				</div>
				<div class="join_layer" style="display: none;">
					<div class="pop-conts">
						<!--content //-->
						<form class="form-horizontal" action="../member/signUp.do"
							method="post" enctype="multipart/form-data"
							onsubmit="return validate();">
							<h1>JOIN</h1>
							<div style="text-align: center; padding-bottom: 5px;">
								<img id="j_img" src="http://placehold.it/150x150"
									style="width: 150px; height: 150px; border: 1px solid #444;">
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<input id="j_file" class="form-control" name="file" type="file"
										onchange="readURL_join(this);">
								</div>
							</div>
							<div class="form-group">

								<div class="col-sm-12">
									<input type="text" class="form-control" id="j_id" name="id"
										placeholder="ID">
									<div id="check_label" style="display: none;">이미 ID를
										사용중입니다.</div>
								</div>

							</div>
							<div class="form-group">

								<div class="col-sm-12">
									<input type="text" class="form-control" id="j_nickname"
										name="nickName" placeholder="nickName">
								</div>
							</div>
							<div class="form-group">

								<div class="col-sm-12">
									<input type="password" class="form-control" id="j_password"
										name="password" placeholder="Password">
								</div>
							</div>
							<div class="form-group">

								<div class="col-sm-12">
									<input type="password" class="form-control" id="j_password_chk"
										name="password_chk" placeholder="Password check">
									<div id="pwd_check_label" style="display: none;">패스워드 확인이
										다릅니다.</div>
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
</html>

