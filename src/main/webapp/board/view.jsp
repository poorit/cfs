<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>게시물 상세보기</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/main/login.css">
<link rel="stylesheet" href="../css/board/board.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/board/jasny-bootstrap.min.css">
<link rel="stylesheet" href="../css/common.css">
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/board/jasny-bootstrap.min.js"></script>
<style>
.main_btn {
	border-radius: 60px;
	-moz-border-radius: 60px;
	-webkit-border-radius: 60px;
	border: 3px solid #444444;
}

.board_view {
	width: 800px;
	margin: 0 auto;
}

#info_file {
	display: none;
}

#info_img {
	cursor: pointer;
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
});
function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('info_img').src = e.target.result;
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
</script>
</head>

<body>
	<div class="wrap">
		<div class="menubar">
			<span><a href="../main.jsp" class="btn-example"> <img
					class="main_btn" src="../images/logo.png"
					style="width: 80px; height: 80px">
			</a></span>
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
			</a></span> <span><a href="#" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../images/gallery.png"
					style="width: 80px; height: 80px"></a></span>
		</div>

		<div class="container">
			<div class="board_view">
				<div class="col-lg-12 text-center">
					<h2 style="text-align: center">게시물 상세보기</h2>
					<hr class="star-primary">
				</div>
				<c:choose>
					<c:when test="${board != null}">
						<table class="table table-striped table-hover" width=100%
							height=500px>
							<tbody data-link="row" class="rowlink">
								<form class="form-horizontal" action='update.do' method='post'>
									<tr style="height: 35px">
										<td
											style="cursor: default; text-align: center; padding-top: 16px; font-size: 15px; width: 150px; font-weight: bold;">제목</td>
										<td><input id="title" class="form-control" name='title'
											type='text' readonly value='${board.title}'
											style="background-color: white"></td>
									</tr>

									<tr>
										<td
											style="cursor: default; text-align: center; padding-top: 16px; font-size: 15px; font-weight: bold;">내용</td>
										<td><textarea class="form-control"
												style="height: 100%; resize: none; background-color: white"
												name="contents" readonly>${board.contents}</textarea></td>
									</tr>

									<tr class="form-group" style="height: 35px">
										<td colspan="2"
											style="text-align: right; visibility: collapse"><c:if
												test="${board.writer == loginInfo.nickName}">
												<button style="visibility: visible" type='button'
													class="btn btn-default" onclick='onUpdatePage(${board.no})'>변경</button>
												<button style="visibility: visible" type='button'
													class="btn btn-default" onclick='onDelete(${board.no})'>삭제</button>
												<button style="visibility: visible" type='button'
													class="btn btn-default" onclick="onList()">목록</button>
											</c:if></td>
									</tr>
								</form>
							</tbody>
						</table>
						<table class="table table-striped table-hover" width=100%>
							<tbody data-link="row" class="rowlink">
								<c:forEach var="comment" items="${list}">
									<c:if test="${comment.b_no == board.no}">
										<tr>
											<td
												style="cursor: default; width: 150px; text-align: center; font-weight: bold">${comment.writer }</td>
											<td style="padding-left: 20px">${comment.contents}</td>
											<td style="text-align: center;"><c:if
													test="${comment.writer == loginInfo.nickName}">
													<form action='delcom.do?no=${comment.no}' method='post'>
														<input style="display: none;" id="b_no" name='b_no'
															type='text' value="${comment.b_no}"></input>
														<button type='submit'>X</button>
													</form>
												</c:if></td>
										</tr>
									</c:if>
								</c:forEach>
								<form class="form-horizontal"
									action='addComment.do?no=${board.no}' method='post'
									onsubmit="return checkAddComment();">
									<tr>
										<td
											style="cursor: default; text-align: center; font-weight: bold; padding-top: 17px">${loginInfo.nickName}<!-- 로그인하면 아이디값대입 지금은 임시로 board작성자 값 대입--></td>
										<td><input id="contents" class="form-control"
											name="contents" type="text"></td>
										<td style="width: 25px;">
											<button type='submit' class="btn btn-primary">등록</button>
										</td>
									</tr>
								</form>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p>존재하지 않는 게시물입니다.</p>
					</c:otherwise>
				</c:choose>
			</div>
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
							<div class="form-group">
								<label for="file" class="col-sm-2 control-label">IMAGE</label>
								<div class="col-sm-10">
									<input id="j_file" class="form-control" name="file" type="file">
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
									<input type="password" class="form-control" id="j_password_chk"
										name="password_chk" placeholder="Password check">
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
<script>
   function onDelete(no){
      location.href='delete.do?no='+no;
   }
   function onList(){
       location.href='list.do';
   }
   function onUpdatePage(no){
         location.href='goToUpdate.do?no='+no;
   }
   function delcom(no)
   {
     location.href='delcom.do?no='+no;
   }
   
   var checkComments = false;
   function checkAddComment() {

     if ($("#contents").val() == "") {
       alert("댓글 내용을 입력해 주십시오");
       checkComments = false;
     } else
    	 checkComments = true;

     return checkComments;
   }
</script>
