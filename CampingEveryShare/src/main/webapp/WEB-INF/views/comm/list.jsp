<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
</div>
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed text-center">
	<colgroup>
		<col style="width: 15%;">
		<col style="width: 55%;">
		<col style="width: 20%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
	<tr>
		<th>작성자</th>
		<th>댓글</th>
		<th>작성일</th>
		<th></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${commList }" var="comm">
	<tr data-commentNo="${comm.commNo }">
		<td>${user.userNick }</td>
		<td class="text-start">${comm.content }</td>
		<td><fmt:formatDate value="${comm.postDate }" pattern="yy-MM-dd" /></td>
		<td>
			<c:if test="${sessionScope.userId eq comm.userId }">
			<button class="btn btn-warning btn-xs" onclick="deleteComment(${comm.commNo });">삭제</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</tbody>
	</table><!-- 댓글 리스트 end -->



</div><!-- .container -->

<c:import url="../layout/footer.jsp" />