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
.main_btn {
	border-radius: 60px;
	-moz-border-radius: 60px;
	-webkit-border-radius: 60px;
	border: 2px solid #444444;
}

.design_upload {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

.design_upload #d_input_title {
	width: 65%;
	height: 50px;
	margin: 0 auto;
}

.design_upload #d_input_title input[type=text] {
	width: 80%;
}

.design_upload #d_input_img {
	align: center;
	width: 60%;
	height: 100%;
	margin: 0 auto;
}

#d_img {
	border: 2px dotted tomato;
	cursor: pointer;
	margin: 0 auto;
	cursor: pointer;
}

#d_file {
	display: none;
}

.d_btn {
	padding-top: 20px;
	width: 100%;
	text-align: center;
	margin: 0 auto;
}

.design_list {
	width: 100%;
	margin: 0 auto;
}

.tab3_content, .tab1_content img {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
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
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('d_img').src = e.target.result;
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
</head>
<body>
	<div class="wrap">
		<div class="menubar">
			<span><a href="../main.jsp" class="btn-example"> <img
					class="main_btn" src="../images/logo.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="#" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../files/${loginInfo.photo}"
					style="width: 80px; height: 80px"></a></span> <span><a href="#"
				class="btn-example" onclick="layer_open('layer2');return false;">
					<img class="main_btn" src="../images/logo.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="#" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../images/logo.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="#" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../images/logo.png"
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
							<div class="all_img" style="width: 100%; margin: 0 auto;">
								<c:forEach var="shared" items="${list}">
									<img id="img_${shared.no}" src="../files/${shared.u}"
										style="width: 250px; height: 250px; padding: 4px;">
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
																	<span> ${shared.count }</span></br> <small>BOOKMARK</small>
																</div>
															</div>
															<a href="#" class="btn btn-info btn-lg btn-block"
																onclick="bookmark(${shared.no})">즐겨찾기추가</a> <a href="#"
																class="btn btn-info btn-lg btn-block">선택</a>
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
						<div class="tab2_content"><!-- BASIC 도안 출력부분 --></div>
						<div class="tab3_content">
							<div class="bookmark_img" style="width: 100%; margin: 0 auto;">
								<c:forEach var="bookmark" items="${bookmark}">
									<img id = "img_${bookmark.no}_b" src="../files/${bookmark.u}"
										style="width: 250px; height: 250px; padding: 4px;">
									<div class="modal fade" id="img_${bookmark.no}_b_modal" tabindex="-1"
										role="dialog" aria-labelledby="myModal2"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body"></div>
												<div class="col-md-3 col-sm-3 col-xs-6" style="width: 100%">
													<div class="panel panel-info active-plan-price">
														<div id="d_title" class="panel-heading">${bookmark.title}</div>
														<div class="panel-body">
															
															<a href="#" class="btn btn-info btn-lg btn-block"
																onclick="bmdelete(${bookmark.no})">즐겨찾기삭제</a> <a href="../mycanvas.html"
																class="btn btn-info btn-lg btn-block">선택</a>
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
										<img id="d_img" style = "width:400px; height:400px;"src="http://placehold.it/400x400&text=IMG" />
										<input id="d_file" name="file" type="file"
											onchange="readURL(this)"; >
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

	</div>
</body>
</html>