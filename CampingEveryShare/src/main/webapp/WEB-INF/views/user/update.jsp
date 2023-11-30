<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="../layout/header.jsp" />
<style>
.hstack {
    display: flex;
    align-items: center;
    align-self: stretch;
    justify-content: flex-end;
}
</style>
<style>

.container {
    min-width: 1300px;
    /* margin-left: -10px; */
    /* margin-right: 0px; */
    /* background-color: pink; */
    display: grid;
    padding: 0px;
}

    
div.profile-container {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    justify-content: stretch;
    grid-column-gap: 40px;
    margin-bottom: 20px;
    margin-left: 25px;
}

div.profileGroup {
	border-radius: 70%;
}
div.profileImg {
	width: 200px;
	height: 200px;
	border-radius: 70%;
  	overflow: hidden;  
    outline: 3px solid #2cb9789e;
    margin-bottom: 20px;
}


#profile {
	margin-left: 100px;
    margin-top: 10px;
    
}

[type="radio"] {
  vertical-align: middle;
  appearance: none;
  border: max(2px, 0.1em) solid gray;
  border-radius: 50%;
  width: 1.25em;
  height: 1.25em;
}

[type="radio"]:checked {
  border: 0.4em solid #2ecc71;
}

div.inputForm_all {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(50%, auto));
}

div.inputForm {
    display: grid;
    grid-template-columns: 100px auto;
    grid-template-rows: 100px;
    margin: 5px;
    padding: 0px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(232 247 235 / 92%);
    color: #2cb978;
    margin-bottom: 10px;
    padding-bottom: 10px;
}

div.inputImg {
	display: grid;
    grid-row-start: 1;
    grid-row-end: 3;
    grid-column-start: 1;
    grid-column-end: 2; 
    width: 70px;
    margin: 10px;
    height: 70px;
}

div.button {
    min-width: 1290px;
    margin-bottom: 10px;
    margin-top: 10px;
    outline: 3px solid #7cd4ab;
    border-radius: 15px;

}

div.input {
  display: grid;
  grid-template-columns: 0.5fr 1.5fr);
  font-size: 30px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(232 247 235);

}


div.inputLabel {
    grid-column-start: 1;
    grid-column-end: 2;
    grid-row-start: 1;
    grid-row-end: 2;
}
div.inputText {
    grid-column-start: 1;
    grid-column-end: 3;
    grid-row-start: 2;
    grid-row-end: 32;
}
div.inputDuple {
    grid-column-start: 2;
    grid-column-end: 3;
    grid-row-start: 1;
    grid-row-end: 2;
    font-size: 20px;
    color:red;
}


input {
    width: 500px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(254 254 254 / 95%);
    color: #05502d;
    margin-left: 10px;
    font-weight: bold;
    
}

 input[disabled] {
    background-color: #e8f7eb; 
  }

label {
    font-weight: bold;
    font-style: revert;
    font-size: 20px;
}

.failureMessage {
    color: red !important;
}

.successMessage {
    color: green !important;
}

</style>

