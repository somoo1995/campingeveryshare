<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style type="text/css">

.review { 
 	display: none; 
 } 

.star-box {
	/* 별과 별 사이 공백 제거 */
    font-size: 0;
}

.star {
	/* width,height 적용가능하도록 변경 */
	display: inline-block;

	/* 별이 표현되는 영역 크기 */
	width: 25px;
    height: 50px;

	/* 투명한 별 표현 */
	background-image: url(/resources/img/star_empty.png);
	background-repeat: no-repeat;
}

.star_left {
	/* 왼쪽 별 */
	background-position: 0 0;
	background-size: 200%;
/* 	border: 1px solid #ccc; */
}

.star_right {
	/* 오른쪽 별 */
	background-position: 100% 0;
	background-size: 200%;
}

.on {
	/* 채워진 별로 이미지 변경 */
	background-image: url(/resources/img/star_full.png);
}

.booking-container {
	display: flex;
/*  	justify-content: space-between;  */
	align-items: center;
}

.booking-thumbnail,
.preview {
	width: 225px;
	height: 202px;
}


.booking-detail {
	margin-left: 30px;
	width: 700px;
}

.booking-btns {
	margin-top: 115px;
}

.btn {
	background-color: #228b22;
	border: none;
}

.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.3);
}

.modal-message {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 10px;
	border-radius: 5px;
    width: 20%;
    height: 180px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.modal-message p {
	font-size: 20px;
 	text-align: center;
 	margin-top: 45px;
 	margin-bottom: 35px;
 	color: #3A3A3A;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    text-align: end;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.btnModal {
	background-color: #1ABA00;
	box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.modal-btn-group {
	text-align: center;
}

.btnModal:hover {
	text-align: center;
	background-color: #228b22;
}

.btnCancelConfirm {
	margin-left: -5px;
}

.btnCancelClose {
	margin-left: 10px;
}

.btnReviewRead {
	background-color:  #efefef;
	color:  #3A3A3A;
}

</style>

<script type="text/javascript">
$(function() {
	
	var idx = 0
	var rate = 0
	
	
	//별 클릭 이벤트
	$(".star").click(function() {
		
		var rentNo = $(this).closest(".review").attr("data-no")
		var stars = $(".review[data-no='" + rentNo + "'] .star")
		
		idx = $(this).index();
		
		stars.removeClass("on")
		
		for(var i=0; i<=idx; i++) {
			stars.eq(i).addClass("on")
		}
		
		rate = (idx+1)/2
		
// 		console.log("클릭된 별의 위치 : " + idx)
// 		console.log("점수로 변환 : " + (idx+1)/2)
	})
	
	$(".btnReview").click(function() {
		var rentNo = $(this).attr("data-no")
		var reviewContainer = $(".review[data-no='" + rentNo + "']")
		reviewContainer.toggle()
	})
	
	$(".btnReviewRead").click(function() {
		var carNo = $(this).attr("data-car")
		location.href="/rent/view?carNo=" + carNo
	})
	
	$(".btnReviewWrite").click(function() {
		var rentNo = $(this).attr("data-no")
		var reviewContainer = $(".review[data-no='" + rentNo + "']")
		var content = reviewContainer.find(".content").val()
		
		if(content === "") {
			alert("내용을 작성하세요")
			return
		}
		
	      $.ajax({
	          type: "post"
	          , url: "/review/write"
	          , data: {
	        	rentNo: rentNo,
	      		content: content,
	      		rate: rate
	          }
	          , dataType: "json"
	          , success: function(  ) {
	             console.log("AJAX 성공")
				reviewContainer.toggle()
				
				$(".btnReview[data-no='" + rentNo + "']")
				.addClass("btnReviewRead btn-secondary")
				.removeClass("btnReview btn-success")
				.text("리뷰 확인")
				.click(function () {
					reviewContainer.toggle()
					var carNo = $(this).attr("data-car")
					location.href="/rent/view?carNo=" + carNo
				})
				
	          }
	          , error: function() {
	             console.log("AJAX 실패")
	          }
	       })
	})
	
})

<!-- 예약 취소 -->
$(function() {
	
	$(".btnCancelConfirm").click(function() {
		
		var userId = $(this).attr("data-id")
		var rentNo = $(this).attr("data-no")
		var carNo = $(this).attr("data-car")
		
		$.ajax({
			type: "post"
			, url: "/cancel"
			, data: {
				merchantUid: $(this).attr("data-uid"),
				rentNo: $(this).attr("data-no")
			}
			, dataType: "json"
			, success: function( data ) {
				console.log("AJAX 성공")
				sendNotification(userId, carNo)
				
				alert("취소가 완료되었습니다")
				
				if(data.status === "success"){
					loadBooking()
				}
				
			}
			, error: function(xhr, status, error) {
				console.log("AJAX 실패", status, error)
			}
		})
		
	})
	
})

function sendNotification(userId, carNo) {
    $.ajax({
        type: "post"
        , url: "/alert/sendnotification"
        , data: {
           userId: userId,
           boardCate: 1,
           boardNo: carNo,
           content: 5
        }
        , dataType: "json"
        , success: function(  ) {
           console.log("send Notification - AJAX 성공")
        }
        , error: function() {
           console.log("AJAX 실패")
        }
     })
   
     
}

// Close Modal
function closeModal() {
    document.getElementById('cancelModal').style.display = 'none'
}

// Open Modal Function
function openModal() {
    document.getElementById('cancelModal').style.display = 'block'
}

// Close Modal if Click Outside Modal Content
window.onclick = function(event) {
    var modal = document.getElementById('cancelModal')
    if (event.target === modal) {
        modal.style.display = 'none'
    }
}

</script>


<c:if test="${not empty hasData and hasData }">
<div class="bookingList mb-5">
	<c:forEach var="list" items="${list }">
	<div class="booking-container">
	<div class="booking-thumbnail">
	<img class="preview" src="/upload/${list.THUMBNAILNAME}"/>
	</div>
	<div class="booking-detail">
	<ul >
		<li style="font-size: 30px; font-weight: bold;">${list.CARNAME }</li>
		<li style="font-size: 25px;">${list.LOCATION } ${list.AREA }</li>
		<li style="font-size: 20px;">호스트 : ${list.HOSTNICK } 님</li>
		<li style="font-size: 20px;">대여 번호 : ${list.RENT_NO } </li>
		<li style="font-size: 20px;">
		<fmt:formatDate value="${list.START_DATE }" pattern="yyyy년 MM월 dd일"/> ~ <fmt:formatDate value="${list.END_DATE }" pattern="yyyy년 MM월 dd일"/>
        (
		<fmt:parseDate value="${list.END_DATE }" var="endDate" pattern="yyyy-MM-dd"/>
		<fmt:parseDate value="${list.START_DATE }" var="startDate" pattern="yyyy-MM-dd"/>
		<fmt:formatNumber value="${(endDate.time - startDate.time) / (1000 * 60 * 60 * 24)}" pattern="###"/>박
		<c:set var="night" value="${(endDate.time - startDate.time) / (1000 * 60 * 60 * 24)}"/>
		<fmt:formatNumber value="${night+1 }" pattern="###"/>일
		)
		</li>
	</ul>
	</div><!-- .booking-detail -->
		<div class="booking-btns">
		<c:choose>
			<c:when test="${paging.category == 0}">
			<button class="btn btn-success" onclick="location.href='/message/list?boardNo=${list.RENT_NO }&boardCate=1&recevierId=${list.HOSTID }&title=${list.CARNAME }&nick=${list.HOSTNICK }&profile=3'">메시지</button> 
			| <button class="btn btn-success openModalBtn" id="openModalBtn" onclick="openModal()">취소</button>
			</c:when>
			<c:when test="${paging.category == 1 }">
				<c:if test="${empty list.REVIEW }">
				<button class="btnReview mt-3 btn btn-success" id="btnReview" data-no="${list.RENT_NO }" data-car="${list.CAR_NO }">리뷰 작성</button>	
				</c:if>
				<c:if test="${not empty list.REVIEW }">
				<button class="btnReviewRead mt-3 btn btn-secondary" id="btnReviewRead" data-car="${list.CAR_NO }">리뷰 확인</button>	
				</c:if>
			</c:when>
		</c:choose>
		
		<!-- 취소 모달 -->
		<div id="cancelModal" class="modal">
		    <div class="modal-message">
		        <span class="close" onclick="closeModal()">&times;</span>
		        <p>정말 취소하시겠습니까?</p>
		        <div class="modal-btn-group">
		        <button class="btn btn-success btnModal btnCancelConfirm" data-uid="${list.MERCHANT_UID }" data-no="${list.RENT_NO }" data-id="${list.HOSTID }" data-car="${list.CAR_NO }">확인</button>
		        <button class="btn btn-success btnModal btnCancelClose" onclick="closeModal()">취소</button>
		    	</div>
		    </div>
		</div>
							
		</div><!-- .booking-btns -->
	</div><!-- .booking-container -->
				<!-- 리뷰 -->
				<div class="review" data-no="${list.RENT_NO}" >
				<div class="col-8 mx-auto" >
				<div class="form-group mb-3">
					<div class="star-box">
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					</div>
					<textarea class="content form-control" rows="4" name="content" id="content" placeholder="리뷰 작성하세요" style="resize: none;"></textarea>
					<div class="text-center mt-3"><button class="btnReviewWrite btn btn-success btn-sm" id="btnReviewWrite" data-no="${list.RENT_NO}">작성</button></div>
				</div>
				</div> 
				</div><!-- .review end -->
	<hr>
	</c:forEach>
</div>
	<c:import url="../layout/paginationAjax.jsp" />
<c:if test="${paging.totalCount gt 5 }">
</c:if>
</c:if>

<c:if test="${empty hasData or not hasData }">
<c:choose>
	<c:when test="${paging.category == 2 }">
		<div class="rentList">
			<strong>취소 내역이 없습니다!</strong><br>
			<span>캠핑카를 찾으시나요?</span><br>
			<a href="/rent/list" class="exploreButton">살펴보기</a>
		</div>
	</c:when>
	<c:when test="${paging.category == 0 or paging.category == 1 }">
		<div class="rentList">
			<strong>아직 예약된 캠핑카가 없습니다!</strong><br>
			<span>캠핑카를 찾으시나요?</span><br>
			<a href="/rent/list" class="exploreButton">살펴보기</a>
		</div>
	</c:when>
</c:choose>
</c:if>

<script type="text/javascript">

</script>
