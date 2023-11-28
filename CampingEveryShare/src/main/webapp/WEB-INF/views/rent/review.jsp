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

})

</script>

<div class="wrap-review">

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
		<li> <button class="btn-sm btn-dark">삭제</button> </li>
		</c:if>
	</ul>
	<hr>
	</c:forEach>
</div>



<%-- <c:if test="${empty hasData or not hasData }"> --%>
<!-- 		<div class="rentList"> -->
<!-- 			<strong>아직 예약된 캠핑카가 없습니다!</strong><br> -->
<!-- 			<span>캠핑카를 찾으시나요?</span><br> -->
<!-- 			<a href="링크URL" class="exploreButton">살펴보기</a> -->
<!-- 		</div> -->
<%-- </c:if> --%>


</div> <!-- .wrap-review end -->