<script type="text/javascript">

	 function checkDuplicate(input, url, displayBlock, emptyMessage, successMessage, failureMessage, ) {
	        var value = input.value;
	        var displayBlock = $("#" + displayBlock);

	        console.info("checkDuplicate::" + value);

	        displayBlock.show();

	        if (value.trim() == '') {
	            displayBlock.text(emptyMessage);
	            console.log(emptyMessage);
	            return;
	        }

	        $.ajax({
	            type: "get",
	            url: url + value,
	            dataType: "text",
	            success: function (response) {
	                console.log(response);
	                if (response === "false") {
	                    console.log(failureMessage);
	                    displayBlock.text(failureMessage).css("color", "red"); // 실패메시지
	                } else {
	                    console.log(successMessage);
	                    displayBlock.text(successMessage).css("color", "green");	//성공메시지
	                }
	            },
	            error: function (xhr, status, error) {
	                console.error("AJAX Error: " + status + " - " + error);
	                displayBlock.text(errorMessage).css("color", "red"); // errorMessage
	            }
	        });
	    }

	    $(document).ready(function () {
		    // 사용자의 프로필 값을 가져옴
		    var userProfile = "${updateUser.profile}";
		
		    // 프로필 값을 가지는 라디오 버튼을 체크
		    $("input[name='profile'][value='" + userProfile + "']").prop("checked", true);
	    	
			$("#updateButton").click(function () {
	            // phone 인풋의 값이 비어있으면 0을 넣어줌
	            if ($("#phone").val().trim() === '') {
	                $("#phone").val('0');
	            }

	            // 비밀번호 값을 가져오는 부분 수정
	            var userPw = $("#userPw").val();
	            var userPwConfirm = $("#userPwConfirm").val();

	            // 비밀번호가 서로 다를 경우
	            if (userPw !== userPwConfirm) {
	                console.log("동일한 비밀번호가 아님");
	                $("#pwDupleBlock").text("동일한 비밀번호가 아님");
	                alert("동일한 비밀번호가 아닙니다");
	                // TODO: ptag 표시
	                return false;
	            }
	            
	            var passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;

	            if (!passwordRegex.test(userPw)) {
	                console.log("안전한 비밀번호를 입력하세요.");
	                // TODO: 비밀번호 관련 메시지 표시
	                alert("비밀번호를 형식에 맞게 입력해주세요");
	                return false;
	            }


	        });
	    });

	    function passwordCheck() {
	    	// 최소 8자 이상, 최소 하나의 숫자와 특수 문자를 포함하는 비밀번호 정규식
	    	var passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;

	        var userPw = $("#userPw").val();
	        var userPwConfirm = $("#userPwConfirm").val();
	        var pwDupleBlock = $("#pwDupleBlock");

	        pwDupleBlock.show();

	        // 비밀번호가 입력되지 않았을 경우
	        if (!userPw || !userPwConfirm) {
	            console.log("비밀번호를 입력하세요.");
	            pwDupleBlock.text("비밀번호를 입력하세요.");
	            // TODO: ptag 표시
	            return false;
	        }

	        // 비밀번호가 서로 다를 경우
	        if (userPw !== userPwConfirm) {
	            console.log("동일한 비밀번호가 아님");
	            pwDupleBlock.text("동일한 비밀번호가 아님");
	            // TODO: ptag 표시
	            return false;
	        }

	        // 비밀번호가 정규식과 일치하는지 확인
	        if (!passwordRegex.test(userPw)) {
	            console.log("안전한 비밀번호를 입력하세요.");
	            pwDupleBlock.text("대소문자 알파벳과 숫자, 특수 문자 중에서 8자 이상의 비밀번호를 작성해주세요");
	            // TODO: ptag 표시
	            return false;
	        }

	        console.log("동일한 안전한 비밀번호입니다.");
	        pwDupleBlock.text("");
	    }

</script>

<form id="update" action="/user/update" method="post">
<div class="container">
	<div class="pageTitle">
	<h3 id="pageTitle">회원정보 수정</h3>
	<hr>	
	</div>
		
<div class="updateform">

	<div class="profile-container">
        <div class="profileGroup">
        <div class="profileImg">
		   <img src="/resources/img/profile1.jpg" alt="프로필1" id="profile-img-1" width="200" height="200">
		</div>
		   <input  id="profile" type="radio" name="profile" value="1" >
        </div>
        <div class="profileGroup">
        <div class="profileImg">
		   <img src="/resources/img/profile2.jpg" alt="프로필2" id="profile-img-2" width="200" height="200">
		</div>
		   <input  id="profile"  type="radio" name="profile" value="2" >
        </div>
        <div class="profileGroup">
        <div class="profileImg">
		   <img src="/resources/img/profile3.jpg" alt="프로필3" id="profile-img-3" width="200" height="200">
		</div>
		   <input  id="profile"  type="radio" name="profile" value="3" >
        </div>
        <div class="profileGroup">
        <div class="profileImg">
		   <img src="/resources/img/profile4.jpg" alt="프로필4" id="profile-img-4" width="200" height="200">
		</div>
		   <input  id="profile"  type="radio" name="profile" value="4" >
        </div>
        <div class="profileGroup">
        <div class="profileImg">
		   <img src="/resources/img/profile5.jpg" alt="프로필5" id="profile-img-5" width="200" height="200">
		</div>
		   <input  id="profile"  type="radio" name="profile" value="5" >
        </div>
	</div>
	
	<div class="inputForm_all">
		

	<div class="inputForm">
		<div class="inputImg">
		<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
		</svg>
		</div>
		<div class="input">
		    <label for="floatingInputGroup2">아이디*</label>
			<input id="userId" name="userId" type="text" value="${updateUser.userId }"  disabled>
	  	</div>
		<div class="inputDuple" id="idDupleBlock" style="display:none">
			<p id="idDupleText"></p>
		</div>
	</div>
			
	<div class="inputForm">
		<div class="inputImg">	
		<svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
		</svg>
		</div>
		<div class="input">
		    <label>이름*</label>
			<input type="text"  id="userName" name="userName" onblur="nameCheck()" value="${updateUser.userName }" disabled>
	  	</div>
	</div>

	<div class="inputForm">
		<div class="inputImg">	
		   <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
			  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
			  <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z"/>
		   </svg>
		 </div>
		<div class="input">
		    <label >이메일*</label>
			<input type="email" id="email" name="email" onblur="emailDupleCheck(this)" value="${updateUser.email }" disabled>
	  	</div>
		<div class="inputDuple" id="emailDupleBlock"  style="display:none">
			<p id="emailDupleText"></p>
		</div>
	</div>
	

	<div class="inputForm">
		<div class="inputImg">	
		<svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
		</svg>
		</div>
		<div class="input">
		    <label>닉네임*</label>
			<input  type="text" id="userNick" name="userNick" onblur="nickDupleCheck(this)" value="${updateUser.userNick }" disabled>
	  	</div>
		<div class="inputDuple" id="nickDupleBlock" style="display:none">
			<p id="nickDupleText"></p>
		</div>
	</div>
	
	
