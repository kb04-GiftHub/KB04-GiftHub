<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<c:import url="../top.jsp" />
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">마이페이지</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- CheckPwd Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">CHECK YOUR PASSWORD</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4">회원정보 열람 및 수정을 위해 본인확인을 진행합니다.</p>
						<form action="check_action" method="post">
							<div class="row g-3">
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
									<button class="btn btn-primary w-100 py-3" id="submitBtn" type="submit">본인확인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CheckPwd End -->

	<c:import url="../footer.jsp" />

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
	    		$("#pwdCheckMsg").text('${msg}');
	    	}
	    	
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
	    	
	    	$("#submitBtn").prop("disabled", true);
	    	
	    	// 모든 필수 입력 필드 유효성 검사
	        function validateFields() {
	            var password = $("#password").val();
	            var confirmPassword = $("#confirmPassword").val();

	            // 필드에 값이 없는 경우 유효하지 않음
	            if (
	                password.trim() === "" ||
	                confirmPassword.trim() === ""
	            ) {
	                return false;
	            }

	            if (password !== confirmPassword) {
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
	    });
	</script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>