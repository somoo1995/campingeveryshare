<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">

$(function() {
	$("#btnSend").click(function() {
		console.log("#btnSend click")
		
		$.ajax({
         type: "post"
         , url: "./message"
         , data: {
			content: $("#content").val(),
			writerId: "dain",
			receiverId: "gang",
			boardCate: 1,
			boardNo: 1
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

<div class="container">

<div class="pageTitle">
<h3 id="pageTitle">메시지</h3>
<hr>
</div>

<h4>받은 메시지</h4>

<table class="table table-hover table-sm">

<colgroup>
	<col style="width: 10%">
	<col style="width: 15%">
	<col style="width: 15%">
	<col style="width: 40%">
	<col style="width: 10%">
</colgroup>

<thead>
	<tr class="table-dark">
		<th>NO</th>
		<th>보낸사람</th>
		<th>받는사람</th>
		<th>내용</th>
		<th>보낸시간</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${rList }" var="l">
	<tr>
		<td>${l.msgNo }</td>	
		<td>${l.writerId }</td>
		<td>${l.receiverId }</td>	
		<td>${l.content }</td>
<%-- 		<td>${l.postDate }</td> --%>
		<td>
		<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
		<fmt:formatDate value="${l.postDate }" pattern="yyyyMMdd" var="post"/>
		<c:choose>
			<c:when test="${post lt current }">
				<fmt:formatDate value="${l.postDate }" pattern="yyyy-MM-dd"/>
			</c:when>
			<c:when test="${post eq current }">
				<fmt:formatDate value="${l.postDate }" pattern="HH:mm"/>
			</c:when>
		</c:choose>
		</td>	
	</tr>
	</c:forEach>
</tbody>
</table>

<hr>
<h4>보낸 메시지</h4>

<table class="table table-hover table-sm">

<colgroup>
	<col style="width: 10%">
	<col style="width: 15%">
	<col style="width: 15%">
	<col style="width: 40%">
	<col style="width: 10%">
</colgroup>

<thead>
	<tr class="table-dark">
		<th>NO</th>
		<th>보낸사람</th>
		<th>받는사람</th>
		<th>내용</th>
		<th>보낸시간</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${wList }" var="l">
	<tr>
		<td>${l.msgNo }</td>	
		<td>${l.writerId }</td>
		<td>${l.receiverId }</td>	
		<td>${l.content }</td>
<%-- 		<td>${l.postDate }</td> --%>
		<td>
		<fmt:formatDate value="<%=new Date() %>" pattern="yyyyMMdd" var="current"/>
		<fmt:formatDate value="${l.postDate }" pattern="yyyyMMdd" var="post"/>
		<c:choose>
			<c:when test="${post lt current }">
				<fmt:formatDate value="${l.postDate }" pattern="yyyy-MM-dd"/>
			</c:when>
			<c:when test="${post eq current }">
				<fmt:formatDate value="${l.postDate }" pattern="HH:mm"/>
			</c:when>
		</c:choose>
		</td>	
	</tr>
	</c:forEach>
</tbody>
</table>


<div class="col-6 mx-auto">
<textarea class="form-control" name="content" id="content" style="resize: none;" placeholder="메시지를 작성하세요"></textarea>
<button class="btn btn-secondary btn-sm mt-3 float-end" id="btnSend">전송</button>
</div>

<div class="clearfix"></div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />