<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

div.button {
	min-width: 1300px;
	margin-bottom: 10px;
    margin-top: 10px;

}

div.inputForm_all {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(50%, auto));
}


</style>

<script type="text/javascript">

function checkDuplicate(input, url, displayBlockId, emptyMessage, successMessage, failureMessage, errorMessage) {
    var value = input.value;
    var displayBlock = $("#" + displayBlockId); // displayBlock 변수명 수정

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

// id 중복 체크
function idDupleCheck(input) {
    // 정규식
    var idRegex = /^[a-zA-Z0-9_]{4,8}$/;

 // 입력된 아이디가 정규식과 일치하는지 확인
    if (!idRegex.test(input.value)) {
        // 정규식과 일치하지 않을 때 처리 (예: 메시지 출력, 기타 로직 수행)
        var displayBlock = $("#" + "idDupleBlock"); // 여기에서 displayBlock을 가져옵니다.
        displayBlock.show();
        displayBlock.text("아이디는 최소4글자 최대8글자까지 가능 합니다.").css("color", "red");
        return;
    } else {
        // 정규식과 일치할 때 처리 (예: 중복 체크 계속 진행)
        checkDuplicate(
            input,
            "/user/idCheck/",
            "idDupleBlock",
            "아이디를 입력해 주세요.",
            "사용가능한 아이디 입니다",
            "사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.",
        );
    }


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
	//input값이 이메일 형태에 맞을때에만 중복 체크를 진행한다.
	 if (!emailPatternCheck.test($("#email").val())) {
		return;
	 }
	
	
    checkDuplicate(
        input,
        "/user/emailCheck/",
        "emailDupleBlock",
        "이메일을 입력해 주세요.",
        "사용가능한 이메일입니다",
        "이미 등록된 이메일입니다"
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
    
    // 닉네임 중복 체크
    function nickDupleCheck(input) {
        // 정규식: 최대 8글자
        var nickRegex = /^.{1,8}$/;

     // 입력된 아이디가 정규식과 일치하는지 확인
        if (!nickRegex.test(input.value)) {
            // 정규식과 일치하지 않을 때 처리 (예: 메시지 출력, 기타 로직 수행)
            var displayBlock = $("#" + "nickDupleBlock"); // 여기에서 displayBlock을 가져옵니다.
            displayBlock.show();
            displayBlock.text("닉네임은 최대8글자까지 가능 합니다.").css("color", "red");
            return;
        } else {
            // 정규식과 일치할 때 처리 (예: 중복 체크 계속 진행)
            checkDuplicate(
                input,
                "/user/nickCheck/",
                "nickDupleBlock",
                "닉네임을 입력해 주세요.",
                "사용가능한 닉네임 입니다",
                "사용할 수 없는 닉네임 입니다. 다른 닉네임을 입력해 주세요."
            );
        }
    }
    
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
            return;
        }

        // 비밀번호가 서로 다를 경우
        if (userPw !== userPwConfirm) {
            console.log("동일한 비밀번호가 아님");
            pwDupleBlock.text("동일한 비밀번호가 아님");
            // TODO: ptag 표시
            return;
        }

        // 비밀번호가 정규식과 일치하는지 확인
        if (!passwordRegex.test(userPw)) {
            console.log("안전한 비밀번호를 입력하세요.");
            pwDupleBlock.text("대소문자 알파벳과 숫자, 특수 문자 중에서 8자 이상의 비밀번호를 작성해주세요");
            // TODO: ptag 표시
            return;
        }

        console.log("동일한 안전한 비밀번호입니다.");
        pwDupleBlock.text("");
    }
	//회원가입시 필수입력란이 비어있을경우 회원가입 못하게 막아주기
	function join() {
	    // 필수 항목들의 값을 가져옵니다.
	    var profile = $("#profile").val(); // 프로필 사진
	    var userId = $("#userId").val(); // 아이디
	    var userPw = $("#userPw").val(); // 비밀번호
	    var userPwConfirm = $("#userPwConfirm").val(); // 비밀번호 확인
	    var email = $("#email").val(); // 이메일
	    var codeInput = $("#codeInput").val(); // 인증번호
	    var userName = $("#userName").val(); // 이름
	    var userNick = $("#userNick").val(); // 닉네임
	    var birth = $("#birth").val(); // 생년월일
	    var address = $("#address").val(); // 주소
	    var addressDetail = $("#addressDetail").val(); // 상세주소
	    var phone = $("#phone").val(); // 연락처

	    // 필수 항목 중 하나라도 비어있다면 가입 불가능
	    if (!profile || !userId || !userPw || !userPwConfirm || !email || !codeInput || !userName || !userNick) {
	        alert("필수 항목을 모두 입력하세요.");
	        return;
	    }
		
	    // 이메일 인증 코드 확인
	    if (codeInput !== code) {
	        alert("인증 코드가 올바르지 않습니다. 다시 확인해주세요.");
	        return;
	    }
	    
	    $.ajax({
            url: "/user/join",
            type: "post",
            data: { 'profile': profile, 
            		'userId': userId,
            		'userPw': userPw,
            		'email': email,
            		'userName': userName,
            		'userNick': userNick,
            		'birth': birth,
            		'address': address,
            		'addressDetail': addressDetail,
            		'phone': phone
            		},
            success: function (result) {
            	console.log(result);
            	if (result === "true"){
            	window.location.href ="/user/login"
            	
                alert("회원가입이 완료되었습니다.");
            		
            	} else {
                alert("회원가입이 실패하였습니다.");
				}

            },
            error: function () {
            	window.location.href ="/user/join"
                alert("회원가입이 실패하였습니다.");
            }
        });

	}
	
    $(document).ready(function () {

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
	   
	    $("#joinButton").click(function () {
            // 중복 클릭 방지
            if ($(this).prop("disabled")) {
                return;
            }

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
                // TODO: ptag 표시
                return;
            }

            // 아이디와 비밀번호에 대한 정규식 체크
            var userId = $("#userId").val();
    	    var userNick = $("#userNick").val(); // 닉네임
            var idRegex = /^[a-zA-Z0-9_]{4,8}$/;
            var passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;
            var nickRegex = /^.{1,8}$/;
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

            if (!idRegex.test(userId)) {
                console.log("아이디는 최소 4글자 최대 8글자까지 가능합니다.");
                // TODO: id 관련 메시지 표시
                return;
            }

            if (!passwordRegex.test(userPw)) {
                console.log("대소문자 알파벳과 숫자, 특수 문자 중에서 8자 이상의 비밀번호를 작성해주세요");
                // TODO: 비밀번호 관련 메시지 표시
                return;
            }

            if (!nickRegex.test(userNick)) {
                console.log("닉네임은 최대 8글자입니다");
                // TODO: 닉네임 관련 메시지 표시
                return;
            }

            // 이메일 인증 코드 확인
            var codeInput = $("#codeInput").val();
            if (codeInput !== code) {
                console.log("인증 코드가 올바르지 않습니다. 다시 확인해주세요.");
                // TODO: 인증 코드 관련 메시지 표시
                return;
            }

            // 이메일 정규식 체크
            var email = $("#email").val();
            if (!emailRegex.test(email)) {
                console.log("이메일 형식에 맞추어 작성하세요.");
                // TODO: 이메일 관련 메시지 표시
                return;
            }

         // join 함수 호출
            join();
        });
    });

