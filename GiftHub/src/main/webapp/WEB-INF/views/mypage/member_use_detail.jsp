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

        <!-- Projects Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <h1 class="text-center mb-5">MY GIFTICONS</h1>
                </div>
                <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="col-12 text-center">
                        <ul class="list-inline mb-5" id="portfolio-flters">
                            <li class="mx-2 active" data-filter="*">All</li>
                            <li class="mx-2" data-filter=".first">Available</li>
                            <li class="mx-2" data-filter=".second">Expired</li>
                        </ul>
                    </div>
                </div>
                <div class="row g-4 portfolio-container">
                	
                	<c:forEach items="${list}" var="list">
						<c:choose>
							<c:when test="${list[2] eq 1}">
								<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.1s">
			                        <div class="feature-item rounded text-center p-4" style="background: #E2EFFF;">
										<img alt="" src="/img/check.png" style="width: 10%; margin-bottom: 15px;">
										<h5 class="mb-3">${list[5]}</h5>
										<p class="m-0">~ <fmt:formatDate value="${list[1]}" pattern="yyyy년 MM월 dd일"/></p>
									</div>
			                    </div>
							</c:when>
							<c:when test="${list[2] eq 2}">
								<div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp" data-wow-delay="0.1s">
			                        <div class="feature-item rounded text-center p-4" style="background: #eeeeee;">
										<img alt="" src="/img/delete.png" style="width: 10%; margin-bottom: 15px;">
										<h5 class="mb-3">${list[5]}</h5>
										<p class="m-0">~ <fmt:formatDate value="${list[1]}" pattern="yyyy년 MM월 dd일"/></p>
									</div>
			                    </div>
							</c:when>
						</c:choose>
					</c:forEach>
                </div>
            </div>
        </div>
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