
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style>
#searchDiv{
      display: flex;
      width: 60%;
      margin-left: 0;
      margin-bottom: 20px;
}
#select, #input{
	width : 25%;
}
#btnSearch{
	width: 10%:
}
#body, #head {
	text-align: center;
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

<script type="text/javascript">
$(()=>{	
	$(".btnUserStatus").click(function (){
		
		var userId = $(this).attr('data-vuserid')
	    var status = $(this).attr('data-status')
	    var isConfirmed = confirm("해당 회원을 탈퇴시키겠습니까?");
	       
		console.log(userId)
		console.log(status)
		
		if (isConfirmed) {
		$.ajax({
			type: "get"
			, url: "./userstatus"
			, data: { 
				userId: userId,
	             userStatus: status
 			}
			, dataType: "json"
			, success: function( data ) {
	//				console.log("성공");
					
				if( data.result ) { //탈퇴 성공
					$(".btnUserStatus[data-vuserid='" + userId + "']")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('회원 복구');
				
				} else { //복구 성공
					$(".btnUserStatus[data-vuserid='" + userId + "']")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('회원 탈퇴');
				} //if end
				
	//			location.reload(true);
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	  }
	}) //$(".btnUserStatus").click() end
	
}); //function end
</script>

<script type="text/javascript">
$(()=>{	
	$(".btnBoardStatus").click(function (){
		
		var boardNo = $(this).attr('data-boardno')
		var boardCate = $(this).attr('data-cate')
	    var status = $(this).attr('data-status')
	    var isConfirmed = confirm("해당 글을 삭제하시겠습니까?");
	       
		console.log(boardNo)
		console.log(boardCate)
		console.log(status)
		
		$.ajax({
			type: "get"
			, url: "./boardstatus"
			, data: { 
				boardNo: boardNo,
				boardCate: boardCate,
	            deleteStatus: status
 			}
			, dataType: "json"
			, success: function( data ) {
					
				if( data.result ) { //글 삭제 성공
					$(".btnBoardStatus[data-boardno='" + boardNo + "'][data-cate='" + boardCate + "']")
					.removeClass("btn-danger")
					.addClass("btn-warning")
					.html('글 복구');
				} else { //복구 성공
					$(".btnBoardStatus[data-boardno='" + boardNo + "'][data-cate='" + boardCate + "']")
					.removeClass("btn-warning")
					.addClass("btn-danger")
					.html('글 삭제');
				} //if end
				
	//			location.reload(true);
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}) //$(".btnUserStatus").click() end
	
}); //function end
</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 신고 관리</h3>

<div id="searchDiv">
	 <select id="select" class="form-select">
        <option value="0">--전체--</option>
        <option value="1">대여</option>
        <option value="2">캠핑존 공유</option>
        <option value="3">중고장터</option>
        <option value="4">모집</option>
    </select>
    
	<input class="form-control" id="input" value="${param.search }" placeholder="신고받은 회원 조회"/>
	<button id="btnSearch" class="btn btn-primary">검색</button>
</div>


<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="5%">
	<col width="12%">
	<col width="10%">
	<col width="24%">
	<col width="15%">
	<col width="7%">
	<col width="7%">
	<col width="10%">
	<col width="10%">
</colgroup>

<thead id="head">
	<tr>
		<th>No.</th>
		<th>신고사유</th>
		<th>카테고리</th>
		<th>제목</th>
		<th>신고일</th>
		<th>게시자</th>
		<th>신고자</th>
		<th>탈퇴</th>
		<th>삭제</th>
	</tr>
</thead>
<tbody>
<c:forEach var="report" items="${reportList }">
	<tr> 
		<td id="body">${report.RNUM }</td>
		<c:choose>
		<c:when test="${report.REASON == 1 }">
			<td id="body">허위 사실 유포</td>
		</c:when>
		<c:when test="${report.REASON == 2 }">
			<td id="body">음란성 및 선정성</td>
		</c:when>
		<c:when test="${report.REASON == 3 }">
			<td id="body">지나친 욕설 포함</td>
		</c:when>
		<c:when test="${report.REASON == 4 }">
			<td id="body">지나친 혐오성</td>
		</c:when>
		<c:when test="${report.REASON == 5 }">
			<td id="body">저치관련 게시물</td>
		</c:when>
		<c:when test="${report.REASON == 6 }">
			<td id="body">상업적 광고 홍보</td>
		</c:when>
		<c:when test="${report.REASON == 7 }">
			<td id="body">
			<!-- 버튼 트리거 모달 -->
			<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#reportDetailModal" onclick="openReportDetailModal('${report.REASON_DETAIL}')">
			<div>기타</div>
			</button>
			</td>
		</c:when>
		</c:choose>
		<c:choose>
		<c:when test="${report.BOARD_CATE == 1 }">
			<td id="body">대여</td>
		</c:when>
		<c:when test="${report.BOARD_CATE == 2 }">
			<td id="body">캠핑존</td>
		</c:when>
		<c:when test="${report.BOARD_CATE == 3 }">
			<td id="body">중고장터</td>
		</c:when>
		<c:when test="${report.BOARD_CATE == 4 }">
			<td id="body">모집</td>
		</c:when>
		</c:choose>
		<td>
			<a href="/share/view?boardNo=${report.BOARD_NO }&boardCate=${report.BOARD_CATE }">${report.REPORT_TITLE }</a>
		</td>
		<td id="body">
		<fmt:parseDate value="${report.REPORT_DATE }" var="date" pattern="yyyy-MM-dd HH:mm"/>
      	<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm"/>
		</td>
		<td id="body">${report.VUSER_ID }</td>
		<td id="body">${report.RUSER_ID }</td>
		
		<td id="body">
		 <c:choose>
         <c:when test="${report.USER_STATUS eq 0 }">
   			 <button class="btn btn-primary btnUserStatus" data-vuserid="${report.VUSER_ID }" data-status="${report.USER_STATUS }">회원 탈퇴</button>
		</c:when>
		<c:when test="${report.USER_STATUS eq 1 }">
   			 <button class="btn btn-warning btnUserStatus" data-vuserid="${report.VUSER_ID }" data-status="${report.USER_STATUS }">회원 복구</button>
		</c:when>
		</c:choose>
		</td>
		
		<td id="body">
		<c:choose>
         <c:when test="${report.DELETE_STATUS eq 0 }">
   			 <button class="btn btn-danger btnBoardStatus" data-boardno="${report.BOARD_NO }" data-cate="${report.BOARD_CATE }" data-status="${report.DELETE_STATUS }">글 삭제</button>
		</c:when>
		<c:when test="${report.DELETE_STATUS eq 1 }">
   			 <button class="btn btn-warning btnBoardStatus" data-boardno="${report.BOARD_NO }" data-cate="${report.BOARD_CATE }" data-status="${report.DELETE_STATUS }">글 복구</button>
		</c:when>
		</c:choose>
		</td>  
	</tr>
</c:forEach>
</tbody>
</table>
<small class="float-end mb-3">total : ${paging.totalCount }</small><br><br>

</div>


</div><!-- .container -->


<c:import url="/WEB-INF/views/layout/pagination.jsp" >
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


<br>
<c:import url="../layout/footer.jsp" />
