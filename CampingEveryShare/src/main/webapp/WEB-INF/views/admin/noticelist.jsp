
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>

<c:import url="../layout/adminheader.jsp" />

<style>
.head, .body {
	text-align: center;
}

</style>

<script type="text/javascript">
$(()=>{	
	$(".btnStatus").click(function (){
		
		var boardNo = $(this).attr("data-boardno")
		var boardCate = $(this).attr("data-cate")
		var status = $(this).attr("data-status")
		
		console.log(boardNo)
		console.log(boardCate)
		console.log(status)
		
		$.ajax({
			type: "get"
			, url: "/admin/status"
			, data: { 
				boardNo : boardNo,
				boardCate : boardCate,
				deleteStatus : status
 			}
			, dataType: "json"
			, success: function( data ) {
	//				console.log("성공");
					
				if( data.result ) { //삭제 성공
					$(".btnStatus[data-boardno='" + boardNo + "']")
					.removeClass("btn-danger")
					.addClass("btn-warning")
					.html('삭제 복구');
				
				} else { //삭제 복구 성공
					$(".btnStatus[data-boardno='" + boardNo + "']")
					.removeClass("btn-warning")
					.addClass("btn-danger")
					.html('삭제');
				} //if end
				
	//			location.reload(true);
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}) //$("#btnStatus").click() end
	
}); //function end
</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 공지사항</h3>

<div style="text-align: right; margin-bottom: 10px;">
<c:choose>
    <c:when test="${empty adminCode or adminCode ne admin.adminCode}">
        <!-- adminCode가 비어 있거나 adminCode와 admin.adminCode가 일치하지 않을 때는 버튼을 표시하지 않음 -->
    </c:when>
    <c:otherwise>
        <!-- adminCode가 존재하고 adminCode와 admin.adminCode가 일치하는 경우에만 버튼을 표시 -->
        <a href="./write?boardCate=5"><button>글쓰기</button></a>
    </c:otherwise>
</c:choose>
</div>

<table class="table table-striped table-hover table-sm" >
<colgroup>
   <col width="15%">
   <col width="40%">
   <col width="10%">
   <col width="15%">
   <col width="20%">
</colgroup>

<thead class="head">
   <tr>
		<th>글 유형</th>
		<th>제목</th>
		<th>조회수</th>
		<th>등록일</th>
		<th>삭제</th>
   </tr>
</thead>
<tbody>
<c:forEach var="board" items="${list }">
	<tr> 
		<td style="text-align: center; font-weight: bold; font-size: 17px; margin-right: 13px;">[공지]</td>
		<td class="body">
			<a href="./noticeview?boardNo=${board.BOARD_NO }" style="text-decoration: none; ">
			${board.TITLE }</a>
		</td>
		<td class="body">${board.HIT }</td>
		<td class="body">
	      <fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
	      <fmt:formatDate value="${board.POST_DATE }" pattern="yyyyMMdd" var="write"/>
	      <c:choose>
	         <c:when test="${write lt current }">
	            <fmt:formatDate value="${board.POST_DATE }" pattern="yyyy-MM-dd"/>
	         </c:when>
	         <c:when test="${write eq current }">
	            <fmt:formatDate value="${board.POST_DATE }" pattern="HH:mm"/>
	         </c:when>
	      </c:choose>   
         </td>
         <td class="body">
         <c:choose>
         <c:when test="${board.DELETE_STATUS eq 0 }">
   			 <button class="btn btn-danger btnStatus" data-boardno="${board.BOARD_NO}" data-cate="${board.BOARD_CATE }" data-status="${board.DELETE_STATUS }">삭제</button>
		</c:when>
		<c:when test="${board.DELETE_STATUS eq 1 }">
   			 <button class="btn btn-warning btnStatus" data-boardno="${board.BOARD_NO}" data-cate="${board.BOARD_CATE }" data-status="${board.DELETE_STATUS }">삭제 복구</button>
		</c:when>
		</c:choose>
		</td>
	</tr>
</c:forEach>
</tbody>


</table>
<small class="float-end mb-3">total : ${paging.totalCount }</small>


</div>
</div> <!-- container end -->



<c:import url="/WEB-INF/views/layout/pagination.jsp" >
    <c:param name="url" value="./list" />
</c:import>

<c:import url="../layout/footer.jsp" />