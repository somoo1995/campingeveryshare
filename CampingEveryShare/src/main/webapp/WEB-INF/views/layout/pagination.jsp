<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty param.search }">
   <c:set var="searchParam" value="&search=${param.search }" />
</c:if>
<c:if test="${not empty param.category }">
    <c:set var="typeParam" value="&type=${param.category }" />
</c:if>

<div>
   <ul class="pagination pagination-sm justify-content-center">
      <c:if test="${paging.curPage ne 1 }">
      <li class="page-item">
         <a  class="page-link" href="${url}?curPage=1${searchParam }${typeParam}">&larr; 처음</a>
      </li>
      </c:if>
   
      <!-- 이전 페이지 리스트로 이동 -->
      <c:choose>
         <c:when test="${paging.startPage ne 1 }">
         <li class="page-item">
            <a class="page-link" href="${url}?curPage=${paging.startPage - paging.pageCount }${searchParam }${typeParam}">&laquo;</a>
         </li>
         </c:when>
         <c:when test="${paging.startPage eq 1 }">
         <li class="page-item">
            <a class="page-link disabled" href="${url}?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
         </li>
         </c:when>
      </c:choose>
      
      <!-- 이전 페이지로 이동 -->
      <c:if test="${paging.curPage > 1 }">
         <li>
            <a class="page-link" href="${url}?curPage=${paging.curPage -1 }${searchParam }${typeParam}">&lt;</a>
         </li>
      </c:if>
   
      <!-- 페이징 번호 목록 -->
      <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
         <c:if test="${paging.curPage eq i }">
         <li class="page-item">
            <a class="page-link active" href="${url}?curPage=${i }${searchParam }${typeParam}">${i }</a>
         </li>
         </c:if>
         
         <c:if test="${paging.curPage ne i }">
         <li class="page-item">
            <a class="page-link" href="${url}?curPage=${i }${searchParam }${typeParam}">${i }</a>
         </li>
         </c:if>
      </c:forEach>
      
      <%-- 다음 페이지로 이동 --%>
       <c:if test="${paging.curPage < paging.totalPage }">
          <li class="page-item">
             <a class="page-link" href="${url}?curPage=${paging.curPage + 1 }${searchParam }${typeParam}">&gt;</a>
          </li>
       </c:if>
    
    
       <%-- 다음 페이지 리스트로 이동 --%>
       <c:choose>
          <c:when test="${paging.endPage ne paging.totalPage }">
          <li class="page-item">
             <a class="page-link" href="${url}?curPage=${paging.endPage + paging.pageCount }${searchParam }${typeParam}">&raquo;</a>
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
         <a  class="page-link" href="${url}?curPage=${paging.totalPage }${searchParam }${typeParam}">끝 &rarr;</a>
      </li>
      </c:if>
      
   </ul>
</div>