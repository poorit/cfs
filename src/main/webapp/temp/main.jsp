<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginInfo.nickName}님 환영합니다!!</title>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<div>
<c:choose>
  <c:when test="${empty loginInfo}">
    <a href="/CFS/member/login.html">로그인</a>
  </c:when>
  <c:otherwise>
<img style="width:50px; height:50px;" src="../files/${loginInfo.photo}">
${loginInfo.nickName}(${loginInfo.id})
<a href="/CFS/member/logout.do">로그아웃</a><br>
</c:otherwise>
</c:choose>
</div>


<h1>공유 도안 목록</h1>
<table>
<tr><th>번호</th>
<th>제목</th>
<th>도안</th>
<th>작성자</th>
<th>즐겨찾기 수</th>
<th>등록일</th>
</tr>
<c:forEach var="shared" items="${list}">

 <tr>
<td>${shared.no}</td>
 <td>${shared.title}</td>
 <td><img style="width:50px; height:50px;" src="../files/${shared.u}"></td>
 <td>${shared.writer}</td>
 <td>${shared.count }</td>
 <td>${shared.createDate }<button type="button" onclick="bookmark(${shared.no})">즐겨찾기에 추가</button><br></td>
 </tr>
</c:forEach>
</table>
<a href='/CFS/shared/designadd.html'>글쓰기</a><br>
<br><br><br>

<button type="button" onclick="bmlist()" id = "b_btn">즐겨찾기 목록 보기</button>


<h1>즐겨찾는 도안 목록</h1>
<table>
<tr>
<th>번호</th>
<th>제목</th>
<th>도안</th>
<th>작성자</th>
<th>즐겨찾기 수</th>
<th>등록일</th>
</tr>

<c:forEach var="shared" items="${bmlist}">

 <tr>
<td>${shared.no}</td>
 <td>${shared.title}</td>
 <td><img style="width:50px; height:50px;" src="../files/${shared.u}"></td>
 <td>${shared.writer}</td>
 <td>${shared.count }</td>
 <td>${shared.createDate }<button type="button" onclick="bmdelete(${shared.no})">즐겨찾기목록에서 삭제</button><br></td>
 </tr>
</c:forEach>
</table>
</body>
<script>
function bookmark(no)
{
	location.href='bookmark.do?no=' + no;
}
function bmlist()
{
	location.href='bmlist.do';
}
function bmdelete(no)
{
	location.href='bmdelete.do?no=' + no;
}
</script>
</html>