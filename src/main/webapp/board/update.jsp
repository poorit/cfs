<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<script
  src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="../css/common.css">
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<script src="../js/bootstrap.min.js"></script>
<script src="../js/jasny-bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-lg-12 text-center">
			<h2 style="text-align: center">게시물 수정</h2>
			<hr class="star-primary">
		</div>
		<table class="table table-striped table-hover" width=100% height=500px>
			<tbody data-link="row" class="rowlink">
				<form action="update.do?no=${board.no}" method="post"
					onsubmit="return checkaddupdate();">
					<tr style="height: 35px">
						<td
							style="text-align: center; padding-top: 16px; font-size: 15px; width: 150px; font-weight: bold;">제목</td>
						<td><input id="title" class="form-control" name='title'
							type='text' value='${board.title}'></td>
					</tr>
				<tr>
					<td
						style="text-align: center; padding-top: 16px; font-size: 15px; width: 150px; font-weight: bold;">내용</td>
					<td><textarea class="form-control" id = "contents"
							style="height: 100%; resize: none" name="contents">${board.contents}</textarea></td>
				</tr>
				<tr style="height: 35px">
					<td colspan="2" style="text-align: center;"><button
							class="btn btn-success" type="submit">수정완료</button> <a
						href='list.do'><button class="btn btn-success" type="button">취소</button></a></td>
				</tr>
				</form>
			</tbody>
		</table>
	</div>
</body>
</html>
<script>
	var checkTitle = false;
	function checkaddupdate() {
		if ($("#title").val() == "") {
			alert("제목을 입력해 주십시오.");
			checkTitle = false;
		} else
			checkTitle = true;
	

		return checkTitle;
	}
</script>