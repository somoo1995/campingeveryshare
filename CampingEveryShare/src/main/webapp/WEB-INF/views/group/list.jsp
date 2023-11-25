<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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


<form action="web.dao.face.GroupDao" method="get" >

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="width : 7%">
	<col style="width : 10%">
	<col style="width : 41%">
	<col style="width : 15%">
	<col style="width : 10%">
	<col style="width : 10%">
	<col style="width : 7%">
</colgroup>

<thead class="head">
	<tr>
		<th>번호</th>
		<th>모집 현황</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
		<th>추천수</th>
	</tr>
</thead>
<tbody>
<c:forEach var="board" items="${list }">
	<tr> 
		<td style="text-align: center;">${board.BOARD_NO }</td>
		<td style="text-align: center;">
		<c:choose>
			<c:when test="${board.RECRUIT_STATUS eq 0}">
				<div style="color: #4AB34A;">[모집중]</div>
			</c:when>
			<c:when test="${board.RECRUIT_STATUS eq 1}">
				<div style="color: #FF6A89; text-decoration: line-through;">[모집 완료]</div>
			</c:when>
		</c:choose>	
		</td>
		<td class="title">
		<a href="./view?boardNo=${board.BOARD_NO }" style="text-decoration: none; ">
		<div style="font-weight: bold; font-size: 17px; margin-right: 13px;">[${board.LOCATION_NAME}]</div>
		<div>${board.TITLE }</div>
		</div>
		</a>
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
		<td style="text-align: center;">${board.RECOM }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</form>

