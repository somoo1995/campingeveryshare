<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">



</style>

<div class="mt-5 mb-5">

<%-- ${paging.category } --%>

<c:choose>

	<c:when test="${empty hasData or not hasData }">
		<div class="wrap-result text-center mb-5">
			<strong style="color: #ccc;">검색 결과가 없습니다</strong><br>
		</div>
	</c:when>

	<c:when test="${not empty hasData and hasData }">
	<table class="table table-striped table-hover table-sm" >
	<colgroup>
		<col style="width: 10%">
		<col style="width: 40%">
		<col style="width: 20%">
		<col style="width: 10%">
		<col style="width: 10%">
		<col style="width: 20%">
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
		<td><a href="/board/view?boardNo=${board.BOARD_NO }">${board.TITLE }</a></td>
		<td>${board.WRITERNICK }</td>
		<td>${board.HIT }</td>
		<td>${board.RECOM }</td>
		<td>
		<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
<%-- 		<fmt:parseDate value="${board.POST_DATE }" var="date" pattern="yyyy-MM-dd"/> --%>
<%-- 		<fmt:formatDate value="${date }" pattern="yyyyMMdd" var="write"/> --%>
		<fmt:formatDate value="${board.POST_DATE }" pattern="yyyyMMdd" var="write"/>
		<c:choose>
			<c:when test="${write lt current }">
<%-- 				<fmt:parseDate value="${board.POST_DATE }" var="date" pattern="yyyy-MM-dd HH:mm"/> --%>
<%-- 				<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/> --%>
				<fmt:formatDate value="${board.POST_DATE }" pattern="yyyy-MM-dd"/>
			</c:when>
			<c:when test="${write eq current }">
<%-- 				<fmt:parseDate value="${board.POST_DATE }" var="date" pattern="yyyy-MM-dd HH:mm"/> --%>
<%-- 				<fmt:formatDate value="${date }" pattern="HH:mm"/> --%>
				<fmt:formatDate value="${board.WRITE_DATE }" pattern="HH:mm"/>
			</c:when>
		</c:choose>
<%-- 		<fmt:parseDate value="${board.POST_DATE }" var="date" pattern="yyyy-MM-dd HH:mm"/> --%>
<%-- 		<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm"/> --%>
		</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	</c:when>
</c:choose>

</div>

<c:import url="../layout/pagination.jsp" />