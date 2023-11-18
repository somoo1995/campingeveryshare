<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.list-container {
    height: 530px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
	overflow: hidden; 
    border: 1px solid #D3D3D3;
    border-right: 1px solid #D3D3D3;
}

.list-container:hover {
	cursor: pointer;
}

.preview {
	margin: 15px auto 15px auto;
	width: 350px;
	height: 300px;
	display: flex;
	object-fit: cover;
	justify-content: center;
	align-items: center;
	background-size: cover; 
	background-repeat: no-repeat;
	background-position: center center;
}

</style>

<script type="text/javascript">
</script>

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">대여</h3>
</div>


<div class="col-2 mb-3 float-end">

<select class="form-select">
	<option selected="selected">지역</option>
	<option value="1">서울</option>
	<option value="2">인천</option>
</select>

<input type="date" class="form-control">

</div>

<div class="clearfix"></div>

<c:forEach items="${list }" var="car" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
  
	<div class="list-container" onclick="location.href='/rent/view?carNo=${car.carNo }'">
		<br>
		<br>
		<img class="preview" src="/resources/img/noimg.png"/>
		가격 : ${car.price }<br>
		차이름 : ${car.carName }<br>
		위치 : ${car.location } ${car.area }<br>
		인원수 : ${car.carPax }
	</div>
	
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
    </div> <!-- .row end -->
  </c:if>
	
</c:forEach>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />