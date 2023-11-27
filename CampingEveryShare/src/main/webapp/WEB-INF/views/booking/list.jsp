<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<!-- <script -->
<!--   src="https://code.jquery.com/jquery-3.3.1.min.js" -->
<!--   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" -->
<!--   crossorigin="anonymous"></script> -->

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
</style>

<script type="text/javascript">
$(function() {
	
	var idx = 0
	var rate = 0
	
	//별 클릭 이벤트
	$(".star").click(function() {
		
		//클릭된 별이 몇 번째 칸인지 알아내기
		idx = $(this).index();
		
		//모두 투명하게 만들기
		$(".star").removeClass("on")
		
		//클릭이 된 곳까지 채워진 별로 만들기
		for(var i=0; i<=idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		
		rate = (idx+1)/2
		
		console.log("클릭된 별의 위치 : " + idx)
		console.log("점수로 변환 : " + (idx+1)/2)
	})
	
	
	$(".btnReview").click(function() {
		var rentNo = $(this).attr("data-no")
		var reviewContainer = $(".review[data-no='" + rentNo + "']")
		reviewContainer.toggle()
	})
	
	$("#btnReviewWrite").click(function() {
		
		console.log("review click - rate : " + rate)
		
	      $.ajax({
	          type: "post"
	          , url: "/rent/review/write"
	          , data: {
	        	rentNo: $(this).attr("data-no"),
	      		content: $("#content").val(),
	      		rate: rate
	          }
	          , dataType: "json"
	          , success: function(  ) {
	             console.log("AJAX 성공")
				$("#content").val('')
				
	          }
	          , error: function() {
	             console.log("AJAX 실패")
	          }
	       })
	})
	
})
</script>


<script type="text/javascript">

$(function() {
	
	$(".btnCancel").click(function() {
		
		console.log($(this).attr("data-uid"))
		
		$.ajax({
			type: "post"
			, url: "/cancel"
			, data: {
				merchantUid: $(this).attr("data-uid"),
				rentNo: $(this).attr("data-no")
			}
			, dataType: "json"
			, success: function( res ) {
			console.log("AJAX 성공")
			
			}
			, error: function() {
			console.log("AJAX 실패")
			}
		})
		
	})
	
})

</script>


<c:if test="${not empty hasData and hasData }">
<div class="bookingList mb-5">
	<c:forEach var="list" items="${list }">
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
		<fmt:formatNumber value="${night+1 }" pattern="###"/>일 )
		</li>
<%-- 		<li>${list.END_DATE - list.START_DATE }</li> --%>
<!-- 		<li> -->
<!-- 		예약일 :  -->
<%-- 		<fmt:parseDate value="${list.BOOKING_DATE }" var="booking" pattern="yyyy-MM-dd HH:mm"/> --%>
<%-- 		<fmt:formatDate value="${booking }" pattern="yyyy-MM-dd HH:mm"/> --%>
<!-- 		</li> -->
		<c:choose>
			<c:when test="${empty param.status || param.status == 'now'}">
			<li class="mt-3"> <button class="btn btn-sm btn-success">메시지</button> | <button class="btn btn-sm btn-success btnCancel" data-uid="${list.MERCHANT_UID }" data-no="${list.RENT_NO }">취소</button> </li>
			</c:when>
			<c:when test="${param.status == 'history' }">
			<li class="btnReview mt-3 btn btn-sm btn-success" id="btnReview" data-no="${list.RENT_NO }">리뷰</li>	
			</c:when>
		</c:choose>
	</ul>
	
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
					<textarea class="form-control" rows="4" name="content" id="content" placeholder="리뷰 작성하세요" style="resize: none;"></textarea>
					<div class="text-center mt-3"><button class="btn btn-dark btn-sm" id="btnReviewWrite" data-no="${list.RENT_NO}">작성</button></div>
				</div>
				</div> 
				</div><!-- .review end -->
	
	<hr>
	</c:forEach>
</div>
<c:if test="${paging.totalCount gt 5 }">
	<c:import url="../layout/paginationAjax.jsp" />
</c:if>
</c:if>

<c:if test="${empty hasData or not hasData }">
		<div class="rentList">
			<strong>아직 예약된 캠핑카가 없습니다!</strong><br>
			<span>캠핑카를 찾으시나요?</span><br>
			<a href="/rent/list" class="exploreButton">살펴보기</a>
		</div>
</c:if>
