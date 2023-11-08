<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<style>
.container{
	width: 1300px;
}
.msgmain {
  display: flex; /* 자식 요소들을 나란히 배치하도록 설정 */
  border: 1px solid;
  width: 1300px;
  min-height: 800px; /* 내용에 따라 늘어나도록 최소 높이 설정 */		 	
}
.msglist {
  border: 1px solid;
  width: 400px; /* 필요에 따라 너비 조절 */
  flex-shrink: 0; /* div가 줄어들지 않도록 설정 */
}
.msgcontent {
  border: 1px solid;
  width: 600px;
  flex-shrink: 0; /* div가 줄어들지 않도록 설정 */
}
.msgprofile{
border: 1px solid;
flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */


}
.container{
	width: 1300px;
	margin-left: -10px;
	margin-right: 0px;
}
</style>
<!-- 작성 공간 -->
<div class="container">

<div class="pageTitle">
<h3 id="pageTitle">메세지</h3>
<hr style="width: 1300px;">
</div>
<div class="msgmain">
<div class="msglist">
</div>
<div class="msgcontent">
</div>
<div class="msgprofile">
</div>
</div>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />