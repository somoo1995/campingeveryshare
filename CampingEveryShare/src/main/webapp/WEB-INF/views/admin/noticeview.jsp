
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>

<c:import url="../layout/adminheader.jsp" />

<style>
.head, .body {
	text-align: center;
}


</style>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 공지사항</h3>

<table class="table table-bordered">
<colgroup>
	<col style="width: 15%">
	<col style="width: 35%">
	<col style="width: 15%">
	<col style="width: 35%">
</colgroup>
	<tr>
		<th class="table-info">작성자</th>
		<td>${board.userId }</td>
		<th class="table-info">조회수</th><td>${board.hit }</td>
	</tr>
	<tr>
		<th class="table-info">제목</th><td>${board.title }</td>
		<th class="table-info">작성일</th>
		<td>
			<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
			<fmt:formatDate value="${board.postDate }" pattern="yyyyMMdd" var="write"/>
			<c:choose>
				<c:when test="${write lt current }">
					<fmt:formatDate value="${board.postDate }" pattern="yyyy-MM-dd"/>
				</c:when>
				<c:when test="${write eq current }">
					<fmt:formatDate value="${board.postDate }" pattern="HH:mm"/>
				</c:when>
			</c:choose>
        </td>
	</tr>
	<tr>
		<th class="table-info">내용</th><td colspan="3">${board.content }</td>
	</tr>
</table> 


<div class="text-center">
	<a href="/admin/noticelist" class="btn btn-secondary">목록</a>
<div>
</div>
	<c:choose>
	    <c:when test="${empty adminCode or adminCode ne admin.adminCode}">
	        <!-- adminCode가 비어 있거나 adminCode와 admin.adminCode가 일치하지 않을 때는 버튼을 표시하지 않음 -->
	    </c:when>
	    <c:otherwise>
	        <!-- adminCode가 존재하고 adminCode와 admin.adminCode가 일치하는 경우에만 버튼을 표시 -->
		<a href="/admin/update?boardNo=${board.boardNo }" class="btn btn-primary">수정</a>
		<a href="/admin/delete?boardNo=${board.boardNo }" class="btn btn-danger">삭제</a>    </c:otherwise>
	</c:choose>
</div>

</div>


</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" >
    <c:param name="url" value="/admin/noticeview" />
</c:import>

<c:import url="../layout/footer.jsp" />