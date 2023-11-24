<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

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


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id=pageTitle>공지 게시판</h3>

<div style="text-align: right; margin-bottom: 10px;">
<c:choose>
    <c:when test="${empty adminCode or adminCode ne admin.adminCode}">
        <!-- adminCode가 비어 있거나 adminCode와 admin.adminCode가 일치하지 않을 때는 버튼을 표시하지 않음 -->
    </c:when>
    <c:otherwise>
        <!-- adminCode가 존재하고 adminCode와 admin.adminCode가 일치하는 경우에만 버튼을 표시 -->
        <a href="/notice/write?boardCate=5"><button>글쓰기</button></a>
    </c:otherwise>
</c:choose>


<form action="web.dao.face.GroupDao" method="get" >

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="width : 10%">
	<col style="width : 57%">
	<col style="width : 10%">
	<col style="width : 11%">
	<col style="width : 12%">
</colgroup>

<thead class="head">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
</thead>
<tbody>
<c:forEach var="board" items="${list }">
	<tr> 
		<td style="text-align: center; font-weight: bold; font-size: 17px; margin-right: 13px;">[공지]</td>
		<td class="title">
		<a href="./view?boardNo=${board.BOARD_NO }" style="text-decoration: none; ">
		<div>${board.TITLE }</div>
		</a>
		</td>
		<td style="text-align: center;">${board.USER_ID }</td>
		<td style="text-align: center;">${board.HIT }</td>
		<td style="text-align: center;">
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
<c:import url="../layout/pagination.jsp" />
<c:import url="../layout/footer.jsp" />