<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.pagination {
    display: flex;
    justify-content: center;
}

.page-item {
    margin: 0 5px;
}

.page-link {
    color: #28a745; 
    background-color: #fff; 
    border: 1px solid #28a745;  
    padding: 5px 10px;
    border-radius: 3px;
    cursor: pointer;
    text-decoration: none;
}

.page-link.active {
    background-color: #218838;
     border: 1px solid #dee2e6; 
    color: #ffffff; 
}

.page-link.disabled {
    color: #6c757d; 
    background-color: #f8f9fa; 
     border: 1px solid #dee2e6; 
    cursor: not-allowed;
}

</style>
<script type="text/javascript">
$(function() {
		
	$(".page-link").css("cursor", "pointer").click(function() {
		
	      $.ajax({
	          type: "get"
	          , url: "/car/history"
	          , data: {
	        	  curPage: $(this).data("page"),
	          }
	          , dataType: "html"
	          , success: function( res ) {
	             console.log("AJAX 성공")
					$(".myHistory").html(res)
	          }
	          , error: function() {
	             console.log("AJAX 실패")

	          }
	       })
		
	})
})


</script>

<div>
	<ul class="pagination pagination-sm justify-content-center">
		<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
<!-- 			<a  class="page-link" href="./main">&larr; 처음</a> -->
			<a  class="page-link">&larr; 처음</a>
		</li>
		</c:if>
	
		<!-- 이전 페이지 리스트로 이동 -->
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
			<li class="page-item">
<%-- 				<a class="page-link" href="./main?curPage=${paging.startPage - paging.pageCount }">&laquo;</a> --%>
				<a class="page-link" data-page="${paging.startPage - paging.pageCount }">&laquo;</a>
			</li>
			</c:when>
			<c:when test="${paging.startPage eq 1 }">
			<li class="page-item">
<%-- 				<a class="page-link disabled" href="./main?curPage=${paging.startPage - paging.pageCount }">&laquo;</a> --%>
				<a class="page-link disabled" data-page="${paging.startPage - paging.pageCount }">&laquo;</a>
			</li>
			</c:when>
		</c:choose>
		
		<!-- 이전 페이지로 이동 -->
		<c:if test="${paging.curPage > 1 }">
			<li>
<%-- 				<a class="page-link" href="./main?curPage=${paging.curPage -1 }">&lt;</a> --%>
				<a class="page-link" data-page="${paging.curPage -1 }">&lt;</a>
			</li>
		</c:if>
	
		<!-- 페이징 번호 목록 -->
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.curPage eq i }">
			<li class="page-item">
				<c:choose>
				<c:when test="${not empty paging.category }">
<%-- 				<a class="page-link active" href="./main?curPage=${i }&category=${paging.category }&search=${paging.search }">${i }</a> --%>
				<a class="page-link active" data-page="${i }">${i }</a>
				</c:when>
				<c:when test="${empty paging.category }">
<%-- 				<a class="page-link active" href="./main?curPage=${i }">${i }</a> --%>
				<a class="page-link active" data-page="${i }">${i }</a>
				</c:when>
				</c:choose>
			</li>
			</c:if>
			<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<c:choose>
				<c:when test="${not empty paging.category }">
<%-- 				<a class="page-link" href="./main?curPage=${i }&category=${paging.category }&search=${paging.search }">${i }</a> --%>
				<a class="page-link" data-page="${i }">${i }</a>
				</c:when>
				<c:when test="${empty paging.category }">
<%-- 				<a class="page-link" href="./main?curPage=${i }">${i }</a> --%>
				<a class="page-link" data-page="${i }">${i }</a>
				</c:when>
				</c:choose>
			</li>
			</c:if>
		</c:forEach>
		
		<%-- 다음 페이지로 이동 --%>
    	<c:if test="${paging.curPage < paging.totalPage }">
	       <li class="page-item">
<%-- 	          <a class="page-link" href="./main?curPage=${paging.curPage + 1 }">&gt;</a> --%>
	          <a class="page-link" data-page="${paging.curPage + 1 }">&gt;</a>
	       </li>
    	</c:if>
    
    
	    <%-- 다음 페이지 리스트로 이동 --%>
	    <c:choose>
	       <c:when test="${paging.endPage ne paging.totalPage }">
	       <li class="page-item">
<%-- 	          <a class="page-link" href="./main?curPage=${paging.endPage + paging.pageCount }">&raquo;</a> --%>
	          <a class="page-link" data-page="${paging.endPage + paging.pageCount }">&raquo;</a>
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
<%-- 			<a  class="page-link" href="./main?curPage=${paging.totalPage }">끝 &rarr;</a> --%>
			<a  class="page-link" data-page="${paging.totalPage }">끝 &rarr;</a>
		</li>
		</c:if>
		
	</ul>
</div>
