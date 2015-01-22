<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ColouringBook</title>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" >
</script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/common.css">
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

.wrap {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	background-color: #ebfbff;
}

.container {
	float: left;
	width:70%;
	height: 100%;
	margin: 0 auto;
}

.menubar {
  display:fixed;
  left:40px;
  margin:0 auto;
}
.menubar span{
  width:50px;
  float:left;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="menubar">
				<span><a href="#" class="btn-example"
					onclick="layer_open('layer2');return false;"> <img
						src="./images/temp.png" style="width: 80px; height: 80px"></a></span> <span><a
					href="#" class="btn-example"
					onclick="layer_open('layer2');return false;"> <img
						src="./images/temp.png" style="width: 80px; height: 80px"></a></span> <span><a
					href="#" class="btn-example"
					onclick="layer_open('layer2');return false;"> <img
						src="./images/temp.png" style="width: 80px; height: 80px"></a></span> <span><a
					href="#" class="btn-example"
					onclick="layer_open('layer2');return false;"> <img
						src="./images/temp.png" style="width: 80px; height: 80px"></a></span>
			</div>
		</div>
	</div>
</body>
</html>