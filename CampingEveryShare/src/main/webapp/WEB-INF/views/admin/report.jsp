
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style>
/* .form-control{ */
/* 	display: inline-block; */
/*     width: 236px; */
/*     margin-top: 15px; */
/* } */

/* 검색 바깥 div */
#searchDiv{
	display: inline-block;
	float: right;
}
/* 검색 input */
#searchInput{
	display: inline-block;
	width: 300px;
}
/* 검색 버튼 */
#btnSearch{
	margin-top: -5px;
}

</style>


<div class="container">

<div class="pageTitle">
<h3 id=pageTitle>관리자 신고 관리</h3>

<div id="searchDiv">
	<input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="게시글 조회"/>
	<button id="btnSearch" class="btn btn-primary">검색</button>
</div>


<form action="web.dao.face.adminDao" method="get" >
<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="5%">
	<col width="15%">
	<col width="10%">
	<col width="25%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="15%">
</colgroup>

<thead>
	<tr>
		<th>No.</th>
		<th>신고사유</th>
		<th>카테고리</th>
		<th>제목</th>
		<th>신고일</th>
		<th>게시자</th>
		<th>신고자</th>
		<th>관리</th>
	</tr>
</thead>
<tbody>
<c:forEach var="report" items="${reportList }">
	<tr> 
		<td>${report.RNUM }</td>
		<c:choose>
		<c:when test="${report.REASON == 1 }">
			<td>허위 사실 유포</td>
		</c:when>
		<c:when test="${report.REASON == 2 }">
			<td>음란성 및 선정성</td>
		</c:when>
		<c:when test="${report.REASON == 3 }">
			<td>지나친 욕설 포함</td>
		</c:when>
		<c:when test="${report.REASON == 4 }">
			<td>지나친 혐오성</td>
		</c:when>
		<c:when test="${report.REASON == 5 }">
			<td>저치관련 게시물</td>
		</c:when>
		<c:when test="${report.REASON == 6 }">
			<td>상업적 광고 홍보</td>
		</c:when>
		<c:when test="${report.REASON == 7 }">
			<td>기타</td>
		</c:when>
		</c:choose>
				<c:choose>
		<c:when test="${report.BOARD_CATE == 1 }">
			<td>대여</td>
		</c:when>
		<c:when test="${report.BOARD_CATE == 2 }">
			<td>캠핑존</td>
		</c:when>
		<c:when test="${report.BOARD_CATE == 3 }">
			<td>모집</td>
		</c:when>
		<c:when test="${report.BOARD_CATE == 4 }">
			<td>중고장터</td>
		</c:when>
		</c:choose>
		<td>${report.REPORT_TITLE }</td>
		<td>${report.REPORT_DATE }</td>
		<td>${report.VUSER_ID }</td>
		<td>${report.RUSER_ID }</td>
		<td>
		<button type="button" class="btn btn-warning">회원 탈퇴</button>
		<button type="button" class="btn btn-danger">글 삭제</button>
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