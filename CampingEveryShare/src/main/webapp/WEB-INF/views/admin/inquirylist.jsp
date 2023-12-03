<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style type="text/css">
.head, #body {
	text-align: center;
}

.title > a{
	color: black;
	align-items: center; /* 수직 가운데 정렬 */
	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
	
}
</style>

<script type="text/javascript">
$(()=>{	
	$(".btnStatus").click(function (){
		
		var boardNo = $(this).attr("data-boardno")
		var boardCate = $(this).attr("data-cate")
		var status = $(this).attr("data-status")
		var isConfirmed = confirm("문의 글을 삭제 하시겠습니까?");
		
		console.log(boardNo)
		console.log(boardCate)
		console.log(status)
		
		if (isConfirmed) {
		$.ajax({
			type: "get"
			, url: "/admin/boardstatus"
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
	  }
	}) //$("#btnStatus").click() end
	
}); //function end
</script>

<div class="container">

<!-- 작성 공간 -->
<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 문의관리</h3>

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col style="width : 15%">
	<col style="width : 30%">
	<col style="width : 15%">
	<col style="width : 15%">
	<col style="width : 15%">
	<col style="width : 10%">
</colgroup>

<thead class="head">
	<tr style="font-size: 17px; font-weight: bold;">
		<th>글 유형</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
		<th>삭제</th>
	</tr>
</thead>
<tbody>
<c:forEach var="board" items="${list }">
	<tr> 
		<td style="text-align: center;">
		<div style="font-weight: bold; font-size: 17px;">[${board.LOCATION_NAME}]</div>
		</td>
		<td class="title">
	        <a href="/admin/inquiryview?boardNo=${board.BOARD_NO}" style="text-decoration: none;">
	            <div>${board.TITLE}</div>
            </a>
		</td>
		<td style="text-align: center;">${board.USER_NICK }</td>
		<td style="text-align: center;">${board.HIT }</td>
		<td style="text-align: center;">
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
         <td id="body">
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

</div><!-- .container -->
<c:import url="../layout/pagination.jsp" />

<c:import url="../layout/footer.jsp" />