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

<style>
.main_btn {
	border-radius: 60px;
	-moz-border-radius: 60px;
	-webkit-border-radius: 60px;
	border: 3px dotted;
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
.design_upload #d_input_title input[type=text]{
  width:80%;
}
.design_upload #d_input_img {
	align: center;
	width: 60%;
	height: 100%;
	margin: 0 auto;

}

#d_img {
  border:2px dotted tomato;
	cursor: pointer;
	width: 500px;
	height: 500px;
	margin: 0 auto;
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
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#d_img").click(function() {
			$("input[id='d_file']").click();
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
</script>
</head>
<body>
	<div class="wrap">
		<div class="menubar">
			<span><a href="#" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../files/${loginInfo.photo}"
					style="width: 80px; height: 80px"></a></span> <span><a href="#"
				class="btn-example" onclick="layer_open('layer2');return false;">
					<img class="main_btn" src="../images/temp.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="#" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../images/temp.png"
					style="width: 80px; height: 80px"></a></span> <span><a href="#"
				class="btn-example" onclick="layer_open('layer2');return false;">
					<img class="main_btn" src="../images/temp.png"
					style="width: 80px; height: 80px">
			</a></span> <span><a href="#" class="btn-example"
				onclick="layer_open('layer2');return false;"> <img
					class="main_btn" src="../images/temp.png"
					style="width: 80px; height: 80px"></a></span>
		</div>
		<div class="container">
			<div class="contents">
				<div class="design_list">
					<div id="css_tabs">
						<!-- 라디오 버튼 -->
						<input id="tab1" type="radio" name="tab" checked="checked" /> <input
							id="tab2" type="radio" name="tab" /> <input id="tab3"
							type="radio" name="tab" /> <input id="tab4" type="radio"
							name="tab" />

						<!-- 라벨 : 화면에 표시되는 탭 제목 -->
						<label for="tab1">ALL</label> <label for="tab2">BASIC</label> <label
							for="tab3">BOOKMARK</label> <label for="tab4">UPLOAD</label>

						<!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->
						<div class="tab1_content">
						
						<c:forEach var="shared" items="${list}">

							<span><img src="../files/${shared.u}" style = "width:250px;height:250px;" alt = "${shared.title}"></span>
							<!-- <span><img src="http://placehold.it/250x250&text=IMG"></span>
							<span><img src="http://placehold.it/250x250&text=IMG"></span>
							 -->
						</c:forEach>
						</div>
						<div class="tab2_content">짱짱</div>
						<div class="tab3_content">ktds</div>
						<div class="tab4_content">
							<div class="design_upload">
								<form class="form-horizontalaction" action="shared/add.do"
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
										<img id="d_img" src="http://placehold.it/500x500&text=IMG" />
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