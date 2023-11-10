<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<script type="text/javascript">
$(()=>{
// 	if(${isRecom}) {
// 		$("#btnRecom")
// 			.addClass("btn-warning")
// 			.html('추천 취소');
// 	} else {
// 		$("#btnRecom")
// 			.addClass("btn-primary")
// 			.html('추천');
// 	}

// 	$("#btnRecom").click(()=>{
		
// 		$.ajax({
// 			type: "get"
// 			, url: "/share/recommend"
// 			, data: { "boardNo": '${board.boardNo }' }
// 			, dataType: "json"
// 			, success: function( data ) {
// 					console.log("성공");
	
// 				if( data.result ) { //추천 성공
// 					$("#btnRecom")
// 					.removeClass("btn-primary")
// 					.addClass("btn-warning")
// 					.html('추천 취소');
				
// 				} else { //추천 취소 성공
// 					$("#btnRecom")
// 					.removeClass("btn-warning")
// 					.addClass("btn-primary")
// 					.html('추천');
				
// 				}
				
// 				//추천수 적용
// 				$("#recom").html(data.cnt);
				
// 			}
// 			, error: function() {
// 				console.log("실패");
// 			}
// 		}); //ajax end
		
// 	}); 

	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$.ajax({
			type: "post"
			, url: "/comm/insert"
			, dataType: "json"
			, data: {
				userId : "${board.userId}",
				boardNo : ${board.boardNo},
				content : $("#commentContent").val(),
				boardCate : ${board.boardCate}
			}
			, success: function(res){
				console.log(res);
				if(res) {
					updateCommentList();
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
		type: "post"
		, url: "/comm/delete"
		, dataType: "json"
		, data: {
			commNo: commNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

</script>

<style type="text/css">
.content {
	min-height: 300px;
}
</style>

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">

<h3 id="pageTitle">게시글 조회</h3>
<table class="table table-bordered">
<colgroup>
	<col style="width: 15%">
	<col style="width: 35%">
	<col style="width: 15%">
	<col style="width: 35%">
</colgroup>
	<tr>
		<th class="table-info">글 번호</th><td >${board.boardNo }</td>
		<th class="table-info">작성일</th>
		<td>
        <c:choose>
            <c:when test="${board.postDate.time lt (now - oneDay)}">
                <fmt:formatDate value="${board.postDate}" pattern="yyyy-MM-dd HH:mm" />
            </c:when>
            <c:otherwise>
                <fmt:formatDate value="${board.postDate}" pattern="yyyy-MM-dd" />
            </c:otherwise>
        </c:choose>
        </td>
	</tr>
	<tr>
		<th class="table-info">아이디</th><td>${board.userId }</td>
		<th class="table-info">닉네임</th><td>${user.userNick }</td>
	</tr>
	<tr>
		<th class="table-info">제목</th><td>${board.title }</td>
		<th class="table-info">조회수</th><td>${board.hit }</td>
	</tr>
	<tr>
		<th class="table-info">첨부파일</th>
		<td colspan="3">
		<c:forEach var="boardFile" items="${boardFile }">
		<a href="../upload/${boardFile.storedName }" download="${boardFile.originName }">
		${boardFile.originName }<br>
		</a>
		</c:forEach>		
		</td>
	</tr>
	<tr>
		<th class="table-info">내용</th><td colspan="3">${board.content }</td>
	</tr>
</table> 

<div class="text-center">
<!-- 	<a href="./list" class="btn btn-secondary">목록</a> -->
<%-- 	<c:if test="${sessionScope.isLogin }"> --%>
<%-- 	<c:if test="${recom }"> --%>
<!-- 	<a id="recom" class="btn btn-secondary">추천하기</a> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${recom eq false }"> --%>
<!-- 	<a id="recommend" class="btn btn-secondary">추천취소</a> -->
<%-- 	</c:if> --%>
	
<%-- 	<p>추천수</p> <p id=reco>${reconum }</p> --%>
	<a href="./update?boardNo=${board.boardNo }" class="btn btn-primary">수정</a>
	<a href="./delete?boardNo=${board.boardNo }" class="btn btn-danger">삭제</a>
<%-- 	</c:if> --%>
</div>

<hr>
<div>

	<!-- 비로그인상태 -->
	<c:if test="${not isLogin }">
	<strong>로그인이 필요합니다</strong><br>
	<button onclick='location.href="/user/login";'>로그인</button>
	<button onclick='location.href="/user/join";'>회원가입</button>
	</c:if>
	
<!-- 	로그인상태  -->
	<c:if test="${isLogin }">
<!-- 	댓글 입력 -->
	<div class="row justify-content-around align-items-center">
	<input type="hidden" value="${userId }" >
	<input type="hidden" value="${board.boardCate }">
	<input type="hidden" value="${board.boardNo }">
		<div class="col-2">
			<input type="text" class="form-control" id="commentWriter" value="${userNick }" readonly="readonly"/>
		</div>
		<div class="col-9">
			<textarea class="form-control" id="commentContent"></textarea>
		</div>
		<button id="btnCommInsert" class="btn btn-primary col-1">입력</button>
	</div>	<!-- 댓글 입력 end -->
	</c:if>
	
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed text-center">
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
	<tr data-commentNo="${comm.commNo }">
		<td>${user.userNick }</td>
		<td class="text-start">${comm.content }</td>
		<td><fmt:formatDate value="${comm.postDate }" pattern="yy-MM-dd" /></td>
		<td>
			<c:if test="${sessionScope.userId eq comm.userId }">
			<button class="btn btn-warning btn-xs" onclick="deleteComment(${comm.commNo });">삭제</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</tbody>
	</table><!-- 댓글 리스트 end -->

</div><!-- 댓글 처리 end -->
</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />