<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
table, th {
	text-align: center;
	width: 1180px;
}

/* 게시글 제목 */
td:nth-child(2) {
	text-align: left;
}

table tbody tr {
	line-height: 1.8;
}

tr:hover {background-color: #F2F2F2;} 

th {
  background-color: #2ECC71;
  color: white;
  font-weight: bold;
}

th, td {
border-bottom: 1px solid #ddd;
}

h1 {
font-weight: bold;
}

.btn {
    background-color: #2ECC71;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: bold;
    float: right;
}

.btn:hover {
    background-color: #04883C; /* 마우스 호버 시 배경 색상 변경 */
    color: white;
}

.btn:active {
    background-color: #2ECC71; /* 버튼을 클릭할 때 배경 색상 변경 */
    color: white;
}

hr {
clear: both; /* 이전 요소들과 무관하게 이어지는 요소를 지정 */

}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	border-bottom: 1px solid;
}

/* select 박스 style 설정 */
.location_select {
  width: 100%;
  padding: 5px; 
  font-size: 16px;
  border: 1px solid #A4A4A4;
  border-radius: 5px;
  -webkit-appearance: none; 
}

.container {
	width: 1200px;
}

</style>



<div class="container" >
<h1 style="color:#2ECC71">모집게시판</h1>
<h6 style="color: #A4A4A4">캠핑 모집 게시글을 작성하고 조회할 수 있습니다.</h6>

<div class="selectLocation" style="float: right; margin-bottom: 10px;">
<label id="location" style="font-weight: bold; color: #2ECC71">모집 지역</label>
<select id="location"; name="location"; class="location_select";>
	<option value="all">전체</option>
	<option value="seoul">서울</option>
	<option value="incheon">인천</option>
</select>
</div>
<hr>

<a href="./write"><button class="btn" style="margin-bottom: 10px;">글쓰기</button></a>

<hr>
<table>
	<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>닉네임</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>댓글수</th>
	</tr>
	</thead>

<colgroup>
	<col style="width: 10%;">
	<col style="width: 40%;">
	<col style="width: 15%;">
	<col style="width: 15%;">
	<col style="width: 10%;">
	<col style="width: 10%;">
</colgroup>	

	<tbody>
    <c:forEach var="board" items="${board}">
        <tr>
            <td>${board.BOARD_NO}</td>
            <td><a href="./view?boardNo=${board.BOARD_NO}">${board.TITLE}</a></td>
            <td>${board.USER_NICK }
            </td>
            <td><fmt:parseDate value="${board.POST_DATE}" var="date" pattern="yyyy-MM-dd HH:mm"/>
            <fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm"/>
            </td>
            <td>${board.HIT}</td>
            <td>댓글test</td>
        </tr>
    </c:forEach>
	</tbody>
</table>
<div ustify-content: space-between;">
<small style="float: right">total: ${paging.totalCount }</small><br>
</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/group_pagination.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
