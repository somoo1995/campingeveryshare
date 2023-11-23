
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

<script type="text/javascript">
function openReportDetailModal(reasonDetail) {
    // JavaScript로 모달 내부에 값을 넣어줌
    document.getElementById('reportDetailContent').innerText = reasonDetail;
    // 모달 띄우기
    $('#reportDetailModal').modal('show');
}
</script>

<script type="text/javascript">
$(() => {
	//검색 버튼 클릭
	$("#btnSearch").click(() => {
	const searchValue = $("#searchInput").val();
	const boardCategory = $("#boardCategory").val();
	console.log("검색어:", searchValue, "게시판 카테고리:", boardCategory); // 확인용 로그
	location.href = "./report?search=" + searchValue + "&category=" + boardCategory;
	});
})

</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 신고 관리</h3>

<div id="searchDiv">
	 <select id="boardCategory" class="form-select">
        <option value="0">--전체--</option>
        <option value="1">대여</option>
        <option value="2">캠핑존 공유</option>
        <option value="3">중고장터</option>
        <option value="4">모집</option>
    </select>
    
	<input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="신고받은 회원 조회"/>
	<button id="btnSearch" class="btn btn-primary">검색</button>
</div>


<form action="web.dao.face.adminDao" method="get" >
<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="5%">
	<col width="15%">
	<col width="10%">
	<col width="25%">
	<col width="16%">
	<col width="7%">
	<col width="7%">
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
			<td>
			<!-- 버튼 트리거 모달 -->
			<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#reportDetailModal" onclick="openReportDetailModal('${report.REASON_DETAIL}')">
			<div>기타</div>
			</button>
			</td>
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
			<td>중고장터</td>
		</c:when>
		<c:when test="${report.BOARD_CATE == 4 }">
			<td>모집</td>
		</c:when>
		</c:choose>
		<td>
			<a href="./view?boardNo=${report.BOARD_NO }&boardCate=${report.BOARD_CATE }">${report.REPORT_TITLE }</a>
		</td>
		<td>
		<fmt:parseDate value="${report.REPORT_DATE }" var="date" pattern="yyyy-MM-dd HH:mm"/>
      	<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm"/>
		</td>
		<td>${report.VUSER_ID }</td>
		<td>${report.RUSER_ID }</td>
		<td>
		<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#deleteUserModal" data-report-detail="${report.REASON_DETAIL}">
		<div>회원 탈퇴</div></button>
		<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#deleteBoardModal">글 삭제</button>
		</td>  
	</tr>
</c:forEach>
</tbody>
</table>
<small class="float-end mb-3">total : ${paging.totalCount }</small>

</form>
</div>


</div><!-- .container -->


<c:import url="/WEB-INF/views/layout/adminPaginationSearch.jsp" >
    <c:param name="url" value="./report" />
</c:import>

<c:import url="/WEB-INF/views/layout/modal.jsp" />

<!--기타 사유 모달 -->
<div class="modal fade" id="reportDetailModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="reportModalLabel">기타 사유</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="reportDetailContent">
		<c:out value="${param.report-detail}" />
      </div>
    </div>
  </div>
</div>



<c:import url="../layout/footer.jsp" />
