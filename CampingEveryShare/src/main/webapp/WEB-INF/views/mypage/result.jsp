<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.row {
    text-align: center;
}

.list-container {
    height: 440px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
    overflow: hidden;
    border: 1px solid #D3D3D3;
    border-right: 1px solid #D3D3D3;
}

.list-container:hover {
    border-color: #82EB5A;
    cursor: pointer;
}

.col-md-4 {
    margin-right: 30px;
}

.preview {
	margin: 15px auto 15px auto;
	width: 350px;
	height: 300px;
	display: flex;
	object-fit: cover;
	justify-content: center;
	align-items: center;
	background-size: cover; 
	background-repeat: no-repeat;
	background-position: center center;
}

.no {
   margin-top: 10px;
}

.title {
    margin-top: 10px;
    color: black;
    font-weight: bold;
    font-size: 25px;
    text-align: left;
    overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.view {
	font-size: 15px;
}
.write{
	font-size: 15px;
}

.info {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: space-between; /* 요소 간에 공간을 균등하게 배치 */
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}

.info h6 {
    margin: 0; /* 기본 마진 제거 */
}

.select {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: right;
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}

label{
	margin : 5px;
}

select {
	width: 100px;
	text-align: center;
}

.no-result {
	
}

.no-result strong {
	color: #929292;
	font-size: 18px;
}

.no-result img {
	width:150px;
	height: 150px;
}


</style>

<div class="mt-5 mb-5">

<%-- ${paging.category } --%>

<c:choose>
	<c:when test="${empty hasData or not hasData }">
		<div class="no-result text-center mb-5">
			<img alt="noResult" src="./resources/img/no-result-gray.png"><br>
			<strong>찾으시는 검색 결과가 없습니다</strong><br>
			<strong>다른 게시판을 확인 해보세요</strong><br>
		</div>
	</c:when>


	<c:when test="${paging.category eq 1 }">
		<c:import url="/WEB-INF/views/rent/list.jsp" />
	</c:when>
	
	<c:when test="${paging.category eq 2 }">
		<c:import url="/WEB-INF/views/share/list.jsp" />
	</c:when>
	
	<c:when test="${paging.category eq 3 }">
		<c:import url="/WEB-INF/views/market/list.jsp" />
	</c:when>
	
	<c:when test="${paging.category eq 4 }">
		<c:import url="/WEB-INF/views/group/list.jsp" />
	</c:when>

</c:choose>

</div>

