<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="path" value="${pageContext.request.contextPath}" />
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
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<c:import url="top.jsp" />

	<!-- Navbar & Hero End -->
	<div class="container-xxl bg-primary hero-header">
		<div class="container px-lg-5">
			<div class="row g-5 align-items-end">
				<div class="col-lg-6 text-center text-lg-start">
					<h1>${path }</h1>
					<h1 class="text-white mb-4 animated slideInDown">A Digital
						Agency Of Inteligents & Creative People</h1>
					<p class="text-white pb-3 animated slideInDown">Tempor rebum no
						at dolore lorem clita rebum rebum ipsum rebum stet dolor sed justo
						kasd. Ut dolor sed magna dolor sea diam. Sit diam sit justo amet
						ipsum vero ipsum clita lorem</p>
					<a href=""
						class="btn btn-secondary py-sm-3 px-sm-5 rounded-pill me-3 animated slideInLeft">가맹점
						로그인</a> <a href=""
						class="btn btn-light py-sm-3 px-sm-5 rounded-pill animated slideInRight">회원
						로그인</a>

				</div>
				<div class="col-lg-6 text-center text-lg-start">
					<img class="img-fluid animated zoomIn" src="img/hero.png" alt="">
				</div>
			</div>
		</div>
	</div>
	</div>

	<c:import url="footer.jsp" />



	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	</div>

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