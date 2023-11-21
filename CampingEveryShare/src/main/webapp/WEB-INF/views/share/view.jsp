<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal fade" id="reportModal" aria-hidden="true" aria-labelledby="reportModalLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="reportModalLabel">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%@ include file="/WEB-INF/views/report/report.jsp" %>
        <button form="reportForm" id="reportBtn" class="btn float-end" data-bs-target="#reportOkModal" data-bs-toggle="modal">신고하기</button>
     </div>
    </div>
  </div>
</div>
<div class="modal fade" id=reportOkModal aria-hidden="true" aria-labelledby="reportOkModalLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="reportModalLabel">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%@ include file="/WEB-INF/views/report/report_ok.jsp" %>
      <button id="footerReportOkBtn" type="button" class="btn float-end" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<c:import url="../layout/header.jsp" />


<script type="text/javascript">
$(()=>{
	if(${isRecom}) {
		$("#btnRecom")
			.addClass("btn-warning")
			.html('추천 취소');
	} else {
		$("#btnRecom")
			.addClass("btn-primary")
			.html('추천');
	}
	
	$("#btnRecom").click(()=>{
		
		$.ajax({
			type: "get"
			, url: "/share/recom"
			, data: { 
				userId : "${loginId}",
				recomNo : ${board.boardNo},
				boardCate : ${board.boardCate}
 			}
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#btnRecom")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#btnRecom")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('추천');
				
				}
				
				//추천수 적용
				$("#recom").html(data.cnt);
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnRecommend").click() end

	$(() => {
	    if (${isHeart}) {
	        $("#btnHeart")
	            .addClass("btn-warning")
	            .html('찜 취소');
	    } else {
	        $("#btnHeart")
	            .addClass("btn-primary")
	            .html('찜');
	    }

	    $("#btnHeart").click(() => {
	        $.ajax({
	            type: "get",
	            url: "/share/heart",
	            data: {
	                userId: "${loginId}",
	                heartNo: ${board.boardNo},
	                boardCate: ${board.boardCate}
	            },
	            dataType: "json",
	            success: function (data) {
	                console.log("성공");

	                if (data.hResult) { //찜 성공
	                    $("#btnHeart")
	                        .removeClass("btn-primary")
	                        .addClass("btn-warning")
	                        .html('찜 취소');

	                } else { //찜 취소 성공
	                    $("#btnHeart")
	                        .removeClass("btn-warning")
	                        .addClass("btn-primary")
	                        .html('찜');

	                }

	            },
	            error: function () {
	                console.log("실패");
	            }
	        }); //ajax end
	    }); //$("#btnHeart").click() end
	});

	
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

<script language="javascript">
  function btnReport() { window.open("report.html", "report", "width=400, height=300, left=100, top=50"); }
</script>


<style type="text/css">
.content {
	min-height: 300px;
}
</style>

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">

<h3 id="pageTitle">공유 게시글 조회</h3>
<table class="table table-bordered">
<colgroup>
	<col style="width: 15%">
	<col style="width: 35%">
	<col style="width: 15%">
	<col style="width: 35%">
</colgroup>
	<tr>
		<th class="table-info">금 액</th>
		<td >
		    <c:choose>
			    <c:when test="${share.paid eq 2}">
			        무료
			    </c:when>
			    <c:when test="${share.paid eq 3}">
			        유료
			    </c:when>
			</c:choose>		
		</td>
		<th class="table-info">위 치</th>
		<td>
		<c:if test="${board.location eq 10}">강원</c:if>
  		<c:if test="${board.location eq 9}">경기</c:if>
	   	<c:if test="${board.location eq 16}">경남</c:if>
	    <c:if test="${board.location eq 15}">경북</c:if>
	    <c:if test="${board.location eq 5}">광주</c:if>
	    <c:if test="${board.location eq 6}">대구</c:if>
	    <c:if test="${board.location eq 3}">대전</c:if>
	    <c:if test="${board.location eq 4}">부산</c:if>
	    <c:if test="${board.location eq 1}">서울</c:if>
	    <c:if test="${board.location eq 8}">세종</c:if>
	    <c:if test="${board.location eq 7}">울산</c:if>
	    <c:if test="${board.location eq 2}">인천</c:if>
	    <c:if test="${board.location eq 14}">전남</c:if>
	    <c:if test="${board.location eq 13}">전북</c:if>
	    <c:if test="${board.location eq 17}">제주</c:if>
	    <c:if test="${board.location eq 12}">충남</c:if>
	    <c:if test="${board.location eq 11}">충북</c:if>
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
		<td>
		<c:forEach var="boardFile" items="${boardFile }">
		<a href="../upload/${boardFile.storedName }" download="${boardFile.originName }">
		${boardFile.originName }<br>
		</a>
		</c:forEach>		
		</td>
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

<div>
지도자리!!
</div>

<div class="text-center">
	<a href="./list" class="btn btn-secondary">목록</a>
<div>
	<button id="btnRecom" class="btn"></button>
</div>
	<p>추천수</p> <p id=recom>${totalCnt }</p>
	<c:if test="${loginId eq board.userId}">
	<a href="./update?boardNo=${board.boardNo }" class="btn btn-primary">수정</a>
	<a href="./delete?boardNo=${board.boardNo }" class="btn btn-danger">삭제</a>
	</c:if>
</div>

<div>
찜자리
	<button id="btnHeart" class="btn"></button>
<button type="button" style="width: 80px; height: 30px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reportModal">
<div style="width: 80px; height: 25px;">신고하기</div>
</button></div>
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
	<input type="hidden" value="${loginId }" >
	<input type="hidden" value="${board.boardCate }">
	<input type="hidden" value="${board.boardNo }">
		<div class="col-2">
			<input type="text" class="form-control" id="commentWriter" value="${loginNick }" readonly="readonly"/>
		</div>
		<div class="col-9">
			<textarea class="form-control" id="commentContent"></textarea>
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
</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />