<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  
<meta charset="utf-8">
<title>GiftHub</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="/img/icon.png" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0">
			<nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0" style="height: 80px;">
				<a href="/" class="navbar-brand p-0">
					<h1 class="m-0">
						<img src="/img/icon.png" alt="Logo"> GiftHub
					</h1>
				</a>
			</nav>
			<!-- Navbar & Hero End -->
			
	        <div class="container-xxl py-5 bg-primary hero-header">
	            <div class="container my-5 py-5 px-lg-5">
	                <div class="row g-5 py-5">
	                    <div class="col-12 text-center">
	                        <h1 class="text-white animated slideInDown">회원가입</h1>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>

	<!-- 회원가입 폼 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
			<p class="section-title text-secondary justify-content-center"><span></span>일반회원<span></span></p>
				<h1 class="text-center mb-5">ENTER YOUR INFO</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<form id="myForm" action="register_action" method="post">
							<div class="row g-3">
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="name" name="name" placeholder="이름">
										<label for="name">이름</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임">
										<label for="nickname">닉네임</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-floating">
										<input type="text" class="form-control" id="username" name="username" placeholder="아이디">
										<label for="username">아이디</label>
									</div>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="check_id">중복확인</button>
								</div>
								<div class="col-12">
									<p id="idCheckMsg" style="margin: 0;"> ❗ 아이디 중복확인은 필수입니다.</p>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
										<label for="password">비밀번호</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="비밀번호">
										<label for="confirmPassword">비밀번호 확인</label>
									</div>
								</div>
								<div class="col-12">
									<p id="pwdCheckMsg" style="margin: 0;"></p>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<select name="gender" id="gender" class="form-control">
											<option>성별을 선택하세요.</option>
										    <option>남자</option>
										    <option>여자</option>
									  	</select>
									  	<label for="gender">성별</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="tel" class="form-control" id="birth" name="birth" placeholder="생년월일">
										<label for="birth">생년월일</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="tel" class="form-control" id="phone" name="phone" placeholder="휴대폰번호">
										<label for="phone">휴대폰번호</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="email" class="form-control" id="email" name="email" placeholder="이메일">
										<label for="email">이메일</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_postcode5" id="address1" name="address1" placeholder="우편번호" readonly>
										<label for="address1">우편번호</label>
									</div>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="postcodify_search_button">검색</button>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_address" id="address2" name="address2" placeholder="도로명주소" readonly>
										<label for="address2">도로명주소</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="address3" name="address3" placeholder="상세주소">
										<label for="address3">상세주소</label>
									</div>
								</div>
								<div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" id="privacyPolicy" style="resize: vertical; overflow-y: scroll; height: 150px;" readonly>
개인정보 수집 및 이용 동의서

1. 개인정보 수집 목적

이 서비스에서는 다음과 같은 목적으로 개인정보를 수집합니다.

회원가입 및 인증
서비스 제공 및 관리
이벤트 및 프로모션 참여 지원
고객 서비스 제공 및 문의 응답
2. 수집하는 개인정보 항목

이 서비스에서는 다음과 같은 개인정보 항목을 수집할 수 있습니다.

이름
연락처 정보 (전화번호, 이메일 주소 등)
주소 정보
생년월일
기타 서비스 이용 관련 정보
3. 개인정보의 보유 및 이용 기간

회사는 회원 가입 시 수집한 개인정보를 회원이 탈퇴할 때까지 보관하며, 법률에서 정한 경우나 회사의 정책에 따라 더 긴 기간 동안 보관할 수 있습니다.

4. 개인정보의 제3자 제공

회사는 회원의 동의 없이 회원의 개인정보를 제3자에게 제공하지 않으며, 법률에서 정한 예외 사항에 한하여 제3자에게 제공될 수 있습니다.

5. 개인정보의 열람, 수정, 삭제

회원은 언제든지 자신의 개인정보를 열람, 수정, 삭제할 수 있습니다. 자세한 내용은 개인정보 보호 정책을 참조하십시오.

6. 개인정보 수집 동의 철회

회원은 언제든지 개인정보 수집 및 이용에 대한 동의를 철회할 수 있으며, 이 경우 회원 가입 탈퇴가 이루어질 수 있습니다.

