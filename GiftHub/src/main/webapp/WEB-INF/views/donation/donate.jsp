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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


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

body {
	background-color: white;
}

.btn-primary {
	background-color: blue;
}

.form-control {
	border-color: blue;
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

	<!-- 포인트 정보 표시 -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">보유 포인트 : ${point}</h1>
			</div>
		</div>
	</div>
	<form action="/donation/donate_done" method="post">
		<div class="form-group">
			<label for="exampleFormControlInput1">포인트 기부</label> <input
				type="number" class="form-control" id="pointToUse" name="pointToUse"
				placeholder="기부할 포인트를 입력해주세요.">
		</div>
		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">단체를 골라주세요.</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">1번 단체</a> <a class="dropdown-item"
					href="#">2번 단체</a> <a class="dropdown-item" href="#">3번 단체</a>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
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