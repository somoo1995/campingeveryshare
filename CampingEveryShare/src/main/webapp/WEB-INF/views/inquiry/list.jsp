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
<h3 id=pageTitle>고객문의</h3>

<div style="text-align: right; margin-bottom: 10px;">
<a  href="/inquiry/write?boardCate=6"><button class="btn btn-primary">글쓰기</button></a>
</div>

<form action="web.dao.face.InquiryDao" method="get" >

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="width : 15%">
	<col style="width : 40%">
	<col style="width : 15%">
	<col style="width : 15%">
	<col style="width : 15%">
</colgroup>

<thead class="head">
	<tr style="font-size: 17px; font-weight: bold;">
		<th>글 유형</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
</thead>
<tbody>
<c:forEach var="board" items="${list }">
	<tr> 
		<td style="text-align: center;">
		<div style="font-weight: bold; font-size: 17px;">[${board.LOCATION_NAME}]</div>
		</td>
		<td class="title">
	<c:choose>
	   
	    <c:when test="${ isAdmin }">
	        <a href="./view?boardNo=${board.BOARD_NO}" style="text-decoration: none;">
	            <div>${board.TITLE}</div>
            </a>
	    </c:when>
	    
	     <c:when test="${empty loginId or (loginId ne board.USER_ID)}">
	        <div style="color: #767676;"><c:if test="${board.LOCATION eq 0 }"> 🔒비공개 글 입니다.</c:if></div>
	        <div style="color: #767676;"><c:if test="${board.LOCATION eq 18 }"> 🔒로그인 후 이용 가능합니다.</c:if></div>
	    </c:when>
	    
	    <c:otherwise>
	        <a href="./view?boardNo=${board.BOARD_NO}" style="text-decoration: none;">
	            <div>${board.TITLE}</div>
			</a>
	    </c:otherwise>
	</c:choose>
		</td>
		<td style="text-align: center;">${board.USER_NICK }</td>
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