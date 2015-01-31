<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${loginInfo.nickName}</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
	 
</script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/colouringbook/tab.css">
<link rel="stylesheet" href="../css/colouringbook/colouringbook.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

<!-- FONTAWESOME STYLE CSS -->
<link href="../css/colouringbook/font-awesome.min.css" rel="stylesheet" />
<!-- CUSTOM STYLE CSS -->
<link href="../css/colouringbook/style.css" rel="stylesheet" />
<style>

</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#info_btn").click(function(){
			$('#myModal').modal();
			$('#myModal').on('shown.bs.modal', function () {
			   
			  });
		});
		$("#d_img").click(function() {
			$("input[id='d_file']").click();
		});
		$('.all_img img').on('click', function() {
			var src = $(this).attr('src');
			var img = '<img src="' + src + '" class="img-responsive"/>';
			var title = $(this).attr('id');
			
			$('#' + title + '_modal').modal();
			$('#' + title + '_modal').on('shown.bs.modal', function() {
				$('#' + title + '_modal .modal-body').html(img);
			});
			$('#' + title + '_modal').on('hidden.bs.modal', function() {
				$('#' + title + '_modal .modal-body').html('');
			});
		});
		$('.basic_img img').on('click', function() {
		      var src = $(this).attr('src');
		      var img = '<img src="' + src + '" class="img-responsive"/>';
		      var title = $(this).attr('id');
		      
		      $('#' + title + '_modal').modal();
		      $('#' + title + '_modal').on('shown.bs.modal', function() {
		        $('#' + title + '_modal .modal-body').html(img);
		      });
		      $('#' + title + '_modal').on('hidden.bs.modal', function() {
		        $('#' + title + '_modal .modal-body').html('');
		      });
		    });
		
		$('.bookmark_img img').on('click', function() {
			var src = $(this).attr('src');
			var img = '<img src="' + src + '" class="img-responsive"/>';
			var title = $(this).attr('id');

			$('#' + title + '_modal').modal();
			$('#' + title + '_modal').on('shown.bs.modal', function() {
				$('#' + title + '_modal .modal-body').html(img);
			});
			$('#' + title + '_modal').on('hidden.bs.modal', function() {
				$('#' + title + '_modal .modal-body').html('');
			});
		});
		$('.bookmark_img img').on('click', function() {
		      var src = $(this).attr('src');
		      var img = '<img src="' + src + '" class="img-responsive"/>';
		      var title = $(this).attr('id');

		      $('#' + title + '_modal').modal();
		      $('#' + title + '_modal').on('shown.bs.modal', function() {
		        $('#' + title + '_modal .modal-body').html(img);
		      });
		      $('#' + title + '_modal').on('hidden.bs.modal', function() {
		        $('#' + title + '_modal .modal-body').html('');
		      });
		    });
		$('.hot_img img').on('click', function() {
	          var src = $(this).attr('src');
	          var img = '<img src="' + src + '" class="img-responsive"/>';
	          var title = $(this).attr('id');

	          $('#' + title + '_modal').modal();
	          $('#' + title + '_modal').on('shown.bs.modal', function() {
	            $('#' + title + '_modal .modal-body').html(img);
	          });
	          $('#' + title + '_modal').on('hidden.bs.modal', function() {
	            $('#' + title + '_modal .modal-body').html('');
	          });
	        });
		$("#info_img").click(function() {
		      $("input[id='info_file']").click();
		    });
	});
	function design_readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('d_img').src = e.target.result;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function info_readURL(input) {
	    if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function(e) {
	        document.getElementById('info_img').src = e.target.result;
	      }
	      reader.readAsDataURL(input.files[0]);
	    }
	  }
	function bookmark(no) {
		location.href = '../member/bookmark.do?no=' + no;
	}
	function bmlist() {
		location.href = '../member/bmlist.do';
	}
	function bmdelete(no) {
		location.href = '../member/bmdelete.do?no=' + no;
	}
