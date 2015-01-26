<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>검색 결과</title>
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
        <c:forEach var="board" items="${titlelist}">
          <tr onclick="onView(${board.no});">
            <td>${board.no }</td>
            <td><a href='view.do?no=${board.no}'>${board.title}</td>
            <td>${board.writer }</td>
            <td>${board.count }</td>
            <td>${board.createDate}</td>
          </tr>
        </c:forEach>
        <c:forEach var="board" items="${writerlist}">
          <tr onclick="onView(${board.no});">
            <td>${board.no }</td>
            <td><a href='view.do?no=${board.no}'>${board.title}</td>
            <td>${board.writer }</td>
            <td>${board.count }</td>
            <td>${board.createDate}</td>
          </tr>
        </c:forEach>
        <c:forEach var="board" items="${contentslist}">
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
      <button class="btn btn-success" onclick="onMain()">
        <span class="glyphicon glyphicon-new-window"></span>목록으로
      </button>
    </div>
  </div>


  <script>
    function onMain() {
      location.href = 'list.do';
    }
    function onView(no) {
        location.href = 'view.do?no='+no;
    }
  </script>
</body>
</html>
