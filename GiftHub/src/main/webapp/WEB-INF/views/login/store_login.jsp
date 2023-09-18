<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<c:import url="../top.jsp" />
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
    
	<!-- 회원가입 폼 Start -->
	<div class="container-xxl py-5">
	
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
			<p class="section-title text-secondary justify-content-center"><span></span>가맹점 로그인<span></span></p>
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
	<!-- 회원가입 폼 End -->
<style>
    /* 버튼 크기를 2배로 키우기 */
    .btn-square {
        font-size: 2rem;
        width: 4rem;
        height: 4rem;
    }

    /* 로고 색상을 파란색으로 변경하기 */
    .fab.fa-facebook-f,
    .fab.fa-twitter,
    .fab.fa-instagram,
    .fab.fa-linkedin-in {
        color: blue; /* 파란색으로 변경할 색상 지정 */
    }
</style>

<!-- 소셜 회원가입 버튼 Start -->
<div class="d-flex justify-content-center p-4">
    <a class="btn btn-square mx-1" href="https://m.facebook.com/login/?locale=ko_KR&refsrc=deprecated" target="_blank"><i class="fab fa-facebook-f"></i></a>
    <a class="btn btn-square mx-1" href="https://www.instagram.com/accounts/emailsignup/" target="_blank"><i class="fab fa-twitter"></i></a>
    <a class="btn btn-square mx-1" href="https://accounts.google.com/InteractiveLogin/signinchooser?hl=ko&ifkv=AXo7B7Wo2fe2rRbChk-vQ6SF8_75Rd0n0aC4ymayLs-yq1PGJhqlg3jbzACwLn1GNCAaGYMeBWeS&theme=glif&flowName=GlifWebSignIn&flowEntry=ServiceLogin" target="_blank"><i class="fab fa-instagram"></i></a>
    <a class="btn btn-square mx-1" href="https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
</div>
<!-- 소셜 회원가입 버튼 End -->


	<c:import url="../footer.jsp" />

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	
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
            var url = "/store/register";
            window.location.href = url;
        });
    });
	</script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
