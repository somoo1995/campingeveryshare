<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
	function checkDuplicate(input, url, displayBlock, emptyMessage, successMessage, failureMessage) {
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
	            if (response == "true") {
	                console.log(successMessage);
	                displayBlock.text(successMessage);
	                
	            } 
	        },
	        error: function (xhr, status, error) {
	            console.error("AJAX Error: " + status + " - " + error);
	        }
	    });
	}
	
	// id 중복 체크
	function idDupleCheck(input) {
	    checkDuplicate(
	        input,
	        "/user/idCheck/",
	        "idDupleBlock",
	        "아이디를 입력해 주세요.",
	        ""
	    );
	}
	
	// email 중복 체크
	function emailDupleCheck(input) {
	    checkDuplicate(
	        input,
	        "/user/emailCheck/",
	        "emailDupleBlock",
	        "이메일을 입력해 주세요.",
	        "", 
	        ""
	    );
	 	// 이메일이 사용 가능한 경우에만 인증 코드 발송 버튼 활성화
	    if ($("#emailDupleBlock").text() === "사용 가능한 이메일입니다.") {
	        $("#sendEmailButton").prop("disabled", true);
	    } else {
	        $("#sendEmailButton").prop("disabled", false);
	    }
	}
	
	// 이름 체크
	function nameCheck() {
	    var userName = $("#userName");
	    var nameDupleBlock = $("#nameDupleBlock");
	    console.info("nameCheck::" + userName.val().trim());
	
	    if (userName.val().trim() === '') {
	        nameDupleBlock.text("이름을 입력해 주세요.");
	        console.log("이름을 입력해 주세요.");
	        nameDupleBlock.show();
	    } else {
	        nameDupleBlock.hide();
	    }
	}
	
	function pwFind() {
        var userId = $("#userId").val();
        var userName = $("#userName").val();
        var email = $("#email").val();
        var codeInput = $("#codeInput").val();

        if (codeInput.trim() === '' || email.trim() === '' || userName.trim() === ''|| userId.trim() === '') {
            $("#pwfail").show();
            return; // 입력값이 비어 있으면 더 이상 진행하지 않음
        }else {
            $("#pwfail").hide();
		}
        
        // 서버에 아이디 찾기 요청 보내기
        $.ajax({
            type: "post",
            url: "/user/pwfind",
            data: { "email": email, "userName": userName, "userId": userId },
            dataType: "text",
            success: function (response) {
                // 이전에 추가된 결과 삭제
                $("#pwfindResult").empty();
                $("#pwReset").hide();


                if (response === "success") {
                    // 이메일과 이름 입력창 숨기기
                    $("#pwfind_userId").hide();
                    $("#pwfind_userName").hide();
                    $("#pwfind_email").hide();
                    $("#pwfind_button").hide();

                    // 비밀번호 변경페이지로 이동
	                $("#pwReset").show();

                    console.log("비밀번호 재설정 하세요")
                } else if (response === "fail") {
                	alert("아이디를 찾을 수 없습니다. 다시 시도해주세요.");
                	console.log("id틀렸대")
					
				} 
                else {
                    // 응답이 비어 있으면 사용자에게 알림 
                    alert("서버에서 알 수 없는 응답이 왔습니다.");

                }
            },

        });

	}

	function updatePassword () {

		console.log("updatePass");
		//         event.preventDefault();

        // 새 비밀번호와 비밀번호 확인 값을 가져옵니다.
		var userId = $("#userId").val();
        var newPassword = $("#userPw").val();
        var confirmPassword = $("#userPwConfirm").val();

        // 간단한 유효성 검사
        if (!newPassword || !confirmPassword || newPassword !== confirmPassword) {
            return;
        }

		console.log("updatePass2222");

        // 서버에 비밀번호 업데이트 요청을 보냅니다.
        $.ajax({
            type: "post",
            url: "./pwReset", // 실제 서버 업데이트 처리 URL로 변경해야 합니다.
            data: { "userId": userId, "userPw": newPassword },
            dataType: "text",
            success: function (response) {
            	console.log("서버 응답:",response);

                if (response === "success") {
                    alert("비밀번호가 성공적으로 업데이트되었습니다.");
                    window.location.href = "/user/login";

                } else {
                    alert("비밀번호 업데이트에 실패했습니다.");
                }
            },
            error: function () {
                alert("서버 요청 중 오류가 발생했습니다.");
            }
        });
        
		console.log("updatePass3333");
		
	}
	
	function passwordCheck() {
        var userPw = $("#userPw").val();
        var userPwConfirm = $("#userPwConfirm").val();
        var pwDupleBlock = $("#pwDupleBlock");

        pwDupleBlock.show();

        // 비밀번호가 입력되지 않았을 경우
        if (!userPw || !userPwConfirm) {
            console.log("비밀번호를 입력하세요.");
            pwDupleBlock.text("비밀번호를 입력하세요.");
            // TODO: ptag 표시
            return;
        }

        // 비밀번호가 서로 다를 경우
        if (userPw !== userPwConfirm) {
            console.log("동일한 비밀번호가 아님");
            pwDupleBlock.text("동일한 비밀번호가 아님");
            // TODO: ptag 표시
            return;
        }
        console.log("동일한 비밀번호입니다.");
        pwDupleBlock.text("");

    }
	
	//이메일 인증
	let code = ""; // 이메일 인증 저장위한 코드
	let emailPatternCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	function sendEmail() {
	    if (!emailPatternCheck.test($("#email").val())) {
	        alert("이메일 형식에 맞추어 작성하세요");
	    } else {
	        let email = $("#email").val(); // 입력한 이메일
	
	        $.ajax({
	            url: "mailSender.do",
	            type: "get",
	            data: { 'm_email': email },
	            success: function (rnum) {
	                alert("기입하신 이메일로 인증번호를 전송했습니다.");
	
	                $("#codeInput").attr("disabled", false); // 입력칸 활성화
	                code = rnum;
	            },
	            error: function () {
	                alert("에러 발생");
	            }
	        });
	    }
	}
	
	function emailVerifyCheck() {
	    let enteredCode = $("#codeInput").val();
	    let pwfind_button = $("#pwfind_button"); // 비밀번호찾기 버튼
	
	    if (code === enteredCode) {
	        // 올바른 인증 코드인 경우
	        $("#codecheck_blank").css("color", "green");
	        $("#codecheck_blank").text("인증되었습니다.");
	        pwfind_button.prop("disabled", false); // 회원가입 버튼 활성화
	    } else {
	        // 잘못된 인증 코드인 경우
	        $("#codecheck_blank").css("color", "red");
	        $("#codecheck_blank").text("인증번호를 다시 입력해주세요.");
	        pwfind_button.prop("disabled", true); // 회원가입 버튼 비활성화
	    }
	}
	
	// 비밀번호찾기 버튼 클릭 시 실행되는 함수
	function pwfind() {
	    // 이메일 인증 코드 확인
	    let enteredCode = $("#codeInput").val();
	
	    if (enteredCode === code) {
	        // 올바른 인증 코드인 경우 회원가입 처리를 진행
	        alert("인증되었습니다 새로운 비밀번호를 입력해주세요");
	        // 여기에 회원가입 처리 로직을 추가하세요.
	    } else {
	        // 잘못된 인증 코드인 경우 사용자에게 알림
	        alert("인증 코드가 올바르지 않습니다. 다시 확인해주세요.");
	        // 회원가입 처리를 진행하지 않음
	    }
	}
	
	$(document).ready(function () {
	    // 이메일, 사용자 이름, 코드 입력란에서 엔터 키를 누르면 다음 입력란으로 이동하거나 특정 액션을 수행하도록 합니다.
	    $("#userId, #userName, #email, #codeInput").keydown(function (e) {
	        if (e.which === 13) { // 13은 엔터 키의 키 코드입니다.
	            e.preventDefault(); // 기본 동작 방지

	            // 현재 포커스된 엘리먼트의 ID를 가져옵니다.
	            var currentElementId = $(this).attr("id");

	            // 다음 입력란으로 이동하거나 특정 액션 수행
	            switch (currentElementId) {
	                case "userId":
	                    $("#userName").focus();
	                    break;
	                case "userName":
	                    $("#email").focus();
	                    break;
	                case "email":
	                    // 이메일 형식 확인 및 이메일 중복 체크 수행
	                    emailDupleCheck(this);
	                    // 이메일이 사용 가능한 경우에만 인증 코드 발송 버튼 활성화
	                    if ($("#emailDupleBlock").text() === "사용 가능한 이메일입니다.") {
	                        $("#sendEmailButton").prop("disabled", false);
	                    } else {
	                        $("#sendEmailButton").prop("disabled", true);
	                    }
	                    break;
	                case "codeInput":
	                    // 인증 코드 확인 수행
	                    emailVerifyCheck();
	                    break;
	                default:
	                    break;
	            }
	        }
	    });
	 // 이메일 인증 코드 발송 버튼 클릭 시 타이머 설정
	    var emailVerificationTimer;
	    $("#sendEmailButton").click(function () {
	        // 타이머 설정 (예: 60초 동안 다시 클릭 불가능)
	        $(this).prop("disabled", true);
	        emailVerificationTimer = setTimeout(function () {
	            $("#sendEmailButton").prop("disabled", false);
	        }, 60000); // 60초
	        // 인증 코드 발송 함수 호출
	        sendEmail();
	    });
	    // 엔터 키 처리
        $("#userPw, #userPwConfirm").keydown(function (e) {
            if (e.which === 13) { // 13은 엔터 키의 키 코드입니다.
                e.preventDefault(); // 기본 동작 방지

                // 현재 포커스된 엘리먼트의 ID를 가져옵니다.
                var currentElementId = $(this).attr("id");

                // 다음 입력란으로 이동하거나 특정 액션 수행
                switch (currentElementId) {
                    case "userPw":
                        $("#userPwConfirm").focus();
                        break;
                    case "userPwConfirm":
                        // 엔터 키로 버튼 클릭 이벤트 호출
                        updatePassword();
                        break;
                    default:
                        break;
                }
            }
        }); 
	    
    });



