<<<<<<< HEAD
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id=pageTitle>캠핑존 공유 게시판</h3>

<form action="web.dao.face.ShareDao" method="get" >

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="15%">
	<col style="20%">
	<col style="30%">
	<col style="10%">
	<col style="10%">
	<col style="15%">
</colgroup>

<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>추천수</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach var="boardtb" items="${list }">
	<tr>
		<td>${boardtb.BOARD_NO }</td>
		<td><a href="./view?boardNo=${boardtb.BOARD_NO }">${boardtb.TITLE }</a></td>
		<td>${boardtb.USER_ID }</td>
		<td>${boardtb.HIT }</td>
		<td>${boardtb.recommend }</td>
		<td>
			<fmt:formatDate value="${boardtb.POST_DATE}" pattern="MM.dd(E)" />
		</td>
	</tr>
</c:forEach>
</tbody>
</table>
</form>

<a href="/share/write"><button>글쓰기</button></a>




</div><!-- .container -->

=======
<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id=pageTitle>캠핑존 공유 게시판</h3>
<form action="web.dao.face.ShareDao" method="get" >

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="width : 15%">
	<col style="width : 20%">
	<col style="width : 30%">
	<col style="width : 10%">
	<col style="width : 10%">
	<col style="width : 15%">
</colgroup>

<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>추천수</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach var="board" items="${list }">
	<tr> 
		<td>${board.BOARD_NO }</td>
		<td><a href="./view?boardNo=${board.BOARD_NO }">${board.TITLE }</a></td>
		<td>${board.USER_NICK }</td>
		<td>${board.HIT }</td>
		<td>${board.RECOM }</td>
		<td>
      <fmt:parseDate value="${board.POST_DATE }" var="date" pattern="yyyy-MM-dd HH:mm"/>
      <fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm"/>
         </td>    
	</tr>
</c:forEach>
</tbody>
</table>
</form>
<a  href="/share/write?boardCate=${board.boardCate }"><button>글쓰기</button></a>





</div><!-- .container -->

>>>>>>> refs/remotes/origin/master
<c:import url="../layout/footer.jsp" />