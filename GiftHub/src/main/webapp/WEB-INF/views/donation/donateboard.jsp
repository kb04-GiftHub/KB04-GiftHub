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

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

	<style>
    	.testimonial-carousel .owl-nav .owl-prev, .testimonial-carousel .owl-nav .owl-next {
		    margin: 20px !important;
    	    width: 50px !important;
    	    height: 50px !important;
    		color: white !important;
    		background: var(--primary) !important;
		}
    </style>
</head>
   
<body>       
	<c:import url="../top_customer.jsp" />
	    <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">지역 나눔 프로젝트</h1>
                    </div>
                </div>
            </div>
        </div>
    <!-- Navbar & Hero End -->

	<!-- Testimonial Start -->
	<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container py-5 px-lg-5">
			<h1 class="text-center mb-5">DONATION PROJECT</h1>
			<div class="owl-carousel testimonial-carousel">
				<div class="testimonial-item rounded my-4" style="background: #E2EFFF;">
					<h3 class="fs-5">
						<i class="fa fa-heart fa-2x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
					</h3>
					<h4 style="margin-top: 15px;">장애인종합복지관</h4>
					<div style="height: 50px">
						<p>장애가 있는 모든 사람들이 삶, 학습, 일 및 지역사회에 완전히 참여한다는 목표를 실현하기 위해 최선을 다하고 있습니다.</p>
					</div>
					<div style="width: 100%; height: 300px;">
                        <img src="/img/donation/장애인종합복지관.png" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
					<div class="d-flex align-items-center"></div>
				</div>
				<div class="testimonial-item rounded my-4" style="background: #E2EFFF;">
					<h3 class="fs-5">
						<i class="fa fa-heart fa-2x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
					</h3>
					<h4 style="margin-top: 15px;">늘푸른노인복지관</h4>
					<div style="height: 50px">
						<p>지역사회와 함께 신노년문화를 만들어가는 늘푸른노인복지관입니다.</p>
					</div>
					<div style="width: 100%; height: 300px;">
                        <img src="/img/donation/노인.png" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
					<div class="d-flex align-items-center"></div>
				</div>
				<div class="testimonial-item rounded my-4" style="background: #E2EFFF;">
					<h3 class="fs-5">
						<i class="fa fa-heart fa-2x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
					</h3>
					<h4 style="margin-top: 15px;">학교밖청소년지원센터</h4>
					<div style="height: 50px">
						<p>학교를 벗어난 청소년들이 당당하게 미래를 설계할 수 있도록 지원하는 청소년 지원센터입니다.</p>
					</div>
					<div style="width: 100%; height: 300px;">
                        <img src="/img/donation/청소년.png" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
					<div class="d-flex align-items-center"></div>
				</div>
				<div class="testimonial-item rounded my-4" style="background: #E2EFFF;">
					<h3 class="fs-5">
						<i class="fa fa-heart fa-2x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
					</h3>
					<h4 style="margin-top: 15px;">다함께돌봄센터</h4>
					<div style="height: 50px">
						<p>복지시설 지원을 통해 시설과 수혜자 간의 복지서비스 격차를 완화하는 돌봄센터입니다.</p>
					</div>
					<div style="width: 100%; height: 300px;">
                        <img src="/img/donation/돌봄.png" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
					<div class="d-flex align-items-center"></div>
				</div>
				<div class="testimonial-item rounded my-4" style="background: #E2EFFF;">
					<h3 class="fs-5">
						<i class="fa fa-heart fa-2x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
					</h3>
					<h4 style="margin-top: 15px;">환경운동연합</h4>
					<div style="height: 50px">
						<p>우리를 위협하는 환경 파괴를 감시하고 우리의 생명을 지켜내겠습니다.</p>
					</div>
					<div style="width: 100%; height: 300px;">
                        <img src="/img/donation/환경.png" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
					<div class="d-flex align-items-center"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Testimonial End -->
	
	<c:import url="../footer.jsp" />

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