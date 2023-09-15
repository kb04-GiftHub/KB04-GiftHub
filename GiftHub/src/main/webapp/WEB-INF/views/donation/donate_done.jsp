<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 완료</title>
</head>
<body>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">기부가 완료 되었어요!</h1>
					<hr class="bg-white mx-auto mt-0" style="width: 90px;">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center">
						</ol>
					</nav>
				</div>


			</div>
		</div>
	</div>

	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">CHECK MY POINT</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-12">
								<div class="form-floating">
									<h3 class="text-center">${point} point</h3>
								</div>
							</div>
							<div class="col-12">
								<button class="btn btn-primary w-100 py-3" id="backBtn"
									style="margin-top: 50px;"
									onclick="window.location.href = '/member/mypage/use_list'">포인트
									충전하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../footer.jsp" />
</body>
</html>