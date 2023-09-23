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
	                        <h1 class="text-white animated slideInDown">로그인</h1>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    
		<!-- 로그인 폼 Start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="wow fadeInUp" data-wow-delay="0.1s">
				<p class="section-title text-secondary justify-content-center"><span></span>회원 로그인<span></span></p>
					<h1 class="text-center mb-5">ENTER YOUR INFO</h1>
				</div>
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4"></p>
							<form id="myForm" action="login_action" method="post">
								<div class="row g-3">
									<div class="col-12">
										<div class="form-floating">
											<input type="text" class="form-control" id="username" name="username" placeholder="아이디">
											<label for="username">아이디</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
											<label for="password">비밀번호</label>
										</div>
									</div> 
									<div class="col-12">
										<p id="checkMsg" style="margin: 0;"></p>
									</div> 
	                                <div class="col-12">
										<button class="btn btn-primary w-100 py-3" id="submitBtn" type="submit">로그인</button>
									</div>
									<div class="col-6" style="text-align: right;">
										<a>아이디 찾기</a>
									</div>
									<div class="col-6" style="text-align: left; margin-bottom: 30px;">
										<a>비밀번호 찾기</a>
									</div>
									<div class="col-12">
										<hr>
									</div>
									<div class="col-12">
										<p style="margin: 0; text-align: center; margin-top: 30px;">아직 GiftHub 회원이 아니신가요?</p>
									</div>
									<div class="col-12">
										<button class="btn btn-primary w-100 py-3" id="registerBtn" >회원가입</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 로그인 폼 End -->

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
	
	<script>
    $(function() {
    	if('${msg}' !== '') {
    		$("#checkMsg").text('${msg}');
    	}
    	
    	$("#submitBtn").prop("disabled", true);
    	
    	// 모든 필수 입력 필드 유효성 검사
        function validateFields() {
            var username = $("#username").val();
            var password = $("#password").val();

            // 필드에 값이 없는 경우 유효하지 않음
            if (
            	username.trim() === "" ||
            	password.trim() === ""
            ) {
                return false;
            }

            // 모든 필드가 유효한 경우 true 반환
            return true;
        }
    	
     	// 필드 값이 변경될 때마다 유효성 검사 수행
        $("input").on("input", function() {
            if (validateFields()) {
                $("#submitBtn").prop("disabled", false);
            } else {
                $("#submitBtn").prop("disabled", true);
            }
        });
     	
        $("#registerBtn").click(function(e) {
        	e.preventDefault();
            var url = "/member/register";
            window.location.href = url;
        });
    });
	</script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>
