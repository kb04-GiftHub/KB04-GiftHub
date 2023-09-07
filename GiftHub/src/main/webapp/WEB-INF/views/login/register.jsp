<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<c:import url="../top.jsp" />
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
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<form id="myForm" action="register_action" method="post">
							<div class="row g-3">
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="name"
											name="name" placeholder="이름">
											<label for="name">이름</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-floating">
										<input type="text" class="form-control" id="username"
											name="username" placeholder="아이디">
											<label for="username">아이디</label>
									</div>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="check_id">중복확인</button>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="password" class="form-control" id="password"
											name="password" placeholder="비밀번호">
											<label for="password">비밀번호</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="password" class="form-control" id="confirmPassword"
											name="confirmPassword" placeholder="비밀번호">
											<label for="confirmPassword">비밀번호 확인</label>
									</div>
								</div>
								<div class="col-12">
									<p id="pwdCheckMsg" style="margin: 0;"></p>
									<hr>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="tel" class="form-control" id="phone"
											name="phone" placeholder="휴대폰번호">
											<label for="phone">휴대폰번호</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="이메일">
											<label for="email">이메일</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_postcode5" id="address1"
											name="address1" placeholder="우편번호" readonly>
											<label for="address1">우편번호</label>
									</div>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="postcodify_search_button">검색</button>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_address" id="address2"
											name="address2" placeholder="도로명주소" readonly>
											<label for="address2">도로명주소</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="address3"
											name="address3" placeholder="상세주소">
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
									<button class="btn btn-primary w-100 py-3" type="submit">동의하고 회원가입</button>
									<input type="hidden" value="1" name="category">
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

	<!-- 소셜 가입 버튼 Start -->
	<style>
		.btn-social {
			margin-right: 10px; /* 오른쪽 간격 조정 */
		}
	</style>
	<div class="container-xxl p-0">
		<div class="wow fadeInUp" data-wow-delay="0.1s">
			<div class="d-flex pt-3 justify-content-center">
				<!-- 중앙 정렬로 변경 -->
				<a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://m.facebook.com/login/?locale=ko_KR&refsrc=deprecated"
					style="border-color: #0000FF;">
					<i class="fab fa-facebook-f"></i> Facebook으로 가입
				</a>
				<a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://www.instagram.com/accounts/emailsignup/"
					style="border-color: #0000FF;">
					<i class="fab fa-instagram"></i> Instagram으로 가입
				</a>
				<a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://accounts.google.com/InteractiveLogin/signinchooser?hl=ko&ifkv=AXo7B7Wo2fe2rRbChk-vQ6SF8_75Rd0n0aC4ymayLs-yq1PGJhqlg3jbzACwLn1GNCAaGYMeBWeS&theme=glif&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
					style="border-color: #0000FF;"> <i class="fab fa-google"></i> Google로 가입
				</a>
				<a class="btn btn-outline-primary w-25 py-4 btn-social mb-3"
					href="https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/"
					style="border-color: #0000FF;"> <i class="fab fa-naver"></i> Naver로 가입
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

	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script>
	    $(function() {
	    	$('#check_id').click(function() {
                // 폼의 action 속성 변경
                $('#myForm').attr('action', 'check_id');
            });
	    	
	    	$('#postcodify_search_button').click(function(e) {
                e.preventDefault(); // 폼 제출을 중지
            });
	    	
	    	$("#address1").postcodifyPopUp();
    		$("#address2").postcodifyPopUp();
    		$("#postcodify_search_button").postcodifyPopUp();
    		
    		if($("#password").val() != $("#confirmPassword").val()) {
    			$("#pwdCheckMsg").html("비밀번호가 일치하지 않습니다.");
    		}
	    });
	
	    // 주소 선택 후 처리할 함수
	    function handleSelectedAddress(result) {
	        // 주소 선택 시 입력 필드에 주소를 설정합니다.
	        $("#address1").val(result.full); // full 속성은 선택한 주소의 전체 주소입니다.
	        $("#address2").val(result.full); // full 속성은 선택한 주소의 전체 주소입니다.
	    }
	</script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
