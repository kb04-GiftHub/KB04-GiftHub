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
									<button class="btn btn-primary w-100 py-3" id="registerBtn">회원가입</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 폼 End -->

    <!-- 소셜 가입 버튼 Start -->
	<div class="container-xxl p-0">
		<div class="wow fadeInUp" data-wow-delay="0.1s">
			<div class="d-flex pt-3 justify-content-center">
				<!-- 중앙 정렬로 변경 -->
				<a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://m.facebook.com/login/?locale=ko_KR&refsrc=deprecated"
					style="border-color: #0000FF;">
					<i class="fab fa-facebook-f"></i> Facebook으로 로그인
				</a> <a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://www.instagram.com/accounts/emailsignup/"
					style="border-color: #0000FF;">
					<i class="fab fa-instagram"></i> Instagram으로 로그인
				</a> <a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://accounts.google.com/InteractiveLogin/signinchooser?hl=ko&ifkv=AXo7B7Wo2fe2rRbChk-vQ6SF8_75Rd0n0aC4ymayLs-yq1PGJhqlg3jbzACwLn1GNCAaGYMeBWeS&theme=glif&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
					style="border-color: #0000FF;">
					<i class="fab fa-google"></i> Google로 로그인
				</a> <a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/"
					style="border-color: #0000FF;">
					<i class="fab fa-naver"></i> Naver로 로그인
				</a>
			</div>
		</div>
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

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
