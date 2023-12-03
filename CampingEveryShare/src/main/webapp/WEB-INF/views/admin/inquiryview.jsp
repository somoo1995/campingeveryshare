<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />
<script type="text/javascript">
$(()=>{
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$.ajax({
			type: "post"
			, url: "/comm/insert"
			, dataType: "json"
			, data: {
				userId : "${loginId}",
				userNick : "${loginNick}",
				boardNo : ${board.boardNo},
				content : $("#commentContent").val(),
				boardCate : ${board.boardCate}
			}
			, success: function(res){
				console.log(res);
				if(res) {
					updateCommentList();
					 $("#commentContent").val('');
				} else {
					alert("댓글 등록 실패");
				
				}
			}
			, error: function() {
				console.log("error");
			}
		});
		
		
	}); //$("#btnCommInsert").click() end
})

function updateCommentList() {
    $.ajax({
        type: "get",
        url: "/comm/list",
        data: {
            boardNo: ${board.boardNo},
            boardCate: ${board.boardCate},
            userNick : "${user.userNick}"
        },
        dataType: "html",
        success: function (data) {
            // 댓글 목록이 포함된 HTML을 해당 부분에 업데이트
            $("#commentBody").html(data);
        },
        error: function () {
            console.log("댓글 목록 업데이트 실패");
        }
    });
}


function deleteComment(commNo) {
	$.ajax({
		type: "get"
		, url: "/comm/delete"
		, dataType: "json"
		, data: {
            commNo : commNo
		
		},
		dataType: "html"
		, success: function(){
				updateCommentList();
		}
		, error: function() {
			console.log("댓글 삭제 실패");
		}
	});
}

</script>

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
/*     color: #7A7A7A; */
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
    min-width: 1150px;
}

.user_con {
/*     background-color: magenta;  */
   display: flex;
   flex-direction: row;
}

</style>

<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 문의관리</h3>

<div class="wr">

	<div class="title">
		
		<c:if test="${board.location eq 0}">[비공개]</c:if>
		<c:if test="${board.location eq 18}">[공개]</c:if>
		 ${board.title }
	</div>


	<div class="subtitle">
	
	<div class="show_profile">
	<div class="writer_info">
		${user.userNick} <span style="color: #7A7A7A; margin-left: 5px;">@${board.userId }</span>
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
      </div><!-- .subtitle -->
        <hr>
    
     <div class="content">  
	${board.content }
	</div><!-- .content -->

	<div class="list_fin">
<div class="list">
<a class="list_a" href="/admin/inquirylist">목록</a>
</div><!-- .list -->
</div><!-- .list_fin -->	
</div><!-- .wr -->
</div><!-- .adminPageTitle -->

<div>
	
<!-- 	로그인상태  -->
	<c:if test="${isAdmin }">
<!-- 	댓글 입력 -->
	<div class="row justify-content-around align-items-center">
	<input type="hidden" value="${loginId }" >
	<input type="hidden" value="${board.boardCate }">
	<input type="hidden" value="${board.boardNo }">
		<div class="col-2">
			<input type="text" class="form-control" id="commentWriter" value="관리자" readonly="readonly"/>
		</div>
		<div class="col-9">
			<textarea style="height: 100px; resize: none; MAX-WIDTH: 1300PX;
    margin-top: 10px;" class="form-control" id="commentContent"></textarea>
		</div>
		<button id="btnCommInsert" class="btn btn-primary col-1">입력</button>
	</div>	<!-- 댓글 입력 end -->
	</c:if>
	
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed text-center" >
	<colgroup>
		<col style="width: 15%;">
		<col style="width: 55%;">
		<col style="width: 20%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
	<tr>
		<th>작성자</th>
		<th>댓글</th>
		<th>작성일</th>
		<th></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${commList }" var="comm">
	<tr data-commentNo="${comm.COMM_NO }">
		<td>${comm.USER_NICK}</td>
		<td class="text-start">${comm.CONTENT }</td>
		<td>
			<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
			<fmt:formatDate value="${comm.POST_DATE }" pattern="yyyyMMdd" var="write"/>
				<c:choose>
					<c:when test="${write lt current }">
						<fmt:formatDate value="${comm.POST_DATE }" pattern="yyyy-MM-dd"/>
					</c:when>
					<c:when test="${write eq current }">
						<fmt:formatDate value="${comm.POST_DATE }" pattern="HH:mm"/>
					</c:when>
				</c:choose>
		</td>
		<td>
			<c:if test="${sessionScope.loginId eq comm.USER_ID }">
			<button class="btn btn-warning btn-xs" onclick="deleteComment(${comm.COMM_NO });">삭제</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</tbody>
	</table><!-- 댓글 리스트 end -->

</div><!-- 댓글 처리 end -->

</div><!-- .container -->



<c:import url="../layout/modal.jsp" />
<c:import url="../layout/footer.jsp" />