본인은 위에서 설명한 개인정보 수집 및 이용에 대해 동의합니다.</textarea>
                                    </div>
                                </div>    
                                <div class="col-12">
									<button class="btn btn-primary w-100 py-3" id="submitBtn" type="submit">동의하고 회원가입</button>
									<input type="hidden" value="1" name="status">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 폼 End -->

	<c:import url="../footer.jsp" />
	</div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="/lib/lightbox/js/lightbox.min.js"></script>

	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script>
	    $(function() {
	    	$('#postcodify_search_button').click(function(e) {
                e.preventDefault();
            });
	    	
	    	$("#postcodify_search_button").postcodifyPopUp();
	    	
	    	// 비밀번호 일치 확인
	    	$("#password, #confirmPassword").keyup(function () {
	            var password = $("#password").val();
	            var confirmPassword = $("#confirmPassword").val();
	            var pwdCheckMsg = $("#pwdCheckMsg");

	            if (password === confirmPassword) {
	            	if(password === "" || confirmPassword === "") {
	            		pwdCheckMsg.text(" ✖️ 비밀번호를 입력해주세요.");
	            	} else {
	            		pwdCheckMsg.text(" ✔️ 비밀번호가 일치합니다.");
	            	}
	            } else {
	                pwdCheckMsg.text(" ✖️ 비밀번호가 일치하지 않습니다.");
	            }
	        });
	    	
	    	// id 중복 확인
	    	$("#check_id").click(function (e) {
	            e.preventDefault();

	            var username = $("#username").val();
	            var idCheckMsg = $("#idCheckMsg");

	            if (username.trim() !== "") {
	                // Ajax를 사용하여 서버에 중복 확인 요청
	                $.ajax({
	                    url: "id_check_action",
	                    method: "POST",
	                    data: { username: username },
	                    success: function (response) {
	                        if (response === "available") {
	                            idCheckMsg.text(" ✔️ 사용 가능한 아이디입니다.");
	                        } else {
	                            idCheckMsg.text(" ✖️ 이미 사용 중인 아이디입니다.");
	                        }
	                    },
	                    error: function () {
	                        idCheckMsg.text(" ❗ 서버 오류가 발생했습니다.");
	                    }
	                });
	            } else {
	                idCheckMsg.text(" ✖️ 아이디를 입력해주세요.");
	            }
	        });
	    	
	    	$("#submitBtn").prop("disabled", true);

	    	// 모든 필수 입력 필드 유효성 검사
	        function validateFields() {
	            var name = $("#name").val();
	            var nickname = $("#nickname").val();
	            var username = $("#username").val();
	            var password = $("#password").val();
	            var confirmPassword = $("#confirmPassword").val();
	            var gender = $("#gender").val();
	            var birth = $("#birth").val();
	            var phone = $("#phone").val();
	            var email = $("#email").val();
	            var address1 = $("#address1").val();
	            var address2 = $("#address2").val();
	            var address3 = $("#address3").val();
	            var idCheckMsg = $("#idCheckMsg").text();

	            // 필드에 값이 없는 경우 유효하지 않음
	            if (
	                name.trim() === "" ||
	                nickname.trim() === "" ||
	                username.trim() === "" ||
	                password.trim() === "" ||
	                confirmPassword.trim() === "" ||
	                gender.trim() === "" ||
	                birth.trim() === "" ||
	                phone.trim() === "" ||
	                email.trim() === "" ||
	                address1.trim() === "" ||
	                address2.trim() === "" ||
	                address3.trim() === ""
	            ) {
	                return false;
	            }

	            if (password !== confirmPassword) {
	                return false;
	            }
	            
	            if (gender === "성별을 선택하세요.") {
	                return false;
	            }
	            
	            if (
	            	idCheckMsg.trim() === "✖️이미사용중인아이디입니다." ||
	            	idCheckMsg.trim() === "✖️아이디를입력해주세요." ||
	            	idCheckMsg.trim() === ""
	            ) {
	                return false;
	            }

	            // 모든 필드가 유효한 경우 true 반환
	            return true;
	        }

	        // 필드 값이 변경될 때마다 유효성 검사 수행
	        $("select").on("input", function() {
	            if (validateFields()) {
	                $("#submitBtn").prop("disabled", false);
	            } else {
	                $("#submitBtn").prop("disabled", true);
	            }
	        });
	        
	        $("input").on("input", function() {
	            if (validateFields()) {
	                $("#submitBtn").prop("disabled", false);
	            } else {
	                $("#submitBtn").prop("disabled", true);
	            }
	        });
	        
	        $("p").on("input", function() {
	            if (validateFields()) {
	                $("#submitBtn").prop("disabled", false);
	            } else {
	                $("#submitBtn").prop("disabled", true);
	            }
	        });
	    	
	    });
	</script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>