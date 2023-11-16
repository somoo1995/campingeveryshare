<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<style>
.hstack {
    display: flex;
    align-items: center;
    align-self: stretch;
    justify-content: flex-end;
}

.form-check-input:checked {
    background-color: #2ecc71;
    border-color: #78cc71;
}
</style>

<script type="text/javascript">

$(document).ready(function() {
    // 사용자의 프로필 값을 가져옴
    var userProfile = "${login.profile}";

    // 프로필 값을 가지는 라디오 버튼을 체크
    $("input[name='profile'][value='" + userProfile + "']").prop("checked", true);
});

</script>

<form id="view" action="/user/view" method="post">
<div class="container">
	<div class="pageTitle">
	<h3 id="pageTitle">마이페이지</h3>
	<hr>	
	</div>
		
	<div class="col-md-6 input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
        <div class="p-2">
            <ul>
                <li>
                    <label for="profile" class="col-form-label" width="200" height="150">프로필 사진*</label>
                </li>
            </ul>
        </div>
        <ul>
            <li>
		   <img src="/resources/img/profile1.png" alt="프로필1" class="profile1" id="profile-img-1" width="190" height="150">
            </li>
            <li>       
		   <input class="form-check-input" type="radio" name="profile" value="1" disabled>
            </li>
        </ul>
        <ul>
            <li>
		   <img src="/resources/img/profile2.png" alt="프로필2" class="profile2" id="profile-img-2" width="190" height="150">
            </li>
            <li>       
		   <input class="form-check-input" type="radio" name="profile" value="2" disabled>
            </li>
        </ul>
        <ul>
            <li>
		   <img src="/resources/img/profile3.png" alt="프로필3" class="profile3" id="profile-img-3" width="190" height="150">
            </li>
            <li>       
		   <input class="form-check-input" type="radio" name="profile" value="3" disabled>
            </li>
        </ul>
        <ul>
            <li>
		   <img src="/resources/img/profile4.png" alt="프로필4" class="profile4" id="profile-img-4" width="190" height="150">
            </li>
            <li>       
		   <input class="form-check-input" type="radio" name="profile" value="4" disabled>
            </li>
        </ul>
        <ul>
            <li>
		   <img src="/resources/img/profile5.png" alt="프로필5" class="profile5" id="profile-img-5" width="190" height="150">
            </li>
            <li>       
		   <input class="form-check-input" type="radio" name="profile" value="5" disabled>
            </li>
        </ul>
		</span>
	</div>
		
	<div class="col-md-6 input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
		</svg>
		</span>
		<div class="col-md-6 form-floating is-invalid">
			<input class="border border-success-subtle form-control" id="userId" name="userId" type="text" value="${login.userId }"  disabled>
		    <label for="floatingInputGroup2">이름*</label>
	  	</div>
		<div id="idDupleBlock" class="valid-feedback"  style="display:none">
			<p id="idDupleText"></p>
		</div>
	</div>
	
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
	  	<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid">
		    <input  class="border border-success-subtle form-control" type="password" id="userPw" name="userPw" aria-describedby="passwordHelpInline" disabled>
		    <label for="userPw" class="col-form-label"> 비밀번호*</label>
	  	</div>
	  	<div id="pwDupleBlock" class="valid-feedback"  style="display:none">
	    <p id="pwDupleText"></p>
		</div>
	</div>
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
	  	<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid">
		    <input type="password" id="userPwConfirm" name="userPwConfirm" class="border border-success-subtle form-control" aria-describedby="passwordHelpInline" onblur="passwordCheck()" disabled>
		    <label for="userPw" class="col-form-label">비밀번호 확인*</label>
	  	</div>
	  	<div id="pwDupleBlock" class="valid-feedback"  style="display:none">
	    <p id="pwDupleText"></p>
		</div>
	</div>
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		   <svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
			  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
			  <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z"/>
		   </svg>
		 </span>
		<div class="form-floating is-invalid">
			<input type="email" id="email" name="email" class="border border-success-subtle form-control" onblur="emailDupleCheck(this)" value="${login.email }" disabled>
		    <label for="floatingInputGroup2">이메일*</label>
	  	</div>
		<div id="emailDupleBlock" class="valid-feedback"  style="display:none">
			<p id="emailDupleText"></p>
		</div>
	</div>
	
		
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid">
			<input type="text" class="border border-success-subtle form-control" id="userName" name="userName" onblur="nameCheck()" value="${login.userName }" disabled>
		    <label for="floatingInputGroup2">이름*</label>
	  	</div>
		<div id="nameDupleBlock" class="valid-feedback"  style="display:none">
			<p id="nameDupleText"></p>
		</div>
	</div>
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid">
			<input  type="text" id="userNick" name="userNick" class="border border-success-subtle form-control" onblur="nickDupleCheck(this)" value="${login.userNick }" disabled>
		    <label for="floatingInputGroup2">닉네임*</label>
	  	</div>
		<div id="nickDupleBlock" class="valid-feedback"  style="display:none">
			<p id="nickDupleText"></p>
		</div>
	</div>
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-calendar-heart" viewBox="0 0 16 16">
	 		<path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input  type="date" id="birth" name="birth" class="border border-success-subtle form-control" value="${login.birth }" disabled>
		    <label for="floatingInputGroup2">생년월일 8자리</label>
	  	</div>
	</div>
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
		  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
		  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input  type="text" id="address" name="address" class="border border-success-subtle form-control" value="${login.address }" disabled>
		    <label for="floatingInputGroup2">주소</label>
	  	</div>
	</div>
		
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
		  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
		  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input  type="text" id="addressDetail" name="addressDetail" class="border border-success-subtle form-control" value="${login.addressDetail }" disabled>
		    <label for="floatingInputGroup2">상세주소</label>
	  	</div>
	</div>
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-phone" viewBox="0 0 16 16">
		  <path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
		  <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input  type="number" id="phone" name="phone" class="border border-success-subtle form-control" value="${login.phone }" disabled>
		    <label for="floatingInputGroup2">연락처</label>
	  	</div>
	</div>
		
	<div class="form-floating is-invalid birth">
		<a href="/"  class="border-success-subtle form-control btn btn-outline-success">메인페이지</a>
		<a href="/user/update"  class="border-success-subtle form-control btn btn-outline-success">회원정보 수정</a>
	</div>
		
		
	</div> <!-- form -->
	</div><!--  container -->
</form>



<c:import url="../layout/footer.jsp" />