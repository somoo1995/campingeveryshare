<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="bookingList">
	<c:forEach var="list" items="${list }">
	<ul>
		<li>${list.CARNAME }</li>
		<li>${list.LOCATION } ${list.AREA }</li>
		<li>호스트 : ${list.HOSTNICK }</li>
		<li>
		출발 : <fmt:formatDate value="${list.START_DATE }" pattern="yyyy-MM-dd"/>
		</li>
		<li>
		도착 : <fmt:formatDate value="${list.END_DATE }" pattern="yyyy-MM-dd"/>
		</li>
		<li>
		예약일 : 
		<fmt:parseDate value="${list.BOOKING_DATE }" var="booking" pattern="yyyy-MM-dd HH:mm"/>
		<fmt:formatDate value="${booking }" pattern="yyyy-MM-dd HH:mm"/>
		</li>
	</ul>
	</c:forEach>
</div>
