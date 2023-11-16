<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<div class="container">

<div class="pageTitle">
<h3 id=pageTitle>관리자 회원관리</h3>


<form action="web.dao.face.adminDao" method="get" >
<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="5%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
</colgroup>

<thead>
	<tr>
		<th>No.</th>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>회원상태</th>
		<th>수정</th>
		<th>관리</th>
	</tr>
</thead>
<tbody>
<c:forEach var="user" items="${list }">
	<tr> 
		<td>${user.RNUM }</td>
		<td>${user.USER_ID }</td>
		<td>${user.USER_NAME }</td>
		<td>${user.EMAIL }</td>
		<c:choose>
		<c:when test="${user.USER_STATUS == 0 }">
			<td>가입</td>
		</c:when>
		<c:when test="${user.USER_STATUS == 1 }">
			<td>탈퇴</td>
		</c:when>
		</c:choose>
		<td>
			<a href="./delete?userId=${user.USER_ID }">
			<button type="button" class="btn btn-info">수정</button>
			</a>
		</td>
		<td>
		<button type="button" class="btn btn-warning">알림</button>
		<button type="button" class="btn btn-danger">탈퇴</button>
		</td>  
	</tr>
</c:forEach>
</tbody>
</table>
<small class="float-end mb-3">total : ${paging.totalCount }</small>

</form>
</div>


</div><!-- .container -->


<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<c:import url="../layout/footer.jsp" />