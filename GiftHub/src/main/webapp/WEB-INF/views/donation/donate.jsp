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
									<h2 style="text-align: center;">
										MY POINT :
										<fmt:formatNumber value="${point}" type="currency"
											currencySymbol="" />
										P
									</h2>
								</div>
							</div>
							<form id="form" action="/donation/donate_done" method="post">
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
											</select> <label for="org">기부단체</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<input type="number" class="form-control" id="pointToUse"
												name="pointToUse" placeholder="기부금액"> <label
												for="pointToUse">기부금액</label>
										</div>
									</div>
									<div class="col-12">
										<button id="donationBtn" class="btn btn-primary w-100 py-3">기부하기</button>
									</div>
								</div>
							</form>
							<div class="col-lg-12 text-center">
								<hr style="margin: 50px 0;">
								<p class="mb-4">기부단체가 궁금하다면 ?</p>
								<a class="btn btn-primary rounded-pill py-3 px-5"
									href="/donation/donateboard">기부단체 둘러보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기부 End -->
	<c:import url="../footer.jsp" />
	
	<div id="result" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="title" class="modal-title"></h5>
					<button type="button" class="btn-close" onclick="history.go(0);"></button>
				</div>
				<div class="modal-body">
					<p id="content1" style="margin: 0"></p>
					<p id="content2" style="margin: 0"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="history.go(0);">확인</button>
				</div>
			</div>
		</div>
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
	
	<script>
		$(document).ready(function() {
			$('#donationBtn').click(function(e) {
                e.preventDefault();
            });
			
			$('#donationBtn').click(function() {
				requestExchange();
			})
		});
		
		function requestExchange() {
			var point = ${user.point};
			var pointToUse = $('#pointToUse').val();
			
			if (point >= pointToUse) {
				$('#form').submit();
			} else {
				var msg1 = '정산에 실패하였습니다.';
				var msg2 = '포인트가 부족합니다.';
				$('#title').text('포인트 정산 실패');
				$('#content1').text(msg1);
				$('#content2').text(msg2);
				$('#result').modal('show');
			}
		}
	</script>
</body>
</html>