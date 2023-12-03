<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

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

.rentList {
	display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px;
    font-size: 20px;
    flex-direction: column;
}

</style>

<script type="text/javascript">

$(function() {
	
	 $(".rate").each(function() {
         var rate = $(this).attr("data-rate")
         var idx = (rate * 2) - 1
         $(this).removeClass("on")
         for (var i = 0; i <= idx; i++) {
             $(this).find(".star").eq(i).addClass("on")
         }
     })
     
     $(".btnReviewDelete").click(function() {
    	 
    	 var reviewNo = $(this).attr("data-no")
		
    	 $.ajax({
    			type: "post"
    			, url: "/review/delete"
    			, data: {
    				reviewNo: reviewNo
    			}
    			, dataType: "json"
    			, success: function(  ) {
    				console.log("AJAX 성공")
    				loadReview()
    			}
    			, error: function() {
    				console.log("AJAX 실패")
    			}
    		})
    	 
    	 
	})
     

})

</script>

<div class="wrap-review">

<c:if test="${not empty list }">
<div class="mb-5">
	<c:forEach var="list" items="${list }">
	<ul>
		<li style="font-size: 25px; font-weight: bold;">${list.reviewNick }</li>
		<li style="font-size: 20px;">
		<fmt:parseDate value="${list.postDate }" var="booking" pattern="yyyy-MM-dd HH:mm"/>
		<fmt:formatDate value="${booking }" pattern="yyyy-MM-dd HH:mm"/>
		</li>
		<li class="rate" data-rate=${list.rate }>
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
		</li>
		<li style="font-size: 25px;">${list.content }</li>
		<c:if test="${list.userId eq loginId }">
		<li> <button class="btnReviewDelete btn-sm btn-light" data-no="${list.reviewNo }">삭제</button> </li>
		</c:if>
	</ul>
	<hr>
	</c:forEach>
</div>
</c:if>


<c:if test="${empty list }">
		<div class="rentList">
			<div style="font-weight: bold;">작성된 후기가 없습니다!</div>
			<div>이용 후기를 작성하시겠어요? <a href="/booking/main" class="exploreButton">내 예약</a></div>
<!-- 			<div><a href="/booking/main" class="exploreButton">내 예약</a></div> -->
		</div>
</c:if>


</div> <!-- .wrap-review end -->
