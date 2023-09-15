<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기부 게시판</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="/img/favicon.ico" rel="icon">

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
<link href="css/custom.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

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
					<h1 class="text-white animated slideInDown">기부해주세요</h1>
					<hr class="bg-white mx-auto mt-0" style="width: 90px;">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center">
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Navbar & Hero End -->




	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<p class="section-title text-secondary justify-content-center">
					<span></span>Donate Promotion<span></span>
				</p>
				<h1 class="text-center mb-5">기부 게시글</h1>
			</div>
			<div class="row g-4">
				<!-- Service 1 -->
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item d-flex flex-column text-center rounded">
						<div
							class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto"
							style="width: 250px; height: 250px; overflow: hidden;">
							<img src="img/사랑의 열매.png" alt=""
								style="width: 100%; height: 100%; object-fit: cover;">
						</div>
						<h5 class="mb-3">사랑의 열매</h5>
						<p class="m-0">사랑의 열매는 나와 가족을 사랑하는 마음으로 이웃에게 사랑을 전하자는 나눔의 의미를
							담고 있습니다.</p>
						<a class="btn btn-square" href="http://localhost:8080/donate"></a>
					</div>
				</div>
				<!-- Service 2 -->
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item d-flex flex-column text-center rounded">
						<div
							class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto"
							style="width: 250px; height: 250px; overflow: hidden;">
							<img src="img/유니세프.png" alt=""
								style="width: 80%; height: 80%; object-fit: cover;">
						</div>
						<h5 class="mb-3">유니세프</h5>
						<p class="m-0">월 30,000원 이면, 전 세계 어린이를 위해 연필 7,200 자루를 지원할 수
							있습니다.</p>
						<a class="btn btn-square" href="http://localhost:8080/donate"></a>
					</div>
				</div>
				<!-- Service 3 -->
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
					<div class="service-item d-flex flex-column text-center rounded">
						<div
							class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto"
							style="width: 250px; height: 250px; overflow: hidden;">
							<img src="img/적십자.png" alt=""
								style="width: 70%; height: 70%; object-fit: cover;">
						</div>
						<h5 class="mb-3">대한 적십자사</h5>
						<p class="m-0">모든 활동을 투명하게 공개합니다.</p>
						<a class="btn btn-square" href="http://localhost:8080/donate"></a>
					</div>
				</div>

				<!-- Service 4 -->
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item d-flex flex-column text-center rounded">
						<div
							class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto"
							style="width: 250px; height: 250px; overflow: hidden;">
							<img src="img/월드비전.png" alt=""
								style="width: 100%; height: 100%; object-fit: cover;">
						</div>
						<h5 class="mb-3">월드비전</h5>
						<p class="m-0">오늘도 아픈 가족을 돌보기 위해 택배를 나르는 16살 용일이에게 따뜻한 관심을
							가져주세요.</p>
						<a class="btn btn-square" href="http://localhost:8080/donate"></a>
					</div>
				</div>

				<!-- Service 5 (한국 컴패션) -->
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item d-flex flex-column text-center rounded">
						<div
							class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto"
							style="width: 250px; height: 250px; overflow: hidden;">
							<img src="img/한국컴패션.png" alt=""
								style="width: 100%; height: 100%; object-fit: cover;">
						</div>
						<h5 class="mb-3 mt-4">한국 컴패션</h5>
						<p class="m-0">정직하고 효율적인 후원금 사용으로 어린이 양육에 집중합니다.</p>
						<a class="btn btn-square" href="http://localhost:8080/donate"></a>
					</div>
				</div>

				<!-- Service 6 -->
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
					<div class="service-item d-flex flex-column text-center rounded">
						<div
							class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto"
							style="width: 250px; height: 250px; overflow: hidden;">
							<img src="img/세이브더칠드런.png" alt=""
								style="width: 100%; height: 100%; object-fit: cover;">
						</div>
						<h5 class="mb-3">세이브더칠드런</h5>
						<p class="m-0">오직 아동만을 위해 100년간 활동 중인 투명한 국제NGO. SAVEONE 긴급구호
							팔찌. 저소득가정 반찬 지원. 아동 정기후원.</p>
						<a class="btn btn-square" href="http://localhost:8080/donate"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service End -->
	<!-- Service End -->





















	<!-- gifthub-contact Start -->
	<div class="container-fluid bg-primary text-light footer wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container">
			<div class="row g-5">
				<div class="col-md-12 col-lg-3">
					<div class="col text-center" style="text-align: center;">
						<!-- inline style 추가 -->
						<p class="section-title text-white h5 mb-4">
							GiftHub Contact<span></span>
						</p>
						<p>
							<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York,
							USA
						</p>
						<p>
							<i class="fa fa-phone-alt me-3"></i>+012 345 67890
						</p>
						<p>
							<i class="fa fa-envelope me-3"></i>info@example.com
						</p>
					</div>
				</div>
				<div class="col-md-12 col-lg-3">
					<!-- 내용 -->
				</div>
			</div>
		</div>
	</div>
	<!-- gifthub-contact End -->

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