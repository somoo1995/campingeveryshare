
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style>
.form-control{
	display: inline-block;
    width: 236px;
    margin-top: 15px;
}
.searchDiv{
	margin-left: 756px;
	margin-bottom: 15px;
}
#type{
	width: 150px;
}
#search{
	width: 300px;
}
</style>

<script type="text/javascript">
$(() => {
	//검색 버튼 클릭
	$("#btnSearch").click(() => {
	const searchValue = $("#searchInput").val();
	const typeCategory = $("#typeCategory").val();
	
	if(!typeCategory){
		alert("검색 카테고리를 선택해주세요!");
		return false;
	}
	
	if(!searchValue){
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	console.log("검색어:", searchValue, "검색 카테고리:", typeCategory); // 확인용 로그
	location.href = "./list?search=" + searchValue + "&category=" + typeCategory;
	});
})


</script>

<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 수익관리</h3>


<form action="web.dao.face.adminDao" method="get" >
<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="5%">
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
		<th></th>
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
		<td>${income.RNUM }</td>
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
			<a href="/user/update?userId=${user.USER_ID }">
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

<c:import url="/WEB-INF/views/layout/listpagination.jsp" />

<c:import url="../layout/footer.jsp" />