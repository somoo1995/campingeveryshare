
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
				console.log("성공");
				
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
<h3 id=adminpageTitle>관리자 공지사항</h3>

<table class="table table-bordered">
<colgroup>
	<col style="width: 15%">
	<col style="width: 35%">
	<col style="width: 15%">
	<col style="width: 35%">
</colgroup>
	<tr>
		<th class="table-info">작성자</th>
		<td>${board.userId }</td>
		<th class="table-info">조회수</th><td>${board.hit }</td>
	</tr>
	<tr>
		<th class="table-info">제목</th><td>${board.title }</td>
		<th class="table-info">작성일</th>
		<td>
			<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
			<fmt:formatDate value="${board.postDate }" pattern="yyyyMMdd" var="write"/>
			<c:choose>
				<c:when test="${write lt current }">
					<fmt:formatDate value="${board.postDate }" pattern="yyyy-MM-dd"/>
				</c:when>
				<c:when test="${write eq current }">
					<fmt:formatDate value="${board.postDate }" pattern="HH:mm"/>
				</c:when>
			</c:choose>
        </td>
	</tr>
	<tr>
		<th class="table-info">내용</th><td colspan="3">${board.content }</td>
	</tr>
</table> 


<div class="text-center">
	<a href="./noticelist" class="btn btn-secondary">목록</a>
<div>

</div>
	<a href="/admin/noticeupdate?boardNo=${board.boardNo }" class="btn btn-primary">수정</a>
	<a href="/admin/noticedelete?boardNo=${board.boardNo }" class="btn btn-danger">삭제</a>
</div>

</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />