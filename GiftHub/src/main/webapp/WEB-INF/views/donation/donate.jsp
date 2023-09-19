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


<style>
.container-xxl {
	margin-bottom: -20px; 
}

.form-group {
	margin-top: -20px; display : flex;
	flex-direction: column;
	align-items: center;
	display: flex;
}

.form-group label {
	margin-bottom: 10px;
	font-size: 1.2em;
}

.form-group input {
	width: 60%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid blue;
	margin-bottom: 20px;
}

.form-group button {
	width: 60%; /* 입력 필드와 동일한 너비 */
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 1.2em;
	background-color: blue;
	color: white;
	border: none;
	cursor: pointer;
	display: block; /* 블록 요소로 만들어 가운데 정렬 가능하게 함 */
	margin: auto; /* 가운데 정렬 */
}

.form-group button:hover {
	background-color: red;
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
				placeholder="기부할 포인트를 입력해주세요." min="0" required>
			<button type="submit" class="btn btn-primary">기 부 하 기</button>
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