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
                } else {
                    console.log(failureMessage);
                    displayBlock.text(failureMessage);
                }
            }
        });
    }

    // id 중복 체크dd
    function idDupleCheck(input) {
        checkDuplicate(
            input,
            "/user/idCheck/",
            "idDupleBlock",
            "아이디를 입력해 주세요.",
            "존재하지 않는 아이디입니다. 회원가입 후 진행해주세요.",
            ""
        );
    }

	    function passwordCheck() {
        var userPw = $("#userPw").val();
        var pwDupleBlock = $("#pwDupleBlock");

        pwDupleBlock.show();

        // 비밀번호가 입력되지 않았을 경우
        if (!userPw) {
            console.log("비밀번호를 입력하세요.");
            pwDupleBlock.text("비밀번호를 입력하세요.");
            // TODO: ptag 표시
            return;
        }
        pwDupleBlock.text("");
    }
  

	    $(document).ready(function () {
	    	$("#loginButton").click(function() {
	  			var userIdValue = $("#userId").val().trim();
		        var userPwValue = $("#userPw").val().trim();
		        if (userIdValue.length === 0 || userPwValue.length === 0) {
		            $("#loginFailureMessageText").text("아이디와 비밀번호를 모두 입력해 주세요.").show();
		            event.preventDefault(); // Prevent form submission
		            console.log("아이디와 비밀번호를 입력해 주세요.");
		            return;
		        } 
	            $.ajax({
	                type: "POST",
	                url: "/user/login",
	                data: {
	                    userId: userIdValue,
	                    userPw: userPwValue
	                },
	                dataType: "text",
	                success: function (response) {
	                    console.log(response); // 서버 응답 확인
	                    if (response ==="true") {
	                        console.log("로그인 성공");
	                        window.location.href = "/";
	                    } 
	                    else if(response ==="loginfalse") {
	                        console.log("로그인 실패");
							alert("아이디 또는 비밀번호가 잘못되었습니다.");                    	
	                        window.location.href = "/user/login";
	                    }
	                    else if(response ==="false") {
	                        console.log("탈퇴 회원");
							alert("탈퇴한 회원으로 로그인 할 수 없습니다.");
							window.location.href = "/user/join";
	                    }
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
                        console.log("서버 응답에 문제가 있습니다."); // 서버 응답이 다르게 올 경우
	                    console.error("AJAX 요청 실패: " + textStatus);
	                }
	            });
	    	})
	    });
	    
</script>

<!-- 카카오 로그인 -->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        Kakao.init('8dbde9a5763083fbca31c3f1098a1682');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:8088/user/login' 
        }); // 등록한 리다이렉트uri 입력
    }
</script>


<!-- .script 끝 -->

<style type="text/css">

.container {
	background-color: skyblue;
	min-width: 1300px;
	max-height: 700px;
	display: grid;
/* 	grid-template-columns: repeat(2, 1fr); */
	grid-template-rows: repeat(5, 1fr);
	justify-content: center;
	align-items: center;
	
	/* 로그인 배경화면 넣기*/
	background: url('/resources/img/login_background.jpg');
    background-size: 1300px 700px; /* 이미지 크기 조절 */
    background-repeat: no-repeat;
    background-position: 20px;
}

.form {
	background-color: rgb(255 255 255 / 40%);
	min-width: 1000px;
	min-height: 500px;
	grid-row: 3;
	box-shadow: 8px 6px 20px 0px #5e5e5e;
}

.input_form {
/* 	background-color: purple; */
}

.pageTitle {
/* 	background-color: pink; */
	text-align: center;
	padding: 30px;
}

.login {
/* 	background-color: yellow; */
	display: grid;
	justify-content: center;
 	min-height: 140px; 
 	margin-top: 30px;
}

.find {
/* 	background-color: #adadff; */
	padding-left: 625px;
}

.login_btn {
/* 	background-color: gray; */
	text-align: center;
/* 	margin-top: 30px; */
/* 	margin-bottom: 30px; */
}

.join {
/* 	background-color: #ff5c5c; */
	text-align: center;
	margin-top: -10px;
}

.kakao {
	text-align: center;
}

.idpw {
	min-width: 600px;
	min-height: 40px;
	margin-bottom: 10px;
	padding-left: 60px;
	border-radius: 5px;
	border: 1px solid;
	
}

