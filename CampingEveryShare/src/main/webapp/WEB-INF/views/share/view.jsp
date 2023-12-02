<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

$(()=>{
	
	$(".btnHeart").click(()=>{
		console.log(${isHeart})
		console.log($(event.currentTarget).attr("data-no"));	
		var targetNo = $(event.currentTarget).attr("data-no");
		console.log(targetNo);
		
		$.ajax({
			type: "get"
			, url: "/market/heart"
			, data: { 
				userId : "${loginId}",
                heartNo: $(event.currentTarget).attr("data-no"),
                boardNo: $(event.currentTarget).attr("data-no"),
                boardCate: $(event.currentTarget).attr("data-cate")
 			}
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");
					console.log(data)
	
				if (data.hResult == true) { // 찜 성공
				    console.log("찜성공");
				    var targetImg = $('.btnHeart[data-no="' + targetNo + '"] img');
				    targetImg.attr('src', '/resources/img/heartOn.png');
				} else { // 찜 취소 성공
				    console.log("찜취소");
				    var targetImg = $('.btnHeart[data-no="' + targetNo + '"] img');
				    targetImg.attr('src', '/resources/img/heartNone.png');
				}
				
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnHeart").click() end

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

//신고
$(() => {
    if (${isReport}) {
        $("#reportbtn")
//             .addClass("btn-danger")
            .html('🚨신고 완료')
            .prop("disabled", true); // 버튼 비활성화
    } else {
        $("#reportbtn")
//             .addClass("btn-primary")
            .html('🚨신고')
            .click(() => { // 클릭 이벤트 추가
                $.ajax({
                    type: "get",
                    url: "/market/report",
                    data: {
                        ruserId: "${loginId}",
                        boardNo: ${board.boardNo},
                        boardCate: ${board.boardCate}
                    },
                    dataType: "json",
                    success: function (data) {
                        console.log("성공");
                        $("#reportbtn")
//                             .removeClass("btn-primary")
//                             .addClass("btn-warning")
                            .html('🚨신고 완료')
                            .prop("disabled", true); // 버튼 비활성화
                    },
                    error: function () {
                        console.log("실패");
                    }
                }); //ajax end
            });
    }
});


</script>



<style type="text/css">
.content {
	min-height: 300px;
}

.view_container {
/*    background-color: pink; */
   max-width: 1300px;
   
}

.wr {
   padding-left: 30px;
   padding-right: 30px;
/*    background-color: aqua; */
   border: 1px solid #C7C8C9;
   border-radius: 30px;
   padding-bottom: 20px;
}

.status_1 {
    background-color: #1ABA00; 
    width: 100px; 
    height: 40px; 
    color: #fff; 
    font-weight: bold; 
     text-align: center;  
    border-radius: 60px; 
    margin-top: 10px; 
    padding: 5px; 
    font-size: 19px;
    font-weight: bold;
}

.status_2 {
     background-color: #B4B4B4;  
    width: 100px; 
    height: 40px; 
    color: #fff; 
    font-weight: bold; 
     text-align: center;  
    border-radius: 60px; 
    margin-top: 10px; 
    padding: 5px; 
    font-size: 19px;
    font-weight: bold;
}

.title {
/*     background-color: aquamarine;  */
   display: flex;
/*    flex-direction: row-reverse; */
/*    flex-direction: column; */
   
}

.title_1 {
   max-width: 1137px;
   font-weight: bold;
   font-size: 40px;
   flex: 1;
   overflow: hidden;
}

.subtitle {
/*     background-color: antiquewhite;  */
   display: flex;
/*    flex-direction: row; */
/*    align-items: center; */
   margin-top: 10px;
}

/*프로필*/


.question {
   background-color: #1ABA00;
   color: #fff;
   font-weight: bold;
   width: 80px;
   border-radius: 60px;
    text-align: center; 
   margin-left: 10px;
   padding-top: 4px;
}

.question:hover {
   background-color: #1ba604;
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

.user_info {
   color: #7A7A7A;
   font-size: 20px;
/*    margin-left: 20px; */
}

.user_nick {
/*    font-weight: bold; */
   color: #000;
}

.show_profile {
/*     background-color: pink;  */
   display: flex;
   align-items: center;
}

.writer_info {
/*     background-color: green;  */
   display: flex;
   flex-direction: row;
}

.user_con {
/*     background-color: magenta;  */
   display: flex;
   flex-direction: row;
}

.board_info {
   font-size: 20px;
/*    margin-left: 20px; */
   min-width: 950px;
}

.file {
   border: 1px solid #C7C8C9;
   display: flex;
   align-items: center;
   padding: 30px;
   margin-top: 30px;
   margin-bottom: 30px;
   width: 800px;   
}

.file_list {
   margin-left: 30px;
}

.btnRecom {
   width: 100px;
   height: 50px;
   border: none;
   border-radius: 30px;
   background-color: #5cc93f;
/*    border: 1px solid gray; */
   padding: 10px;
   color: #fff;
   padding: 10px;
   font-weight: bold;
}

.btnHeart {
   width: 100px;
   height: 50px;
   border: none;
   border-radius: 30px;
   background-color: #ff7c7c;
/*    border: 1px solid gray; */
   padding: 10px;
   color: #fff;
   padding: 10px;
   font-weight: bold;
   margin-left: 10px;
}

.btn_list {
	display: flex;
	justify-content: center;
}

.recomm_containers {
   background_color: pink;
   display: grid;
   grid-template-columns: 1fr 1fr;
   max-width: 150px;
   text-align: center;
   border: 1px solid #C7C8C9;
   padding: 10px;
   border-radius: 20px;
}

.recommImage {
   cursor: pointer;
}

.recomm_cnt {
   font-weight: bold;
   font-size: 40px;
/*    margin-left: -50px; */
}

.recomm_fin {
   display: grid;
   justify-content: center;
}

.file_fin {
   display: grid;
   justify-content: center;
}

.list_fin {
   display: grid;
   justify-content: end;
}

.list {
   background-color: #B4B4B4; 
   width: 80px;
   height: 40px;
   border-radius: 10px; 
    text-align: center; 
/*     margin-left: 719px; */
    padding: 5px;
    max-width: 1300
}

.list:hover {
   background-color: #8d8d8d;
}

 .list_a { 
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    font-size: 20px;
 } 

.report {
   display: grid;
   justify-content: end;
   margin-top: 10px;
   
}

.report_btn {
   border: none;
   background-color: #fff;
}
   
.other_info {
   display: grid;
}

.free {
	background-color: #D7FFE9; 
    width: 100px; 
    height: 40px; 
    color: #1ABA00;
    font-weight: bold; 
    text-align: center;  
    border-radius: 60px; 
    margin-top: 10px; 
    padding: 5px; 
    font-size: 19px;
    font-weight: bold;
}

.free_not {
    background-color: #FFE4E4; 
    width: 100px; 
    height: 40px; 
    color: #FF0000; 
    font-weight: bold; 
     text-align: center;  
    border-radius: 60px; 
    margin-top: 10px; 
    padding: 5px; 
    font-size: 19px;
    font-weight: bold;	
}

.not_login {
	display: grid;
	justify-content: center;
}

.not_1 {
	margin-bottom: 10px;
	border: none;
    background-color: #a5c3ff;
    color: #fff;
    font-weight: bold;
    padding: 10px;
    border-radius: 60px;	
}

.not_2 {
	border: none;
    background-color: #c0c0c0;
    color: #fff;
    font-weight: bold;
    padding: 10px;
    border-radius: 60px;
    margin-bottom: 30px;
}

	

</style>

<div class="view_container">

<!-- 작성 공간 -->
<!-- <div class="pageTitle"> -->

<!-- <h3 style="color: #1ABA00; font-weight: 600; font-size: 40px; margin-bottom: 20px;">공유 게시글</h3> -->
<h3 style="color: forestgreen; font-weight: 600; font-size: 40px; margin-bottom: 20px;">공유 게시글</h3>
<!-- <h6 style="color: #A4A4A4; font-weight: 200; font-size: 20px;">모집 게시글을 조회합니다.</h6> -->
<!-- <hr> -->

<div class="wr">

<!-- 본문 내용 -->
<div class="title">

   <div class="title_1">
         
         <c:if test="${board.location eq 10}">[강원]</c:if>
          <c:if test="${board.location eq 9}">[경기]</c:if>
           <c:if test="${board.location eq 16}">[경남]</c:if>
          <c:if test="${board.location eq 15}">[경북]</c:if>
          <c:if test="${board.location eq 5}">[광주]</c:if>
          <c:if test="${board.location eq 6}">[대구]</c:if>
          <c:if test="${board.location eq 3}">[대전]</c:if>
          <c:if test="${board.location eq 4}">[부산]</c:if>
          <c:if test="${board.location eq 1}">[서울]</c:if>
          <c:if test="${board.location eq 8}">[세종]</c:if>
          <c:if test="${board.location eq 7}">[울산]</c:if>
          <c:if test="${board.location eq 2}">[인천]</c:if>
          <c:if test="${board.location eq 14}">[전남]</c:if>
          <c:if test="${board.location eq 13}">[전북]</c:if>
          <c:if test="${board.location eq 17}">[제주]</c:if>
          <c:if test="${board.location eq 12}">[충남]</c:if>
          <c:if test="${board.location eq 11}">[충북]</c:if>
           ${board.title }<br>
          </div><!-- .title_1 -->
          
		<!-- 가격 --> 
			<c:choose>
			    <c:when test="${share.paid eq 2}">
			        <div class="free">무료</div>
			    </c:when>
			    <c:when test="${share.paid eq 3}">
			        <div class="free_not">유료</div>
			    </c:when>
			</c:choose>
          
</div><!-- .title -->
   
   <div class="subtitle">
   <div class="show_profile">
   <!-- 프로필 사이즈 가로 세로 각각 100px -->   
<!--    <img alt="profile" src="../resources/img/profile1.jpg" width="100px" height="100px" > -->

   <div class="other_info">
   <div class="writer_info">
   <div class="user_info">
   <span class="user_nick">${user.userNick }</span> @${board.userId }
   </div><!-- .user_info -->

   <div class="question">1:1 문의
   </div><!-- .question -->
   </div><!-- .writer_info -->

   <div class="user_con">
   <div class="board_info">   
      <fmt:formatDate value="${board.postDate }" pattern="yyyy-MM-dd hh:mm"/>   
      조회 ${board.hit }
   </div><!-- .board_info -->
   </div><!-- .user_con -->
   </div><!-- .other_info -->

   <c:if test="${loginId eq board.userId}">
   <div class="edit">
   <a class="edit_a" href="./update?boardNo=${board.boardNo }">수정</a>
   </div><!-- .edit -->
   
   <div class="delete">
   <a class="delete_a" href="./delete?boardNo=${board.boardNo }">삭제</a>
   </div><!-- .delelte -->
   </c:if>   

   </div><!-- .show_profile -->
      </div><!-- .subtitle -->
        <hr>
   <div class="content">     
       ${board.content }  
       </div><!-- .content -->
<div class="file_fin">
<c:if test="${not empty boardFile}">
    <div class="file">
        📁
        <div class="file_list">    
            <c:forEach var="boardFile" items="${boardFile}">
                <a href="../upload/${boardFile.storedName}" download="${boardFile.originName}">
                    ${boardFile.originName}<br>
                </a>
            </c:forEach>
        </div><!-- .file_list -->   
    </div><!-- .file -->
</c:if>
</div><!-- .file_fin -->

<!-- 추천 -->
<div class="btn_list">
<div class="recom_list">
<button id="btnRecom" class="btnRecom">
<!--     <img src="../resources/img/recomm_before.png" alt="Recomm Image" width="64px" height="64px"> -->
</button>
<div><p id=recom style="font-weight: bold; text-align: center;">${totalCnt }</p></div>
</div><!-- .recom_list -->

<!-- 찜 -->
<button id="btnHeart" class="btnHeart">
<%-- 	<p>${HEARTID}</p> --%>
<%-- 	<p id=heart style="font-weight: bold;">${board.HEART }</p> --%>
</button>

</div><!-- .btn_list -->
<%-- <p>추천수</p> <p id=recom>${totalCnt }</p> --%>


<div class="list_fin">
<div class="list">
<a class="list_a" href="./list">목록</a>
</div><!-- .list -->
</div><!-- .list_fin -->

<!-- 신고 -->
<div class="report">
   <!-- 신고 -->
   <c:if test="${not (empty loginId or loginId eq board.userId)}">
       <button data-bs-toggle="modal" data-bs-target="#deleteUserModalGroup" class="btn" id="reportbtn"></button>
   </c:if>
</div><!-- .report -->
</div><!-- .wr -->
</div><!-- .view_container -->
<hr>

	<!-- 비로그인상태 -->
	<div class="not_login">
	<c:if test="${not isLogin }">
	<strong style="font-weight: bold;">로그인이 필요합니다</strong><br>
	<button class="not_1" onclick='location.href="/user/login";'>로그인</button>
	<button class="not_2" onclick='location.href="/user/join";'>회원가입</button>
	</c:if>
	</div><!-- .not_login -->
	
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

<c:import url="../layout/modal.jsp" />
<c:import url="../layout/footer.jsp" />