</script>

<div class="container">
	<div class="pageTitle">
	<h3 id="pageTitle">비밀번호 찾기</h3>
	<a style="color: green; font-weight: bold;">비밀번호는 가입시 입력한 이메일을 통해 찾을 수 있습니다</a>
	</div>

<div class="col-6 mx-auto my-5">

<div class="col-md-6 input-group has-validation" id="pwfind_userId">
	<span class="border border-success-subtle input-group-text" id="basic-addon1">
	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
	</svg>
	</span>
	<div class="col-md-6 form-floating is-invalid">
		<input type="text" id="userId" name="userId" class="border border-success-subtle form-control" onblur="idDupleCheck(this)" required>
	    <label for="floatingInputGroup2">아이디*</label>
  	</div>
	<div id="idDupleBlock" class="invalid-feedback"  style="display:none">
		<p id="idDupleText"></p>
	</div>
</div>
	
<div class="input-group has-validation" id="pwfind_userName">
	<span class="border border-success-subtle input-group-text" id="basic-addon1">
	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
	</svg>
	</span>
	<div class="form-floating is-invalid">
		<input type="text" class="border border-success-subtle form-control" id="userName" name="userName" onblur="nameCheck()" required>
	    <label for="floatingInputGroup2">이름*</label>
  	</div>
	<div id="nameDupleBlock" class="invalid-feedback"  style="display:none">
		<p id="nameDupleText"></p>
	</div>
