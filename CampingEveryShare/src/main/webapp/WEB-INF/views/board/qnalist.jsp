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
#body {
	text-align: center;
}
.title > a{
	color: black;
	align-items: center; /* 수직 가운데 정렬 */
	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
	
}
</style>

<div class="container">

<div class="pageTitle">
<h3 id=pageTitle>고객 문의</h3>

<div style="text-align: right; margin-bottom: 10px;">
<a  href="/board/write?boardCate=6"><button>글쓰기</button></a>
</div>

<form action="web.dao.face.BoardDao" method="get" >

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="width : 10%">
	<col style="width : 50%">
	<col style="width : 30%">
	<col style="width : 20%">
</colgroup>

<thead class="head">
	<tr>
		<th>No.</th>
		<th>문의 내용</th>
		<th>작성일</th>
		<th>답변 상태</th>
	</tr>
</thead>
<tbody>
<c:forEach var="board" items="${qnaList }">
	<tr> 
		<td id="body">${board.RNUM }</td>
		<td>${board.TITLE }</td>
		<td id="body">
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
		<td id="body">생각중</td>
	</tr>
</c:forEach>
</tbody>
</table>
</form>


</div>
</div><!-- .container -->


<c:import url="/WEB-INF/views/layout/pagination.jsp" >
    <c:param name="url" value="./qnalist" />
</c:import>

<c:import url="../layout/footer.jsp" />