<c:if test="${not fn:contains(loginId, '.k')}">
	<div class="inputForm">
		<div class="inputImg">		
		<svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
	  	<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
		</div>
		<div class="input">
		<div class="inputLabel">
		    <label> 비밀번호*</label>
		</div>
		<div class="inputText">
		    <input type="password" id="userPw" name="userPw" value="${updateUser.userPw }" aria-describedby="passwordHelpInline" onblur="passwordCheck()" required>
		</div>
	  	<div class="inputDuple pwDupleBlock" id="pwDupleBlock" style="display:none">
		    <p id="pwDupleText"></p>
		</div>
		</div>
	</div>
</c:if>

<c:if test="${not fn:contains(loginId, '.k')}">
	
	<div class="inputForm">
		<div class="inputImg">	
		<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
	  	<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
		</div>
		<div class="input">
		<div class="inputLabel">
		    <label>비밀번호 확인*</label>
		</div>
	  	<div class="inputDuple pwDupleBlock" id="pwDupleBlock" style="display:none">
		    <p id="pwDupleText"></p>
		</div>
		<div class="inputText">
		    <input type="password" id="userPwConfirm" name="userPwConfirm" value="${updateUser.userPw }" aria-describedby="passwordHelpInline" onblur="passwordCheck()" required >
		</div>
	  	</div>
	</div>
	</c:if>	
	
	<div class="inputForm">
		<div class="inputImg">	
		<svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
		  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
		  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
		</svg>
		</div>
		<div  class="input">
		    <label>주소</label>
			<input  type="text" id="address" name="address" value="${updateUser.address }" >
	  	</div>
	</div>
		
	
	<div class="inputForm">
		<div class="inputImg">	
		<svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
		  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
		  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
		</svg>
		</div>
		<div class="input">
		    <label>상세주소</label>
			<input  type="text" id="addressDetail" name="addressDetail" value="${updateUser.addressDetail }">
	  	</div>
	</div>

	
	<div class="inputForm">
		<div class="inputImg">	
		<svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
	 		<path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
		</svg>
		</div>
		<div class="input">
		    <label>생년월일 8자리</label>
			<input  type="date" id="birth" name="birth" value="${updateUser.birth }" >
	  	</div>
	</div>
	
	<div class="inputForm">
		<div class="inputImg">	
		<svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" viewBox="0 0 16 16">
		  <path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
		  <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		</svg>
		</div>
		<div class="input">
		    <label>연락처 +82</label>
			<input  type="number" id="phone" name="phone" value="${updateUser.phone }">
	  	</div>
	</div>
	
	
	</div><!--div class="inputForm_all" -->

	<div class="button">
		<a href="/"  class="border-success-subtle form-control btn btn-outline-success">메인페이지</a>
	</div>
	<div class="button">
		<button id="updateButton" type="submit" class="border-success-subtle form-control btn btn-outline-success">회원정보 수정 완료</button>
	</div>
		
		
	</div> <!-- form -->
	</div><!--  container -->
</form>



<c:import url="../layout/footer.jsp" />