</div>



	<div class="input-group has-validation" id="pwfind_email">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		   <svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
			  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
			  <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z"/>
		   </svg>
		 </span>
		<div class="form-floating is-invalid">
          <input type="email" class="border border-success-subtle form-control" name="email" id="email" oninput="emailDupleCheck(this)" required="required">
          <label class="floatingInputGroup2">이메일*</label> 
          <button id="sendEmailButton" class="border border-success-subtle form-control btn btn-danger" type="button" value="인증코드 발송" onclick="sendEmail()" disabled="disabled">인증코드 발송</button>
	  	</div>
        <div class="border border-success-subtle form-control">
           <label class="floatingInputGroup2">인증번호*</label>
         <input type="text" class="border border-success-subtle form-control" id="codeInput" onblur="emailVerifyCheck()" required="required" disabled="disabled">
         <span class="position-absolute top-50 end-0 translate-middle-y" id="codecheck_blank" style="font-size: 15px;"></span>
          </div>
	<div id="emailDupleBlock" class="invalid-feedback" style="display: none">
	    <p id="emailDupleText"></p>
	</div>
	</div>

	<div id="pwfail" style="display: none;">
		<h5 style="color: red;">모든 정보를 입력해주세요</h5>
	</div>
	
	
	
	<div class="row mb-3 justify-content-center">
		<button class="btn btn-outline-success" onclick="pwFind()" id="pwfind_button">비밀번호 찾기</button>
	</div>	
	<div>
	
	
	<a class="btn btn-outline-success" href="./login">로그인 하러 가기</a>	
	<a class="btn btn-outline-success" href="/">메인 페이지로</a>	
	</div>

</div>

	
	<div id="pwReset" style="display:none">
		<h3>비밀번호를 재설정 해주세요</h3>
	<div class="input-group has-validation" >
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
	  	<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid">
		    <input  class="border border-success-subtle form-control" type="password" id="userPw" name="userPw" aria-describedby="passwordHelpInline" onblur="passwordCheck()" required>
		    <label for="userPw" class="col-form-label"> 비밀번호*</label>
	  	</div>
	  	<div id="pwDupleBlock" class="invalid-feedback"  style="display:none">
	    <p id="pwDupleText"></p>
		</div>
	</div>
	
	<div class="input-group has-validation" id="updatePw_userPwConfirm">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
	  	<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
		</span>
		<div class="form-floating is-invalid">
		    <input type="password" id="userPwConfirm" name="userPwConfirm" class="border border-success-subtle form-control" aria-describedby="passwordHelpInline" onblur="passwordCheck()" required>
		    <label for="userPw" class="col-form-label"> 비밀번호 확인*</label>
	  	</div>
	  	<div id="pwDupleBlock" class="invalid-feedback"  style="display:none">
	    <p id="pwDupleText"></p>
		</div>
		<div>
			<button onclick="updatePassword()" id="updatePw">비밀번호 수정하기</button>
		</div>
	</div>
	
	</div>
	

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />