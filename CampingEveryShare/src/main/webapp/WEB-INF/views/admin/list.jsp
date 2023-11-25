
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<style>
.form-control{
	display: inline-block;
    width: 236px;
    margin-top: 15px;
}
.searchDiv{
	margin-left: 756px;
	margin-bottom: 15px;
}
#type{
	width: 150px;
}
#search{
	width: 300px;
}
</style>

<script type="text/javascript">
$(() => {
	//검색 버튼 클릭
	$("#btnSearch").click(() => {
	const searchValue = $("#searchInput").val();
	const typeCategory = $("#typeCategory").val();
	
	if(!typeCategory){
		alert("검색 카테고리를 선택해주세요!");
		return false;
	}
	
	if(!searchValue){
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	console.log("검색어:", searchValue, "검색 카테고리:", typeCategory); // 확인용 로그
	location.href = "./list?search=" + searchValue + "&category=" + typeCategory;
	});

})
</script>

<script type="text/javascript">

$(() => {
	  // ...

	  $("#deleteInfoButton").click(function() {
	    // 삭제할 사용자의 아이디를 가져옴
	    var userId = $(this).data('userid');

	    // 확인 대화상자 표시
	    var isConfirmed = confirm("정말로 탈퇴시키겠습니까?");

	    if (isConfirmed) {
	      $.ajax({
	        type: "post",
	        url: "/admin/list",
	        data: {
	          userId: userId
	        },
	        success: function(response) {
	          console.log("서버 응답:", response);
	          console.log("파싱된 응답:", response);

	          if (response === "done") {
	            console.log("회원탈퇴가 성공적으로 이루어졌습니다!");
	            alert("회원탈퇴가 성공적으로 이루어졌습니다!");
	          } else if (response === "undone") {
	            console.log("회원탈퇴 실패.");
	            alert("회원탈퇴 실패, 비밀번호를 확인해주세요");
	          }
	        },
	        error: function(error) {
	          console.log("AJAX 실패")
	        }
	      });
	    }
	  });
	});
	
</script>


<div class="container">

<div class="adminpageTitle">
<h3 id=adminpageTitle>관리자 회원관리</h3>

<input type="button" value="알림" class="btn btn-outline-primary" style="float: right;" onclick="insertAlert();"><br><br>

<div id="searchDiv">
	 <select id="typeCategory" class="form-select">
        <option value="0">--전체--</option>
        <option value="1">아이디</option>
        <option value="2">이름</option>
        <option value="3">이메일</option>
    </select>
    
	<input class="form-control" type="text" id="searchInput" value="${param.search }" placeholder="조회"/>
	<button id="btnSearch" class="btn btn-primary">검색</button>
</div>

<table class="table table-striped table-hover table-sm" >
<colgroup>
	<col width="5%">
	<col width="5%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
	<col width="15%">
</colgroup>

<thead>
	<tr>
		<th><input type="checkbox" id="allCheck" name="allCheck"></th>
		<th>No.</th>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>회원상태</th>
		<th>수정</th>
		<th>관리</th>
	</tr>
</thead>
<tbody>
<c:forEach var="user" items="${list }">
	<tr> 
		<td><input type="checkbox" name="rowCheck" value="${user.USER_ID }"></td>
		<td>${user.RNUM }</td>
		<td>${user.USER_ID }</td>
		<td>${user.USER_NAME }</td>
		<td>${user.EMAIL }</td>
		<c:choose>
		<c:when test="${user.USER_STATUS == 0 }">
			<td>가입</td>
		</c:when>
		<c:when test="${user.USER_STATUS == 1 }">
			<td>탈퇴</td>
		</c:when>
		</c:choose>
		<td>
			<a href="/user/update?userId=${user.USER_ID }">
			<button type="button" class="btn btn-info">수정</button>
			</a>
		</td>
		<td>
		<button type="button" class="btn btn-warning">알림</button>
		<button id="deleteInfoButton" type="submit" class="btn btn-danger" data-userid="${user.USER_ID}">탈퇴</button>
		</td>  
	</tr>
</c:forEach>
</tbody>

</table>
<small class="float-end mb-3">total : ${paging.totalCount }</small>

</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" >
    <c:param name="url" value="./list" />
</c:import>

<c:import url="../layout/footer.jsp" />