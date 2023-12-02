<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style type="text/css">
.head {
	text-align: center;
}

.title > a{
	color: black;
	align-items: center; /* 수직 가운데 정렬 */
	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
	
}
</style>

<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 고객문의 관리</h3>

<form action="web.dao.face.BoardDao" method="get" >

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="width : 15%">
	<col style="width : 20%">
	<col style="width : 25%">
	<col style="width : 20%">
	<col style="width : 20%">
</colgroup>

<thead class="head">
	<tr>
		<th>No.</th>
		<th>게시판</th>
		<th>문의 내용</th>
		<th>회원 ID</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach var="board" items="${qnaList }">
	<tr> 
		<td>${board.RNUM }</td>
		<c:choose>
		<c:when test="${board.BOARD_CATE == 1 }">
			<td id="table_body">대여</td>
		</c:when>
		<c:when test="${board.BOARD_CATE == 2 }">
			<td id="table_body">캠핑존</td>
		</c:when>
		<c:when test="${board.BOARD_CATE == 3 }">
			<td id="table_body">중고장터</td>
		</c:when>
		<c:when test="${board.BOARD_CATE == 4 }">
			<td id="table_body">모집</td>
		</c:when>
		</c:choose>
		<td>${board.TITLE }</td>
		<td>${board.USER_ID }</td>
		<td>
	      <fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
	      <fmt:formatDate value="${board.POST_DATE }" pattern="yyyyMMdd" var="write"/>
	      <c:choose>
	         <c:when test="${write lt current }">
	            <fmt:formatDate value="${board.POST_DATE }" pattern="yyyy-MM-dd"/>
	         </c:when>
	         <c:when test="${write eq current }">
	            <fmt:formatDate value="${board.POST_DATE }" pattern="HH:mm"/>
	         </c:when>
	      </c:choose>   
         </td>    
	</tr>
</c:forEach>
</tbody>
</table>
</form>


</div><!-- .container -->


<c:import url="/WEB-INF/views/layout/pagination.jsp" >
    <c:param name="url" value="./qnalist" />
</c:import>

<c:import url="../layout/footer.jsp" />