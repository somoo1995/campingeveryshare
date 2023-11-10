<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

.pagination {
    display: inline-block;
}

.pagination a {
 	color: black; 
 	float: left; 
 	padding: 8px 16px; 
 	text-decoration: none; 
 	transition: background-color .3s;
}

.current-page {
    background-color: #2ECC71;
    color: #fff;
}

.current-page a {
	color: white; /* 폰트 색상 변경 */
}

.pagination a.active { 
background-color: #4CAF50; 
color: white; 
 } 

/* 호버 - 밑줄 삭제 */
.pagination a:hover {
	border: none;
}

</style>


<div style="display: flex; justify-content: center;">
	
	<ul>
    <c:if test="${paging.curPage ne 1 }">
        <li class="pagination">
            <a href="/group/list">&larr; 처음</a>
        </li>
    </c:if>

    <c:choose>
        <c:when test="${paging.startPage ne 1 }">
            <li class="pagination">
                <a href="/group/list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
            </li>
        </c:when>
        <c:when test="${paging.startPage eq 1 }">
            <li class="pagination">
                <a>&laquo;</a>
            </li>
        </c:when>
    </c:choose>

    <c:if test="${paging.curPage > 1 }">
        <li class="pagination">
            <a href="./list?curPage=${paging.curPage - 1 }">&lt;</a>
        </li>
    </c:if>

    <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
        <c:if test="${paging.curPage eq i }">
            <li class="pagination current-page">
                <a href="./list?curPage=${i }">${i }</a>
            </li>
        </c:if>

        <c:if test="${paging.curPage ne i }">
            <li class="pagination">
                <a href="./list?curPage=${i }">${i }</a>
            </li>
        </c:if>
    </c:forEach>

    <c:if test="${paging.curPage < paging.totalPage }">
        <li class="pagination">
            <a href="./list?curPage=${paging.curPage + 1 }">&gt;</a>
        </li>
    </c:if>

    <c:choose>
        <c:when test="${paging.endPage ne paging.totalPage }">
            <li class="pagination">
                <a href="/group/list?curPage=${paging.endPage + paging.pageCount }">&raquo;</a>
            </li>
        </c:when>
        <c:when test="${paging.endPage eq paging.totalPage }">
            <li class="pagination">
                <a>&raquo;</a>
            </li>
        </c:when>
    </c:choose>

    <c:if test="${paging.curPage ne paging.totalPage }">
        <li class="pagination">
            <a href="/group/list?curPage=${paging.totalPage }">끝 &rarr;</a>
        </li>
    </c:if>
</ul>
	
</div>