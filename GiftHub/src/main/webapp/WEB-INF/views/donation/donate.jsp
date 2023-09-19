<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기부하기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>

<body>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">우리 기부해요</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- Navbar & Hero End -->

	<!-- 기부 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-12">
								<div class="form-floating">
									<h2 style="text-align: center;">MY POINT : <fmt:formatNumber value="${point}" type="currency" currencySymbol=""/>P</h2>
								</div>
							</div>
							<form action="/donation/donate_done" method="post">
								<div class="row g-3">
									<div class="col-12">
										<div class="form-floating">
											<select name="org" id="org" class="form-control">
												<option>기부단체를 선택하세요.</option>
												<option value="1">장애인종합복지관</option>
												<option value="2">늘푸른노인복지관</option>
												<option value="3">학교밖청소년지원센터</option>
												<option value="4">다함께돌봄센터</option>
												<option value="5">환경운동연합</option>
											</select>
											<label for="org">기부단체</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<input type="number" class="form-control" id="pointToUse" name="pointToUse" placeholder="기부금액">
											<label for="pointToUse">기부금액</label>
										</div>
									</div>
									<div class="col-12">
										<button class="btn btn-primary w-100 py-3">기부하기</button>
									</div>
								</div>
							</form>
							<div class="col-lg-12 text-center">
								<hr style="margin: 50px 0;">
								<p class="mb-4">기부단체가 궁금하다면 ?</p>
								<a class="btn btn-primary rounded-pill py-3 px-5" href="/donation/donateboard">기부단체 둘러보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기부 End -->

	<c:import url="../footer.jsp" />

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

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>