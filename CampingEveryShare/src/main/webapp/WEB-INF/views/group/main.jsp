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
<h3 id=pageTitle>모집 게시판</h3>

<div style="text-align: right; margin-bottom: 10px;">
<a  href="/group/write?boardCate=4"><button>글쓰기</button></a>
</div>

<c:import url="./list.jsp"></c:import>




</div><!-- .container -->
<c:import url="../layout/pagination.jsp" />
<c:import url="../layout/footer.jsp" />