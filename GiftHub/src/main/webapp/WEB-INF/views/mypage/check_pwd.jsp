<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인확인</title>
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

	<!-- CheckPwd Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4">회원정보 열람 및 수정을 위해 본인확인을 진행합니다.</p>
						<form action="check_action" method="post">
							<div class="row g-3">
								<div class="col-12">
									<div class="form-floating">
										<input type="password" class="form-control" id="pwd"
											name="pwd" placeholder="비밀번호" required>
											<label for="pwd">비밀번호</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="password" class="form-control" id="pwd_chk"
											name="pwd_chk" placeholder="비밀번호확인" required>
											<label for="pwd_chk">비밀번호확인</label>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" type="submit">본인확인</button>
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
	
	<!-- CheckPwd JavaScript -->
	<script>
		window.onload = function(){
			if('${msg}' != '') {
				alert('${msg}')
			}
		}
	</script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>