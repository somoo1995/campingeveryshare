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
</style>
<script type="text/javascript">
	function checkDuplicate(input, url, displayBlockId, emptyMessage, successMessage, failureMessage) {
	    var value = input.value;
	    var displayBlock = $("#" + displayBlockId);
	
	    console.info("checkDuplicate::" + value);
	
	    displayBlock.show();
	
	    if (value.trim() === '') {
	        displayBlock.text(emptyMessage);
	        console.log(emptyMessage);
	        return;
	    }
	
	    $.ajax({
	        type: "get",
	        url: url + value,
	        dataType: "text",
	        success: function (response) {
	            if (response === "true") {
	                console.log(successMessage);
	                displayBlock.text(successMessage);
	            } else {
	                console.log(failureMessage);
	                displayBlock.text(failureMessage);
	            }
	        }
	    });
	}
	
	//이메일 인증
	let code = ""; // 이메일 인증 저장위한 코드
	let emailPatternCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	function sendEmail() {
		console.log("sendEmailFunctionStart")
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
	    let idfind_button = $("#idfind_button"); // 아이디찾기 버튼
	
	    if (code === enteredCode) {
	        // 올바른 인증 코드인 경우
	        $("#codecheck_blank").css("color", "green");
	        $("#codecheck_blank").text("인증되었습니다.");
	        idfind_button.prop("disabled", false); // 아이디찾기 버튼 활성화
	    } else {
	        // 잘못된 인증 코드인 경우
	        $("#codecheck_blank").css("color", "red");
	        $("#codecheck_blank").text("인증번호를 다시 입력해주세요.");
	        idfind_button.prop("disabled", true); // 아이디찾기 버튼 비활성화
	    }
	}
	
	
	// 이메일 중복 체크
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


	$(document).ready(function () {
		// 이메일 입력란에서 Enter 키를 누를 때 이름 작성 칸으로 포커스 이동
	    $("#email").keypress(function (e) {
	        if (e.which === 13) { // 13은 Enter 키의 키 코드입니다.
	            e.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

	            // userName 입력란으로 포커스 이동
	            $("#userName").focus();
	        }
	    });

	    // userName 입력란에서 Enter 키를 누를 때 아이디 찾기 버튼 클릭
	    $("#userName").keypress(function (e) {
	        if (e.which === 13) { // 13은 Enter 키의 키 코드입니다.
	            e.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

	            // 아이디 찾기 버튼 클릭
	            $("#idfind_button").click();
	        }
	    });
		$("#idfind_button").on("click", function (event) {
	    	//중복 클릭 방지
	    	if($(this).prop("disabled")){
	    		return;
	    	}
	    	
	        event.preventDefault(); // 기본 동작 방지
	        $(this).prop("disabled", true); // 버튼 비활성화
	        // 이메일과 이름 입력값 가져오기
	        var email = $("#email").val();
	        var userName = $("#userName").val();
	        var codeInput = $("#codeInput").val(); 


	        // 간단한 유효성 검사
	        if (codeInput.trim() === '' || email.trim() === '' || userName.trim() === '') {
	            return; // 입력값이 비어 있으면 더 이상 진행하지 않음
	        }

	        // 서버에 아이디 찾기 요청 보내기
	        $.ajax({
	            type: "post",
	            url: "./idfind",
	            data: { "email": email, "userName": userName },
	            dataType: "text",
	            success: function (response) {
	            	// 이전에 추가된 결과 삭제
	                $("#idfindResult").empty();
	            	
	                // 응답이 비어 있지 않으면
	                if (response.trim() !== "") {
	                    // 이메일과 이름 입력창 숨기기
	                    $("#idfind_email").hide();
	                    $("#idfind_userName").hide();
	                    $("#idfind_button").hide();

	                    // 찾은 아이디를 보여주기
	                    var resultHtml = "<h3>아이디는 " + response + "입니다</h3>";
	                    $("#idfindResult").after(resultHtml);

	                    // 결과 부분을 보여줌
	                    $("#idfindResult").show();
	                    console.log("찾은 아이디:" + response);
	                } else {
	                    // 응답이 비어 있으면 사용자에게 알림
	                    alert("아이디를 찾을 수 없습니다. 다시 시도해주세요.");
	                }
	            },
	        });
	    });
		 // 이메일 인증 코드 발송 버튼 클릭 시 타이머 설정
	    var emailVerificationTimer;
	    $("#sendEmailButton").click(function () {
	    	console.log("#sendEmailButtonClickEventStart")
	        // 타이머 설정 (예: 60초 동안 다시 클릭 불가능)
	        sendEmail();
	        $(this).prop("disabled", true);
	        emailVerificationTimer = setTimeout(function () {
	            $("#sendEmailButton").prop("disabled", false);
	        }, 60000); // 60초
	        // 인증 코드 발송 함수 호출
	    });
	});


</script>
<div class="container">
	<div class="pageTitle">
	<h3 id="pageTitle">아이디 찾기</h3>
	<a style="color: green; font-weight: bold;">아이디는 가입시 입력한 이메일을 통해 찾을 수 있습니다</a>
	</div>
<div class="idfind-form col-6 mx-auto my-5">
<!-- <form id="idfind" action="./idfind" method="POST" name="idfind"> -->


	<div class="input-group has-validation" id="idfind_email">
		<span class="border border-success-subtle input-group-text" id="basic-addon1">
		   <svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
			  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
			  <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z"/>
		   </svg>
		 </span>
		<div class="form-floating is-invalid">
          <input type="email" class="border border-success-subtle form-control" name="email" id="email" oninput="emailDupleCheck(this)" required="required">
          <label class="floatingInputGroup2">이메일*</label> 
          <button id="sendEmailButton" class="border border-success-subtle form-control btn btn-danger" type="button" value="인증코드 발송"  disabled="disabled">인증코드 발송</button>
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
	
	<div class="input-group has-validation" id="idfind_userName" >
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
	
	<div id="idfindResult">
	</div>


	<div class="row mb-3 justify-content-center" id="idfind_button">
		<button class="btn btn-outline-success" id="idfind">아이디 찾기</button>
	</div>	

	<div>
	<a class="btn btn-outline-success" href="/">메인 페이지로</a>
	</div>	
	<div>
	<a id="pwfind">비밀번호를 분실 하셨나요? <a class="btn btn-outline-success" href="./pwfind">비밀번호 찾기</a> </a>	
	</div>
<!-- </form> -->
</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />