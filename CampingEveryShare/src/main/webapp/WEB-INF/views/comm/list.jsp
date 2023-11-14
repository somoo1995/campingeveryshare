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
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${getCommList }" var="commList">
	<tr data-commentNo="${commList.COMM_NO }">
		<td>${commList.USER_NICK }</td>
		<td class="text-start">${commList.CONTENT }</td>
		<td><fmt:formatDate value="${commList.POST_NAME}" pattern="yy-MM-dd" /></td>
		<td>
			<c:if test="${sessionScope.loginId eq commList.USER_ID }">
			<button class="btn btn-warning btn-xs" onclick="deleteComment(${commList.COMM_NO });">삭제</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</tbody>
	</table><!-- 댓글 리스트 end -->



</div><!-- .container -->

<c:import url="../layout/footer.jsp" />