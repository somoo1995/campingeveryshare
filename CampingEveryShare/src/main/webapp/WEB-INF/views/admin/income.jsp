
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
	const incomeCategory = $("#incomeCategory").val();
	console.log("검색어:", searchValue, "게시판 카테고리:", incomeCategory); // 확인용 로그
	location.href = "./income?search=" + searchValue + "&category=" + incomeCategory;
	});
})
</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 수익관리</h3>

<div id="searchDiv">
	 <select id="incomeCategory" class="form-select">
        <option value="0">--아이디+계좌번호--</option>
        <option value="1">아이디</option>
        <option value="2">계좌번호</option>
    </select>
    
	<input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="조회"/>
	<button id="btnSearch" class="btn btn-primary">검색</button>
</div>


<form action="web.dao.face.adminDao" method="get" >
<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="10%">
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
		<th>신청자ID</th>
		<th>은행명</th>
		<th>계좌번호</th>
		<th>신청금액</th>
		<th>신청날짜</th>
		<th>승인 확인</th>
	</tr>
</thead>
<tbody>
<c:forEach var="income" items="${incomeList }">
	<tr> 
		<td>${income.RNUM }</td>
		<td>${income.USER_ID }</td>
		<td>${income.BANK_NAME }</td>
		<td>${income.BANK_ACCOUNT }</td>
		<td>${income.MONEY }</td>
		<td>${income.MONEY_DATE }</td>
		<td>
		<button type="button" id="basic_button" class="btn btn-info">승인</button>
		</td>  
	</tr>
</c:forEach>
</tbody>
</table>
<small class="float-end mb-3">total : ${paging.totalCount }</small>

</form>
</div>


</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" >
    <c:param name="url" value="./income" />
</c:import>

<c:import url="../layout/footer.jsp" />