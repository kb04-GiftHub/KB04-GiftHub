<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기부하기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

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
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/custom.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">

<style>
/* 플레이스홀더 텍스트 대신 아래에 검정색 선을 표시합니다. */
.form-floating input[type="text"].border-0, .form-floating input[type="password"].border-0
	{
	border-bottom: 1px solid #000 !important;
	border-radius: 0 !important;
	box-shadow: none !important;
}

/* 포커스 시 선의 색상을 변경합니다. */
.form-floating input[type="text"].border-0:focus, .form-floating input[type="password"].border-0:focus
	{
	border-bottom: 1px solid #000 !important;
	box-shadow: none !important;
}
</style>


</head>

<body>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">우리 기부해요</h1>
					<hr class="bg-white mx-auto mt-0" style="width: 90px;">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center">
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- Navbar & Hero End -->

	<form>
		<div class="row g-3">
			<div class="col-md-6">
				<div class="form-floating">
					<input type="text" class="form-control" id="name"
						placeholder="Your Name"> <label for="name">성명</label><br>
				</div>
			</div>

			<!-- 포인트 정보 표시 -->
			<p>보유 포인트: ${point}</p>


			<form action="/donation/donate_done" method="post">
				<div class="form-floating">
					<input type="number" class="form-control" name="pointToUse"
						id="pointToUse" placeholder="사용할 포인트"> <label
						for="pointToUse">사용할 포인트</label>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>


		</div>
	</form>
	<c:import url="../footer.jsp" />
	<!-- gifthub-contact End -->

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