</script>



<!-- <form id="joinForm" action="/user/join" method="post"> -->
<div class="container">
	<div class="pageTitle">
		<h3 id="pageTitle">회원가입</h3>
		<hr>
	</div>



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


	<div class="col-md-6 input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-person"
				viewBox="0 0 16 16">
			<path
					d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
		</svg>
		</span>
		<div class="col-md-6 form-floating is-invalid">
			<input type="text" id="userId" name="userId"
				class="border border-success-subtle form-control"
				onblur="idDupleCheck(this)" required> <label
				for="floatingInputGroup2">아이디*</label>
		</div>
		<div id="idDupleBlock" class="invalid-feedback" style="display: none">
			<p id="idDupleText"></p>
		</div>
	</div>
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-person"
				viewBox="0 0 16 16">
			<path
					d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
		</svg>
		</span>
		<div class="form-floating is-invalid">
			<input type="text" id="userNick" name="userNick"
				class="border border-success-subtle form-control"
				onblur="nickDupleCheck(this)" required> <label
				for="floatingInputGroup2">닉네임*</label>
		</div>
		<div id="nickDupleBlock" class="invalid-feedback"
			style="display: none">
			<p id="nickDupleText"></p>
		</div>
	</div>
	


	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-key"
				viewBox="0 0 16 16">
	  	<path
					d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z" />
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
		</svg>
		</span>
		<div class="form-floating is-invalid">
			<input type="password" id="userPw" name="userPw"
				class="border border-success-subtle form-control"
				aria-describedby="passwordHelpInline" onblur="passwordCheck()"
				required> <label for="userPw" class="col-form-label">비밀번호*</label>
		</div>
		<div id="pwDupleBlock" class="invalid-feedback" style="display: none">
			<p id="pwDupleText"></p>
		</div>
	</div>

	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-key"
				viewBox="0 0 16 16">
	  	<path
					d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z" />
	 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
		</svg>
		</span>
		<div class="form-floating is-invalid">
			<input type="password" id="userPwConfirm" name="userPwConfirm"
				class="border border-success-subtle form-control"
				aria-describedby="passwordHelpInline" onblur="passwordCheck()"
				required> <label for="userPw" class="col-form-label">비밀번호
				확인*</label>
		</div>
		<div id="pwDupleBlock" class="invalid-feedback" style="display: none">
			<p id="pwDupleText"></p>
		</div>
	</div>

	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text" id="basic-addon1"> 
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
			  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z" />
			  <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z" />
		</svg>
		</span>
		
		<div class="form-floating is-invalid">
			<input type="email" class="border border-success-subtle form-control" name="email" id="email" oninput="emailDupleCheck(this)" required="required"> 
			<label class="floatingInputGroup2">이메일*</label>
			<button id="sendEmailButton" class="border border-success-subtle form-control btn btn-danger" type="button" value="인증코드 발송" disabled="disabled">인증코드 발송</button>
		</div>
		
		<div class="border border-success-subtle form-control">
			<span class="position-absolute top-50 end-0 translate-middle-y" id="codecheck_blank" style="font-size: 15px;"></span> 
			<label class="floatingInputGroup2">인증번호*</label> 
			<input type="text" class="border border-success-subtle form-control" id="codeInput" onblur="emailVerifyCheck()" required="required" disabled="disabled">
		</div>
		
		<div id="emailDupleBlock" class="invalid-feedback" style="display: none">
			<p id="emailDupleText"></p>
		</div>
	</div>
	
	
	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-person"
				viewBox="0 0 16 16">
			<path
					d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
		</svg>
		</span>
		<div class="form-floating is-invalid">
			<input type="text" class="border border-success-subtle form-control"
				id="userName" name="userName" onblur="nameCheck(this)" required>
			<label for="floatingInputGroup2">이름*</label>
		</div>
		<div id="nameDupleBlock" class="invalid-feedback"
			style="display: none">
			<p id="nameDupleText"></p>
		</div>
	</div>

	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor"
				class="bi bi-calendar-heart" viewBox="0 0 16 16">
	 		<path fill-rule="evenodd"
					d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input type="date" id="birth" name="birth"
				class="border border-success-subtle form-control"> <label
				for="floatingInputGroup2">생년월일 8자리</label>
		</div>
	</div>

	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-house-fill"
				viewBox="0 0 16 16">
		  <path
					d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
		  <path
					d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input type="text" id="address" name="address"
				class="border border-success-subtle form-control"> <label
				for="floatingInputGroup2">주소</label>
		</div>
	</div>


	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-house-fill"
				viewBox="0 0 16 16">
		  <path
					d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
		  <path
					d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input type="text" id="addressDetail" name="addressDetail"
				class="border border-success-subtle form-control"> <label
				for="floatingInputGroup2">상세주소</label>
		</div>
	</div>

	<div class="input-group has-validation">
		<span class="border border-success-subtle input-group-text"
			id="basic-addon1"> <svg xmlns="http://www.w3.org/2000/svg"
				width="50" height="40" fill="currentColor" class="bi bi-phone"
				viewBox="0 0 16 16">
		  <path
					d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z" />
		  <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
		</svg>
		</span>
		<div class="form-floating is-invalid birth">
			<input type="number" id="phone" name="phone"
				class="border border-success-subtle form-control"> <label
				for="floatingInputGroup2">연락처</label>
		</div>
	</div>
	
	</div><!--inputForm_all  -->

	<div class="button">
		<button id="joinButton"
			class="border-success-subtle form-control btn btn-outline-success">캠핑
			시작하기</button>
	</div>


</div>
<!-- form -->
</div>
<!--  container -->
<!-- </form> -->



<c:import url="../layout/footer.jsp" />