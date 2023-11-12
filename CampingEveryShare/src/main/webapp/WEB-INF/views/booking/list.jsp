<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="bookingList mb-5">
	<c:forEach var="list" items="${list }">
	<ul>
		<li style="font-size: 30px; font-weight: bold;">${list.CARNAME }</li>
		<li style="font-size: 25px;">${list.LOCATION } ${list.AREA }</li>
		<li style="font-size: 20px;">호스트 : ${list.HOSTNICK } 님</li>
		<li style="font-size: 20px;">
		<fmt:formatDate value="${list.START_DATE }" pattern="yyyy년 MM월 dd일"/> ~ <fmt:formatDate value="${list.END_DATE }" pattern="yyyy년 MM월 dd일"/>
<!-- 		</li> -->
<!-- 		<li> -->
        <%-- 날짜 차이 계산 --%>
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
	</c:forEach>
</div>

