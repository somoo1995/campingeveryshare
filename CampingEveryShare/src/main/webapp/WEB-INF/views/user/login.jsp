<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />  

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js"
  integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>
 -->
<script>
  Kakao.init('8dbde9a5763083fbca31c3f1098a1682'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>

function kakaoLogin() {
    Kakao.Auth.login({
    	
    	//로그인 성공
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
        
          //로그인 성공후 , 개인정보조회 성공
          success: function (response) {
        	  console.log(response.kakao_account)
//         	  console.log(response.kakao_account.email)
        	 
         	  //응답에서 사용자정보 추출
        	  var userId = response.id+".k";
        	  var email = response.kakao_account.email;
        	  var userName = response.kakao_account.name;
        	  var userNick = response.kakao_account.profile.nickname;
        	  var birth = response.kakao_account.birthyear+response.kakao_account.birthday;
        	  var phone = response.kakao_account.phone_number;

        	  // 콘솔에 사용자정보 기록
              console.log(userId);
              console.log(email);
              console.log(userName);
              console.log(userNick);
              console.log(birth);
              console.log(phone);

              // HTTP 요청을 사용하여 서버에 사용자정보 보내기
              sendInfoToServer(userId,email,userName,userNick,birth,phone);

          },
          //로그인 성공후 , 개인정보조회 실패
          fail: function (error) {
            console.log(error)

          },
        })
      },
      //로그인 실패
      fail: function (error) {
        console.log(error)
      },
    })
  }
function sendInfoToServer(userId,email,userName,userNick,birth,phone) {

	var url = '/user/kakaoLogin?email=' + encodeURIComponent(email);
	
	$.ajax({
        url: url,
        type: 'POST',
        success: function (data) {
            console.log(data);
         // 반환된 값이 'true'인 경우 로그인 처리
            if (data === 'true') {
                // 여기에 로그인 처리 로직 추가
                console.log('로그인 성공');
                window.location.href = "/";
            } 
            else if(data ==="loginfalse") {
                console.log("비회원");
                
             // processKakaoSignup 함수 호출
                processKakaoSignup(email, userId, userName, userNick);

//                 window.location.href = "/user/kakaoSignup";
            }
            else if(data ==="false") {
                console.log("탈퇴 회원");
				alert("탈퇴한 회원으로 로그인 할 수 없습니다.");
// 				window.location.href = "/user/kakaoSignup";
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("서버 응답에 문제가 있습니다."); // 서버 응답이 다르게 올 경우
            console.error("AJAX 요청 실패: " + textStatus);
        }
    });
}

function processKakaoSignup(email,userId,userName,userNick,birth,phone) {
	
    // 회원가입 처리
    $.ajax({
        type: "post",
        url: '/user/kakaoSignup',
        data: {
            "userId": userId,
            "email": email,
            "userName": userName,
            "userNick": userNick,
            "birth": birth,
            "phone": phone
        },
        success: function (data) {
            console.log(data);
            // 회원가입 성공 시 로그인 처리
            if (data === 'true') {
                console.log('카카오 회원가입 및 로그인 성공');
                window.location.href = "/";
            } else {
                alert('카카오 회원가입 실패. 일반 계정으로 로그인하시기 바랍니다.');
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("서버 응답에 문제가 있습니다.");
            console.error("AJAX 요청 실패: " + textStatus);
            console.error("에러 내용: " + errorThrown);
            console.error("서버 응답: " + jqXHR.responseText);
        }
    });
}


</script>

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

    // id 중복 체크
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
	    	// 엔터 키를 누르면 다음 입력란으로 포커스 이동
    	    $("#userId").keypress(function (e) {
    	        if (e.which === 13) { // 13은 Enter 키의 키 코드입니다.
    	            e.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

    	            // userPw 입력란으로 포커스 이동
    	            $("#userPw").focus();
    	        }
    	    });

    	    // userPw 입력란에서 엔터 키를 누르면 로그인 버튼 클릭
    	    $("#userPw").keypress(function (e) {
    	        if (e.which === 13) { // 13은 Enter 키의 키 코드입니다.
    	            e.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

    	            // 로그인 버튼 클릭
    	            $("#loginButton").click();
    	        }
    	    });

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

<!-- .script 끝 -->

<style type="text/css">

.container {
   background-color: skyblue;
   min-width: 1300px;
   max-height: 700px;
   display: grid;
/*    grid-template-columns: repeat(2, 1fr); */
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
/*    background-color: purple; */
}

.pageTitle {
/*    background-color: pink; */
   text-align: center;
   padding: 30px;
}

.login {
/*    background-color: yellow; */
   display: grid;
   justify-content: center;
    min-height: 140px; 
    margin-top: 30px;
}

.find {
/*    background-color: #adadff; */
   padding-left: 625px;
}

.login_btn {
/*    background-color: gray; */
   text-align: center;
/*    margin-top: 30px; */
/*    margin-bottom: 30px; */
}

.join {
/*    background-color: #ff5c5c; */
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
/*    background-color: lime; */
   height: 60px;
}

.pw_space {
   margin-top: -30px;
   margin-bottom: 0px;
/*    background-color: lime; */
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
/*    border: 1px solid; */
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
   
      <a class="p-2" id="kakao-login-btn" onclick="kakaoLogin()">
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