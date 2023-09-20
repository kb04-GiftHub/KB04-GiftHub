<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>커뮤니티</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
</head>

<body>
        <c:import url="../top_customer.jsp" />

	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">커뮤니티</h1>
				</div>
			</div>
		</div>
	</div>
   

        <!-- Projects Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>커뮤니티<span></span></p>
                    <h1 class="text-center mb-5">홍보 및 이벤트 게시판</h1>
                </div>
                
                <!-- 필터 버튼 생성 -->
                <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="col-12 text-center">
                        <ul class="list-inline mb-5" id="portfolio-flters">
                            <li class="mx-2 active" data-filter="*">전체</li>
                            <li class="mx-2" data-filter=".promotion-type-1">홍보</li>
                            <li class="mx-2" data-filter=".promotion-type-2">이벤트</li>
                        </ul>
                    </div>
                </div>
                
                <!-- 게시물 나열 -->
<div class="row g-4 portfolio-container">
    <c:forEach items="${promotions}" var="promotion">
        <!-- promotionType에 따라 필터링 -->
        <c:choose>
            <c:when test="${promotion.promotionType eq 1}">
                <c:set var="promotionTypeClass" value="promotion-type-1" />
                <c:set var="promotionTypeName" value="홍보" />
            </c:when>
            <c:when test="${promotion.promotionType eq 2}">
                <c:set var="promotionTypeClass" value="promotion-type-2" />
                <c:set var="promotionTypeName" value="이벤트" />
            </c:when>
        </c:choose>
       <!--   -->
        <div class="col-lg-4 col-md-6 portfolio-item ${promotionTypeClass} wow fadeInUp" data-wow-delay="0.1s">
            <div class="rounded overflow-hidden">
                <div class="position-relative overflow-hidden">
                    <img class="img-fluid w-100" style="width: 100%; height: 300px;"  src="/resources/promotion_img/${promotion.promotionImage}" alt="" >
                   
                </div>
                <div class="bg-light p-4">
                    <!-- promotionType을 Promotion의 실제 타입으로 표시 -->
                    <p class="text-primary fw-medium mb-2">${promotionTypeName}</p>
                    <h5 class="lh-base mb-0"><a href="/promotion_member/promotionView_detail?promotionNo=${promotion.promotionNo}">${promotion.promotionTitle}</a></h5>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</div>
</div>
        <!-- Projects End -->
        

        <!-- Footer Start -->
        <c:import url="../footer.jsp" />


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
  

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