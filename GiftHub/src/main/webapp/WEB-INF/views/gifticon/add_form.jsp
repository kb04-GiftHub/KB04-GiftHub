<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 내역</title>
</head>
<body>
	<c:import url="../top.jsp" />
	<div class="container-xxl bg-primary hero-header">
		<!-- Contact Start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="wow fadeInUp" data-wow-delay="0.1s">
					<p class="section-title text-secondary justify-content-center">
						<span></span>상품등록<span></span>
					</p>
					<h1 class="text-center mb-5">기프티콘 등록</h1>
				</div>
				<form method="post" enctype="multipart/form-data">
					<div class="button">
						<label for="chooseFile"> 👉 CLICK HERE! 👈 </label>
					</div>
					<input type="file" id="chooseFile" name="chooseFile"
						accept="image/*" onchange="loadFile(this)">
				</form>
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="wow fadeInUp" data-wow-delay="0.3s">

							<form>
								<div class="row g-3">
									<div class="col-md-12">
										<div class="form-floating">
											<input type="text" class="form-control" id="name"
												placeholder="Your Name"> <label for="name">메뉴명</label>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-floating">
											<input type="email" class="form-control" id="email"
												placeholder="Your Email"> <label for="email">유효기간</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<input type="text" class="form-control" id="subject"
												placeholder="Subject"> <label for="subject">원가</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<input type="text" class="form-control" id="subject"
												placeholder="Subject"> <label for="subject">판매금액</label>
										</div>
									</div>

									<div class="col-12">
										<div class="form-floating">
											<textarea class="form-control"
												placeholder="Leave a message here" id="message"
												style="height: 150px"></textarea>
											<label for="message">상품설명</label>
										</div>
									</div>
									<div class="col-6">
										<button class="btn btn-primary w-100 py-3" type="submit">
											취소하기</button>
									</div>
									<div class="col-6">
										<button class="btn btn-primary w-100 py-3" type="submit">
											등록하기</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Contact End -->
	</div>
	</div>







	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
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

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>