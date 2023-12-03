
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

.wr {
   padding-left: 30px;
   padding-right: 30px;
/*    background-color: aqua; */
   border: 1px solid #C7C8C9;
   border-radius: 30px;
   padding-bottom: 20px;
}

.title {
	max-width: 1137px;
    font-weight: bold;
    font-size: 40px;
    flex: 1;
    overflow: hidden;
    margin-top: 10px;
}

.writer_info {
	display: flex;
    flex-direction: row;
    font-size: 20px;
    color: #2072d8;
    min-width: 280px;
}

.board_info {
	font-size: 20px;
    margin-left: 10px; 
}

.subtitle {
/* 	background-color: antiquewhite; */
    display: flex;
    flex
    /* flex-direction: row; */
    /* align-items: center; */
    margin-top: 10px;
}

.content {
	overflow: auto;
}

.list {
	background-color: #B4B4B4;
    width: 80px;
    height: 40px;
    border-radius: 10px;
    text-align: center;
    /* margin-left: 719px; */
    padding: 5px;
    max-width: 1300;
    margin-top: 20px;
}

.list_a {
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    font-size: 20px;
}

.list_fin {
    display: grid;
    justify-content: end;
}

.edit {
   background-color: #158EE7; 
   width: 80px;
   height: 40px;
   border-radius: 10px; 
    text-align: center; 
/*     margin-left: 719px; */
    padding: 5px;
/*     margin-top: -20px; */
}

.edit:hover {
   background-color: #1271b7;
}

 .edit_a { 
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    font-size: 20px;
 } 

.delete {
   background-color: #E63D3D; 
   width: 80px;
   height: 40px;
   border-radius: 10px; 
    text-align: center; 
    margin-left: 10px;
    padding: 5px;
}

.delete:hover {
   background-color: #c93434;
}

 .delete_a { 
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    font-size: 20px;
 } 

.show_profile {
	display: flex;
    align-items: center;
    min-width: 1070px;
}

.user_con {
/*     background-color: magenta;  */
   display: flex;
   flex-direction: row;
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

<div class="wr">

	<div class="title">
		${board.title }
	</div>


	<div class="subtitle">
	
	<div class="show_profile">
	<div class="writer_info">
		@${board.userId }
	</div><br>
	
	<div class="user_con">
	<div class="board_info">
			<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
			<fmt:formatDate value="${board.postDate }" pattern="yyyyMMdd" var="write"/>
			<c:choose>
				<c:when test="${write lt current }">
					<fmt:formatDate value="${board.postDate }" pattern="yyyy-MM-dd HH:mm"/>
				</c:when>
				<c:when test="${write eq current }">
					<fmt:formatDate value="${board.postDate }" pattern="HH:mm"/>
				</c:when>
			</c:choose>
       
       조회 ${board.hit }
      </div><!-- .board_info -->
      </div><!-- .user_con -->
      </div><!-- .show_profile -->
   <div class="edit">
   <a class="edit_a" href="/admin/noticeupdate?boardNo=${board.boardNo }">수정</a>
   </div><!-- .edit -->
   
   <div class="delete">
   <a class="delete_a" href="/admin/noticedelete?boardNo=${board.boardNo }">삭제</a>
   </div><!-- .delelte -->
     
      </div><!-- .subtitle -->
        <hr>
     
     <div class="content">  
	${board.content }
	</div><!-- .content -->

	<div class="list_fin">
<div class="list">
<a class="list_a" href="noticelist">목록</a>
</div><!-- .list -->
</div><!-- .list_fin -->
	
</div><!-- .wr -->


</div>
</div>

</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />