<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<c:import url="../top_customer.jsp" />
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">마이페이지</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<!-- 기프티콘 상세 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">GIFTICON INFO</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-6">
								<div class="form-floating">
									<img alt="" src="/upload_images/product/${object[8]}" style="width: 100%; margin-bottom: 20px;">
									<img alt="" src="/upload_images/gifticon/${object[2]}.png" style="margin: auto; display: block; width: 60%">
									<p class="mb-0" style="text-align: center; letter-spacing: 4px; margin-top: 10px;">${object[0]}</p>
								</div>
							</div>
							<div class="col-6" style="padding-left: 50px;">
								<div class="form-floating">
									<h4 class="mb-3">${object[6]}</h4>
									<hr>
									<c:choose>
										<c:when test="${object[3] eq 1}">
											<p class="mb-1">쿠폰상태 : 사용가능</p>
										</c:when>
										<c:when test="${object[3] eq 2}">
											<p class="mb-1">쿠폰상태 : 사용완료</p>
										</c:when>
									</c:choose>
									<p class="mb-1">유효기간 : <fmt:formatDate value="${object[1]}" pattern="yyyy년 MM월 dd일"/></p>
									<p class="mb-1">구매일자 : <fmt:formatDate value="${object[4]}" pattern="yyyy년 MM월 dd일"/></p>
									<p class="mb-1">구매금액 : ${object[5]}원</p>
									
									<p class="mb-1">가게이름 : ${object[9]}</p>
									<p class="mb-1">전화번호 : ${object[10]}</p>
								</div>
							</div>
							<div class="col-12">
								<hr style="margin: 30px 0;">
								<div class="form-floating">
									<p class="mb-10" style="text-align: center;">상품정보</p>
									<p class="mb-0">${object[7]}</p>
								</div>
							</div>
							
							<div class="col-12">
								<button class="btn btn-primary w-100 py-3" id="backBtn" style="margin-top: 50px;">이전으로 돌아가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기프티콘 상세 End -->
	
	<c:import url="../footer.jsp" />
	
	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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