.id {
	/* 아이콘 넣기*/
	background: url('/resources/img/id_icon.png');
    background-size: 30px;
    background-repeat: no-repeat;
    background-position: 10px;
    background-color: #F0EFF4;
}

.pw {
	/* 아이콘 넣기*/
	background: url('/resources/img/pw_icon.png');
    background-size: 30px;
    background-repeat: no-repeat;
    background-position: 10px;
    background-color: #F0EFF4;
}

.invalid-feedback {
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 60px;
	line-height: 0;
}

.id_space {
	margin-bottom: 30px;
/* 	background-color: lime; */
	height: 60px;
}

.pw_space {
	margin-top: -30px;
	margin-bottom: 0px;
/* 	background-color: lime; */
	height: 60px;
}

/* 로그인 버튼*/
.loginButton {
	width: 600px;
	height: 44px;
	padding: 9px;
	margin-top: 20px;
	margin-bottom: -13px;
	border: 1px solid;
	border-color: #008000;
	border-radius: 5px;
	background-color: #008000;
	color: #fff;
	font-weight: 500;
}

.loginButton:active {
	background: green;
	border-style: none;
}

/* 카카오 로그인 버튼*/
.kakao_href {
/* 	border: 1px solid; */
	border-radius: 5px;
	border-color: #3E2723;
	background-color: #FFEB02;
	width: 600px;
	padding: 5px;
	margin-left: 200px;
	color: #3E2723;
	font-weight: 500;
	margin-bottom: 0;
}

a {
	text-decoration: none;
}

.kakao_icon {
	margin-right: 10px;	
}

/*input 자동 완성시 색깔*/ 
input:-webkit-autofill { -webkit-box-shadow: 0 0 0 30px #F0EFF4 inset ; -webkit-text-fill-color: #000; }
input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active { transition: background-color 5000s ease-in-out 0s; }

p {
	font-weight: 400;
	color: #005400;
}


</style><!-- .css 끝 -->

<div class="container">
<div class="form">
<div class="pageTitle">
<h3 id="pageTitle" style="color: #0f7e3e;">로그인</h3>
</div><!-- .pageTitle -->

<div class="input_form">

<div class="login">
<!-- 아이디 -->
<div class="id_space">

	<div>
		<input type="text" id="userId" class="idpw id" name="userId" onblur="idDupleCheck(this)" placeholder="아이디*">

  	</div><!-- .form-floating is-invalid -->
  	
	<div id="idDupleBlock" class="invalid-feedback" style="display:none">
		<p id="idDupleText"></p>
	</div><!-- .idDupleBlock -->
</div><!-- .id_space -->

<!-- 비밀번호 -->
<div class="pw_space">
	<div>

	    <input type="password" id="userPw" class="idpw pw" name="userPw" aria-describedby="passwordHelpInline" onblur="passwordCheck()" placeholder="비밀번호*" required>
  	</div><!-- .form-floating is-invalid -->
  	<div id="pwDupleBlock" class="invalid-feedback" style="display:none">
    <p id="pwDupleText"></p>
	</div><!-- .pwDupleBlock -->
	
</div><!-- .pw_space -->
</div><!-- .login -->

<!-- 아이디, 비밀번호 찾기 -->
	<div class="find">
		<a href="./idfind" type="button">아이디 찾기</a>
		|
		<a href="./pwfind" type="button">비밀번호 찾기</a>		
	</div><!-- .find -->
	
	<div class="login_btn">
		<button id="loginButton" class="loginButton">일반 로그인</button>
	</div><!-- .login_btn -->	
	
	<!-- 카카오 소셜 로그인 -->
	<div class="kakao">
		<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=a75bad9d6cd43e60fa8e31d70d2b8625&redirect_uri=http://localhost:8088/user/login&response_type=code">
		<p class="kakao_href">
		<img alt="kakao_icon_2" src="/resources/img/kakao_icon_2.png" class="kakao_icon" width="30px" height="30px">
		카카오 로그인</p>
		</a>
	</div><!-- .kakao -->
	
	<div class="join">
	<p>Camping Every Share와 함께 하시겠어요? <a href="./join" type="button">회원가입</a></p>	
	</div><!-- .join -->
		
</div><!-- .input -->
</div><!-- .form -->

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />