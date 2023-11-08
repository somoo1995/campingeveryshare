<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<style type="text/css">
.content {
	min-height: 300px;
}
</style>
<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">

<h3 id="pageTitle">게시글 조회</h3>
<table class="table table-bordered">
<colgroup>
	<col style="width: 15%">
	<col style="width: 35%">
	<col style="width: 15%">
	<col style="width: 35%">
</colgroup>
	<c:forEach items="${list }" var="boardtb">
	<tr>
		<th class="table-info">글 번호</th><td >${boardtb.BOARD_NO }</td>
		<th class="table-info">작성일</th>
		<td>
		<fmt:formatDate value="${boardtb.POST_DATE}" pattern="MM.dd(E)" />
		</td>
	</tr>
	<tr>
		<th class="table-info">아이디</th><td>${boardtb.USER_ID }</td>
		<th class="table-info">닉네임</th><td>${boardtb.USER_NICK }</td>
	</tr>
	<tr>
		<th class="table-info">제목</th><td>${boardtb.TITLE }</td>
		<th class="table-info">조회수</th><td>${boardtb.HIT }</td>
	</tr>
	<tr>
		<th class="table-info">첨부파일</th><td colspan="3">나중에 추가할래<%-- ${board.content } --%></td>
	</tr>
	<tr>
		<th class="table-info">내용</th><td colspan="3">${boardtb.CONTENT }</td>
	</tr>
	</c:forEach>
</table>

<div class="text-center">
	<a href="./list" class="btn btn-secondary">목록</a>
<%-- 	<c:if test="${sessionScope.isLogin }"> --%>
<%-- 	<c:if test="${recocheck }"> --%>
<!-- 	<a id="recommend" class="btn btn-secondary">추천하기</a> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${recocheck eq false }"> --%>
<!-- 	<a id="recommend" class="btn btn-secondary">추천취소</a> -->
<%-- 	</c:if> --%>
	
<%-- 	<p>추천수</p> <p id=reco>${reconum }</p> --%>
	<a href="./update?boardNo=${board.boardNo }" class="btn btn-primary">수정</a>
	<a href="./delete?boardNo=${board.boardNo }" class="btn btn-danger">삭제</a>
<%-- 	</c:if> --%>
</div>
</div>



</div><!-- .container -->

<c:import url="../layout/footer.jsp" />