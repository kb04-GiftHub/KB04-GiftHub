<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 완료</title>
</head>
<body>
	<c:import url="../top.jsp" />
	<c:set var="imagePath" value="/resources/products/${dto.productImage}" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">


			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<p class="section-title text-secondary justify-content-center">
					<span></span>등록 확인<span></span>
				</p>
				<h1 class="text-center mb-5" style="color: white;">상품 등록 완료</h1>
			</div>

		</div>
	</div>

	<!-- 여기부터 변경 내용  -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="row justify-content-center mb-5">
				<div class="col-lg-7 text-center">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<form method="post" enctype="multipart/form-data"></form>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<!-- start -->
						<div class="button"></div>
						<div class="row justify-content-center align-items-center mt-5">
							<div class="col-md-6 text-center">
								<!-- 이미지 -->
								<img src="${imagePath}" alt="Product Image">

							</div>
						</div>

						<div class="row g-3">
							<div class="col-md-12" style="margin-top: 10px;"></div>
							<div class="col-md-12">
								<!-- 상품명 -->
								<div class="form-floating">상품명 : ${dto.productName}</div>
							</div>

							<div class="col-12">
								<!-- 판매금액 -->
								<div class="form-floating">판매금액 : ${dto.productPrice}</div>
							</div>

							<div class="col-12">
								<!-- 상품 설명 -->
								<div class="form-floating">상품설명 : ${dto.productMemo}</div>
							</div>
							<div class="col-md-12">
								<!-- 유효기간 -->
								<fmt:formatDate value="${dto.productExp}" pattern="yyyy-MM-dd"
									var="formattedExpDate" />
								<div class="form-floating">유효기간 : ${formattedExpDate}</div>
							</div>

							<div class="col-12" mx-auto>
								<a href="/" class="btn btn-primary w-100 py-3">확인</a>
							</div>

						</div>
						<!-- end -->
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>