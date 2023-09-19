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
					<h1 class="text-white animated slideInDown">${title}</h1>
				</div>
			</div>
		</div>
	</div>

	<!-- register_complete Start -->
	<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s"
		style="margin: 100px 0;">
		<div class="container px-lg-5 text-center">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<img src="/img/check.png" style="width: 20%; margin-bottom: 20px;">
					<h1 class="mb-4" style="margin-top: 30px;">${subTitle}</h1>
					<p class="mb-4">${msg}</p>
					<a class="btn btn-primary rounded-pill py-3 px-5" href="/sale?storeId=${loggedStoreId}" style="margin-top: 30px;">Go To Home</a>
				</div>
			</div>
		</div>
	</div>
	<!-- register_complete End -->

	<c:import url="../footer.jsp" />

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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