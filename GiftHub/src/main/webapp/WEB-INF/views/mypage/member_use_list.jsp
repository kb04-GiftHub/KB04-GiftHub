<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script>
	function adjustImageSize(img) {
		var imgElement = $(img);
		var imgWidth = imgElement.width();
		var imgHeight = imgElement.height();

		if (imgWidth > imgHeight) {
			imgElement.css('width', '100%');
			imgElement.css('height', 'auto');
		} else {
			imgElement.css('height', '100%');
			imgElement.css('width', 'auto');
		}
	}
</script>
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
    
    	<!-- Projects Start -->
		<c:choose>
			<c:when test="${list.size() == 0}">
				<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s" style="margin: 100px 0;">
					<div class="container px-lg-5 text-center">
						<div class="row justify-content-center">
							<div class="col-lg-6">
								<h1 class="mb-4">MY GIFTICONS</h1>
								<p class="mb-4">${msg}</p>
								<a class="btn btn-primary rounded-pill py-3 px-5" href="/">기프티콘 구경하기</a>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${list.size() > 0}">
				<div class="container-xxl py-5">
					<div class="container py-5 px-lg-5">
						<div class="wow fadeInUp" data-wow-delay="0.1s">
							<h1 class="text-center mb-5">MY GIFTICONS</h1>
						</div>
						<div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
							<div class="col-12 text-center">
								<ul class="list-inline mb-5" id="portfolio-flters">
									<li class="mx-2 active" data-filter="*">전체</li>
									<li class="mx-2" data-filter=".first">사용가능</li>
									<li class="mx-2" data-filter=".second">사용완료</li>
									<li class="mx-2" data-filter=".third">기간만료</li>
								</ul>
							</div>
						</div>
						<div class="row g-4 portfolio-container">
							<c:forEach items="${list}" var="list">
								<c:choose>
									<c:when test="${list[3] eq 1}">
										<div class="col-lg-3 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.1s" onclick="window.location.href = '/member/mypage/use_detail?giftNo=${list[0]}'">
					                        <div class="rounded overflow-hidden" style="border: 4px solid #E2EFFF">
					                            <div class="position-relative overflow-hidden" style="height: 200px; display: flex; justify-content: center; align-items: center;">
					                                <img class="img-fluid" src="/resources/products/${list[10]}" alt="" id="img" onload="adjustImageSize(this)">
					                            </div>
					                            <div class="p-3" style="background: #E2EFFF; color: gray;">
					                                <p class="mb-0">${list[11]}</p>
					                                <h5 class="lh-base mb-1">${list[8]}</h5>
					                                <p class="mb-0" style="font-size: 10pt; text-align: right;">유효기간 : <fmt:formatDate value="${list[1]}" pattern="yyyy년 MM월 dd일"/></p>
					                            </div>
					                        </div>
					                    </div>
									</c:when>
									<c:when test="${list[3] eq 2}">
										<div class="col-lg-3 col-md-6 portfolio-item second wow fadeInUp" data-wow-delay="0.1s" onclick="window.location.href = '/member/mypage/use_detail?giftNo=${list[0]}'">
					                        <div class="rounded overflow-hidden" style="border: 4px solid #EEEEEE">
					                            <div class="position-relative overflow-hidden" style="height: 200px; display: flex; justify-content: center; align-items: center;">
					                                <img class="img-fluid" src="/resources/products/${list[10]}" alt="" id="img" onload="adjustImageSize(this)">
					                            </div>
					                            <div class="p-3" style="background: #EEEEEE; color: gray;">
					                                <p class="mb-0">${list[11]}</p>
					                                <h5 class="lh-base mb-1">${list[8]}</h5>
					                                <p class="mb-0" style="font-size: 10pt; text-align: right;">유효기간 : <fmt:formatDate value="${list[1]}" pattern="yyyy년 MM월 dd일"/></p>
					                            </div>
					                        </div>
					                    </div>
									</c:when>
									<c:when test="${list[3] eq 3}">
										<div class="col-lg-3 col-md-6 portfolio-item third wow fadeInUp" data-wow-delay="0.1s" onclick="window.location.href = '/member/mypage/use_detail?giftNo=${list[0]}'">
					                        <div class="rounded overflow-hidden" style="border: 4px solid #EEEEEE">
					                            <div class="position-relative overflow-hidden" style="height: 200px; display: flex; justify-content: center; align-items: center;">
					                                <img class="img-fluid" src="/resources/products/${list[10]}" alt="" id="img" onload="adjustImageSize(this)">
					                            </div>
					                            <div class="p-3" style="background: #EEEEEE; color: gray;">
					                                <p class="mb-0">${list[11]}</p>
					                                <h5 class="lh-base mb-1">${list[8]}</h5>
					                                <p class="mb-0" style="font-size: 10pt; text-align: right;">유효기간 : <fmt:formatDate value="${list[1]}" pattern="yyyy년 MM월 dd일"/></p>
					                            </div>
					                        </div>
					                    </div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
		<!-- Projects End -->
        
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