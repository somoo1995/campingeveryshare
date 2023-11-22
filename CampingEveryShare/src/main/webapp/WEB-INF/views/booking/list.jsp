<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript">

function cancel() {
	$.ajax({
	      "url": "https://api.iamport.kr/payments/cancel", // 예: http://www.myservice.com/payments/cancel
	      "type": "POST",
	      "contentType": "application/json",
	      "data": JSON.stringify({
	        "merchant_uid": "{결제건의 주문번호}", // 예: ORD20180131-0000011
	        "cancel_request_amount": 2000, // 환불금액
	        "reason": "테스트 결제 환불" // 환불사유
	        "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
	        "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
	        "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
	      }),
	      "dataType": "json"
	    });
}

</script>


<c:if test="${not empty hasData and hasData }">
<div class="bookingList mb-5">
	<c:forEach var="list" items="${list }">
	<ul>
		<li style="font-size: 30px; font-weight: bold;">${list.CARNAME }</li>
		<li style="font-size: 25px;">${list.LOCATION } ${list.AREA }</li>
		<li style="font-size: 20px;">호스트 : ${list.HOSTNICK } 님</li>
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
			<li class="mt-3"> <button class="btn btn-sm btn-success">메시지</button> | <button class="btn btn-sm btn-success">취소</button> </li>
			</c:when>
			<c:when test="${param.status == 'history' }">
			<li class="mt-3 btn btn-sm btn-success">리뷰</li>
			</c:when>
		</c:choose>
	</ul>
	<hr>
	</c:forEach>
</div>
<c:import url="../layout/listpagination.jsp" />
</c:if>

<c:if test="${empty hasData or not hasData }">
		<div class="rentList">
			<strong>아직 예약된 캠핑카가 없습니다!</strong><br>
			<span>캠핑카를 찾으시나요?</span><br>
			<a href="링크URL" class="exploreButton">살펴보기</a>
		</div>
</c:if>
