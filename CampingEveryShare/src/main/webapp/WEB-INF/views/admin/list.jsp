
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
.search_wrap{
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
$(function() {
	$("#btnSearch").click(function() {
		console.log("#btnSearch click")
		
		var type = $("#type").val();
		var search = $("#search").val();
		
		console.log("현재 검색type: " + type);
		console.log("현재 검색어: " + search);
		
		if(!type){
			alert("검색 유형을 선택해주세요!");
			return false;
		}
		
		if(!search){
			alert("검색어를 입력해주세요!");
			return false;
		}
		
		actionForm.find("input[name='type']").val(type);
		actionForm.find("input[name='search']").val(search);
		actionForm.submit();
		
		location.href="./list?search="+$("#search").val();
	});
	
})


</script>

<div class="container">

<div class="pageTitle">
<h3 id=pageTitle>관리자 회원관리</h3>

<input type="button" value="알림" class="btn btn-outline-primary" style="float: right;" onclick="insertAlert();"><br><br>

<div class="search_wrap">
		<select id="type" name="type">
			<option value="" selected="selected" <c:out value="${param.type == null ?'selected':'' }" />>선택</option>
			<option value="I" <c:out value="${param.type eq 'I'?'selected':'' }" />>아이디</option>
			<option value="N" <c:out value="${param.type eq 'N'?'selected':'' }" />>이름</option>
			<option value="E" <c:out value="${param.type eq 'E'?'selected':'' }" />>이메일</option>
		</select>
		<input id="search" name="search" type="text" class="form-control search-input" value="${param.search }" />
		<button id="btnSearch" class="btn btn-info search-btn">검색</button>
</div>

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
		<th><input type="checkbox" id="allCheck" name="allCheck"></th>
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
		<td><input type="checkbox" name="rowCheck" value="${user.USER_ID }"></td>
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

<c:import url="/WEB-INF/views/layout/listpagination.jsp" />

<c:import url="../layout/footer.jsp" />