</script>
<style>
.img-responsive {
	width: 100%;
	height: 400px;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="menubar">
			<span><a href="../main.do" class="btn-example"> <img
					class="main_btn" src="../images/logo.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a id="info_btn" href="#" class="btn-example"> <img
					class="main_btn" src="../files/${loginInfo.photo}"
					style="width: 80px; height: 80px"></a></span> <span><a
				href="colouringbook.do" class="btn-example"> <img
					class="main_btn" src="../images/paint.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="../board/list.do" class="btn-example"> <img
					class="main_btn" src="../images/board.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="../member/gallerylist.do" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../images/gallery.png"
					style="width: 80px; height: 80px"></a></span>
		</div>
		<div class="container">
			<div class="contents">
				<div class="design_list">
					<div id="css_tabs" style="text-align: center;">
						<!-- 라디오 버튼 -->
						<input id="tab1" type="radio" name="tab" checked="checked" /> <input
							id="tab2" type="radio" name="tab" /> <input id="tab3"
							type="radio" name="tab" /> <input id="tab4" type="radio"
							name="tab" />

						<!-- 라벨 : 화면에 표시되는 탭 제목 -->
						<label for="tab1">ALL</label> <label for="tab2">BASIC</label> <label
							for="tab3">BOOKMARK</label> <label for="tab4">UPLOAD</label>
						<!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->
						<div class="tab1_content" style="background-color: white">

							<div class="hot_img"
								style="margin-bottom: 10px; padding: 5px 0 5px 0;">
								<span id="hot_logo"
									style="display: fixed; top: -90px; left: -230px; text-align: left;">
									<img src="../images/hot2.jpg"
									style="width: 50px; height: 50px;"> <span>HOT</span>
								</span>
								<c:forEach var="hot" items="${hot}">
									<img id="img_${hot.no}_h" src="../files/${hot.u}"
										style="width: 150px; height: 150px; padding: 4px;">
									<div class="modal fade" id="img_${hot.no}_h_modal"
										tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body"></div>
												<div class="col-md-3 col-sm-3 col-xs-6" style="width: 100%">
													<div class="panel panel-info active-plan-price">
														<div id="d_title" class="panel-heading">${hot.title}</div>
														<div class="panel-body">
															<div class="round-body">
																<div class="price-main">
																	<span> ${hot.count}</span><br> <small>BOOKMARK</small>
																</div>
															</div>
															<a href="#" class="btn btn-info btn-lg btn-block"
																onclick="bookmark(${hot.no})">즐겨찾기추가</a>
																<form method="post" action="../shared/paint2.do?no=${hot.no}">
	                                <button type=submit
	                                  class="btn btn-info btn-lg btn-block">선택</button>
	                              </form>
														</div>
													</div>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
								</c:forEach>
							</div>
							<div class="all_img" style="width: 100%; height:500px; overflow:auto; margin: 0 auto;">
								<c:forEach var="shared" items="${list}">
										<img id="img_${shared.no}" src="../files/${shared.u}"
											style="width: 150px; height: 150px; padding: 4px;">
									<div class="modal fade" id="img_${shared.no}_modal"
										tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body"></div>
												<div class="col-md-3 col-sm-3 col-xs-6" style="width: 100%">
													<div class="panel panel-info active-plan-price">
														<div id="d_title" class="panel-heading">${shared.title}</div>
														<div class="panel-body">
															<div class="round-body">
																<div class="price-main">
																	<span> ${shared.count}</span><br> <small>BOOKMARK</small>
																</div>
															</div>
															<a href="#" class="btn btn-info btn-lg btn-block"
																onclick="bookmark(${shared.no})">즐겨찾기추가</a> 
																<form method="post" action="../shared/paint2.do?no=${shared.no}">
                                  <button type=submit
                                    class="btn btn-info btn-lg btn-block">선택</button>
                                </form>

														</div>
													</div>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
								</c:forEach>
							</div>
						</div>
						<div class="tab2_content">
							<div class="basic_img" style="width: 100%; height:8
							00px; overflow:auto; margin: 0 auto;">
								<c:forEach var="admin" items="${admin}">
									<img id="img_${admin.no}_a" src="../files/${admin.u}"
										style="width: 150px; height: 150px; padding: 4px;">
									<div class="modal fade" id="img_${admin.no}_a_modal"
										tabindex="-1" role="dialog" aria-labelledby="myModal2"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body"></div>
												<div class="col-md-3 col-sm-3 col-xs-6" style="width: 100%">
													<div class="panel panel-info active-plan-price">
														<div id="d_title" class="panel-heading">${admin.title}</div>
														<div class="panel-body">
															<form method="post" action="../shared/paint.do?no=${admin.no}">
                                <button type=submit
                                  class="btn btn-info btn-lg btn-block">선택</button>
                              </form>
														</div>
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
						<div class="tab3_content">
							<div class="bookmark_img" style="width: 100%; height:600px; overflow:auto; margin: 0 auto;">
								<c:forEach var="bookmark" items="${bookmark}">
									<img id="img_${bookmark.no}_b" src="../files/${bookmark.u}"
										style="width: 150px; height: 150px; padding: 4px;">
									<div class="modal fade" id="img_${bookmark.no}_b_modal"
										tabindex="-1" role="dialog" aria-labelledby="myModal3"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body"></div>
												<div class="col-md-3 col-sm-3 col-xs-6" style="width: 100%">
													<div class="panel panel-info active-plan-price">
														<div id="d_title" class="panel-heading">${bookmark.title}</div>
														<div class="panel-body">

															<a href="#" class="btn btn-info btn-lg btn-block"
																id="d_btn" onclick="bmdelete(${bookmark.no})">즐겨찾기삭제</a>
															<form method="post" action="../shared/paint2.do?no=${bookmark.no}">
                                  <button type=submit
                                    class="btn btn-info btn-lg btn-block">선택</button>
                                </form>
														</div>
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
						<div class="tab4_content">
							<div class="design_upload">
								<form class="form-horizontalaction" action="../shared/add.do"
									method="post" enctype="multipart/form-data">
									<div class="form-group" id="d_input_title">
										<label for="id" class="col-sm-2 control-label"
											style="text-align: right; padding-top: 7px;">Title</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="d_title"
												name="title" placeholder="title">
										</div>
									</div>
									<div class="form-group" id="d_input_img">
										<img id="d_img" style="width: 400px; height: 400px;"
											src="http://placehold.it/400x400&text=IMG" /> <input
											id="d_file" name="file" type="file"
											onchange="design_readURL(this);">
									</div>
									<div class="d_btn">
										<button type="submit" class="btn btn-default">등록</button>
										<button type="button" class="btn btn-default">취소</button>
									</div>
								</form>
							</div>
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
								name="file" type="file" onchange="info_readURL(this);">
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
								onClick="location.href = '../member/logout_design.do'">로그아웃</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">나가기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>