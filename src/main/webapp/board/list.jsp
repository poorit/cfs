<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>게시물 목록</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/board/board.css">
<link rel="stylesheet" href="../css/main/login.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/board/jasny-bootstrap.min.css">
<link rel="stylesheet" href="../css/common.css">
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/board/jasny-bootstrap.min.js"></script>

<style type="text/css">
.main_btn {
	border-radius: 60px;
	-moz-border-radius: 60px;
	-webkit-border-radius: 60px;
	border: 3px solid #444444;
}

.board_list {
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
</head>

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
<body>
	<div class="wrap">
		<div class="menubar">
			<span><a href="../main.jsp" class="btn-example"> <img
					class="main_btn" src="../images/logo.png"
					style="width: 80px; height: 80px"> <c:choose>
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
					</c:choose> <span><a href="../member/colouringbook.do"
						class="btn-example"> <img class="main_btn"
							src="../images/paint.png" style="width: 80px; height: 80px">
					</a></span> <span><a href="../board/list.do" class="btn-example"> <img
							class="main_btn" src="../images/board.png"
							style="width: 80px; height: 80px">
					</a></span> <span><a href="#" class="btn-example"
						onclick="layer_open('layer2');return false;"> <img
							class="main_btn" src="../images/gallery.png"
							style="width: 80px; height: 80px"></a></span>
		</div>
		<div class="container">
			<div class="board_list">
				<div class="col-lg-12 text-center">
					<h2 style="text-align: center">BOARD</h2>
					<hr class="star-primary">
				</div>
				<table class="table table-striped table-hover">
					<thead class="">
						<tr class="border-radius border-color">
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody data-link="row" class="rowlink">
						<c:forEach var="board" items="${list}">
							<tr onclick="onView(${board.no});">
								<td>${board.no }</td>
								<td><a href='view.do?no=${board.no}'>${board.title}</td>
								<td>${board.writer }</td>
								<td>${board.count }</td>
								<td>${board.createDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<button class="btn btn-success" onclick="onList()">
						<span class="glyphicon glyphicon-edit"></span>글쓰기
					</button>
					<button class="btn btn-success" onclick="onMain()">
						<span class="glyphicon glyphicon-new-window"></span>메인으로
					</button>
					<div style="text-align: center; padding-top: 10px;">
						<form action="search.do" method="post">
							<select name="criteria">
								<option value="제목">제목</option>
								<option value="작성자">작성자</option>
								<option value="내용">내용</option>

							</select> <input type="text" name="searchValue" size="50">
							<button>검색</button>
						</form>
					</div>
				</div>
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
	   function onView(no) {
	          location.href = 'view.do?no='+no;
	        }
		function onList() {
			 location.href = 'form.html';
		}
		function onMain() {
			location.href = '../main.jsp';
		}
	</script>
</body>
</html>
