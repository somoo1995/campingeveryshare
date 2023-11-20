<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>
<c:if test="${not empty param.category }">
    <c:set var="categoryParam" value="&category=${param.category}" />
</c:if>

<div>
	<ul class="pagination pagination-sm justify-content-center">
		<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
			<a  class="page-link" href="./report?curPage=1${searchParam }${categoryParam}">&larr; 처음</a>
		</li>
		</c:if>
	
		<!-- 이전 페이지 리스트로 이동 -->
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
			<li class="page-item">
				<a class="page-link" href="./report?curPage=${paging.startPage - paging.pageCount }${searchParam }${categoryParam}">&laquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.startPage eq 1 }">
			<li class="page-item">
				<a class="page-link disabled" href="./report?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
			</li>
			</c:when>
		</c:choose>
		
		<!-- 이전 페이지로 이동 -->
		<c:if test="${paging.curPage > 1 }">
			<li>
				<a class="page-link" href="./report?curPage=${paging.curPage -1 }${searchParam }${categoryParam}">&lt;</a>
			</li>
		</c:if>
	
		<!-- 페이징 번호 목록 -->
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.curPage eq i }">
			<li class="page-item">
				<a class="page-link active" href="./report?curPage=${i }${searchParam }${categoryParam}">${i }</a>
			</li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="./report?curPage=${i }${searchParam }${categoryParam}">${i }</a>
			</li>
			</c:if>
		</c:forEach>
		
		<%-- 다음 페이지로 이동 --%>
    	<c:if test="${paging.curPage < paging.totalPage }">
	       <li class="page-item">
	          <a class="page-link" href="./report?curPage=${paging.curPage + 1 }${searchParam }${categoryParam}">&gt;</a>
	       </li>
    	</c:if>
    
    
	    <%-- 다음 페이지 리스트로 이동 --%>
	    <c:choose>
	       <c:when test="${paging.endPage ne paging.totalPage }">
	       <li class="page-item">
	          <a class="page-link" href="./report?curPage=${paging.endPage + paging.pageCount }${searchParam }${categoryParam}">&raquo;</a>
	       </li>
	       </c:when>
	       <c:when test="${paging.endPage eq paging.totalPage }">
	       <li class="page-item">
	          <a class="page-link disabled">&raquo;</a>
	       </li>
	       </c:when>
	    </c:choose>
		
		<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item">
			<a  class="page-link" href="./report?curPage=${paging.totalPage }${searchParam }${categoryParam}">끝 &rarr;</a>
		</li>
		</c:if>
		
	</ul>
</div>
