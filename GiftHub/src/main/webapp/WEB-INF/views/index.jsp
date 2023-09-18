<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>GiftHub</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/icon.png" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <style>
    	.btn {
    		display: flex;
    		flex-direction: column;
    		justify-content: center;
    	}
    	
    	.testimonial-carousel .owl-nav .owl-prev, .testimonial-carousel .owl-nav .owl-next {
    		margin: 20px;
    	    width: 50px;
    	    height: 50px;
    		color: white;
    		background: var(--primary);
		}
		
		.py-5 {
			padding-top: 4rem !important;
			padding-bottom: 4rem !important;
		}
    </style>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0" style="height: 80px">
                <a href="" class="navbar-brand p-0">
                    <h1 class="m-0"><img src="img/icon.png" alt="Logo"> GiftHub</h1>
                </a>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav mx-auto py-0">
                    	<!-- 테스트 -->
	                    <div class="navbar-nav py-0" style="color: white; font-weight: 500; font-size: 15pt;">
	                    	<c:if test="${not empty loggedStoreId}">${loggedStoreId}/STORE 로그인 -ing</c:if>
	                    	<c:if test="${not empty loggedMemberId}">${loggedMemberId}/MEMBER 로그인 -ing</c:if>
	                    </div>
                    </div>
                    <div class="nav-item dropdown" >
                    	<a href="" class="nav-link dropdown-toggle"
                    		data-bs-toggle="dropdown" style="color: white; font-weight: 500; font-size: 15pt;">Get Started</a>
						<div class="dropdown-menu m-0">
							<a href="store/register" class="dropdown-item">점주님 회원가입</a>
							<a href="member/register" class="dropdown-item">일반회원 회원가입</a>
						</div>
					</div>
                </div>
            </nav>

			<div class="container-xxl bg-primary hero-header" style="display: flex; justify-content: center; align-items: center; margin: 0; padding: 10rem 0;">
			<img class="img-fluid animated zoomIn" src="/img/mainImg.png" alt="" style="width: 40%; margin: 0 50px;">
			    <div class="container-xxl py-5">
			        <div class="container py-5 px-lg-5">
			            <div class="wow fadeInUp" data-wow-delay="0.1s">
			                <h1 class="text-white mb-4 font-weight-bold" style="font-size: 2.5rem; margin-top: 70px;">우리 동네 맛집</h1>
			                <h1 class="text-white mb-4 font-weight-bold" style="font-size: 2.5rem;">GIFTHUB에 있습니다.</h1>
			                <p class="text-white pb-3 animated slideInDown" style="padding-bottom: 0 !important; padding-top: 15px; margin-bottom: 7px;">기프티콘이 없어서 아쉬웠던 동네 맛집이 있나요?</p>
			                <p class="text-white pb-3 animated slideInDown" style="padding: 0 !important; margin-bottom: 7px;">GIFTHUB에서 찾아볼 수 있습니다!</p>
			                <p class="text-white pb-3 animated slideInDown">GIFTHUB는 소상공인과 골목 상권, 우리 가게를 위한 기프티콘 서비스입니다.</p>
			                <div class="btn-group mb-3" role="group">
			                    <a href="/store/login" class="btn btn-secondary py-2 px-4 rounded-pill animated slideInLeft"
			                    	style="width: 270px; height: 55px; font-weight: 700;">가맹점 로그인</a>
			                    <a href="/member/login" class="btn btn-light py-2 px-4 rounded-pill mx-2 animated slideInRight"
			                    	style="width: 270px; height: 55px; font-weight: 700;">일반회원 로그인</a>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			
			<!-- About Start -->
			<div class="container-xxl py-5">
				<div class="container py-5 px-lg-5">
					<div class="wow fadeInUp" data-wow-delay="0.1s">
			            <h1 class="text-center mb-5">왜 기프티콘을 제작해야 할까요?</h1>
			        </div>
			        <div class="row">
				        <div class="col-6 text-center">
				        	<h4 class="subtitle">끊임없이 성장하는 시장</h4>
				        	<p class="mb-4">연 평균 70%의 성장률을 보이며 끊임없이 성장하고 있어요.</p>
						    <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="img/상승그래프.png" style="height: 300px;">
						</div>
						<div class="col-6 text-center">
						    <h4 class="subtitle">확실한 매장 방문 유도 솔루션</h4>
						    <p class="mb-4">기프티콘은 배달과 달리, 손님이 매장을 찾아오게 해요.</p>
						    <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="img/고객.png" style="height: 300px;">
						</div>
					</div>
			    </div>
			</div>
			<!-- About End -->
			
			<!-- Service Start -->
			<div class="container-xxl py-5">
				<div class="container py-5 px-lg-5">
					<div class="wow fadeInUp" data-wow-delay="0.1s">
			            <h1 class="text-center mb-5">HOW TO USE GIFTHUB ?</h1>
			        </div>
				    <div class="row g-4">
				        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
				            <div class="feature-item bg-custom-color rounded text-center p-4">
				                <i class="fa fa-3x text-primary mb-4">
				                	<img src="/img/number-1.png" style="width: 70px;">
				                </i>
				                <h4 class="mb-3">회원가입</h4>
				                <p class="m-0">회원가입을 진행해주세요.</p>
				            </div>
				        </div>
						<div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
				            <div class="feature-item bg-custom-color rounded text-center p-4">
				                <i class="fa fa-3x text-primary mb-4">
				                	<img src="/img/number-2.png" style="width: 70px;">
				                </i>
				                <h4 class="mb-3">상품등록</h4>
				                <p class="m-0">상품을 등록해주세요.</p>
				            </div>
				        </div>
				        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
				            <div class="feature-item bg-custom-color rounded text-center p-4">
				                <i class="fa fa-3x text-primary mb-4">
				                	<img src="/img/number-3.png" style="width: 70px;">
				                </i>
				                <h4 class="mb-3">매출분석</h4>
				                <p class="m-0">그래프로 한눈에 확인할 수 있어요.</p>
				            </div>
				        </div>
				    </div>
			    </div>
			</div>
			<!-- Service End -->
			
			<!-- Testimonial Start -->
	        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
	            <div class="container py-5 px-lg-5">
	                <h1 class="text-center mb-5">Q & A</h1>
	                <div class="owl-carousel testimonial-carousel">
	                    <div class="testimonial-item rounded my-4" style="background: #E2EFFF;">                    
	                        <h3 class="fs-5">
	                        	<i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
	                        	프랜차이즈도 입점 가능한가요?
	                        </h3>
	                    	<p>프랜차이즈는 입점 불가능합니다. <br> GIFTHUB는 소상공인과 골목상권을 위한 서비스입니다.</p>
	                        <div class="d-flex align-items-center"></div>
	                    </div>
	                    <div class="testimonial-item rounded my-4" style="background: #E2EFFF;">                    
	                        <h3 class="fs-5">
	                        	<i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
	                        	수수료가 있나요?
	                        </h3>
	                    	<p>서비스 중개 수수료는 무료입니다. <br> 무료로 기프티콘을 제작해보세요.</p>
	                        <div class="d-flex align-items-center"></div>
	                    </div>
	                    <div class="testimonial-item rounded my-4" style="background: #E2EFFF;">                    
	                        <h3 class="fs-5">
	                        	<i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3" style="color: #0058C6 !important;"></i>
	                        	정산일은 언제인가요?
	                        </h3>
	                    	<p>고객이 기프티콘을 구매하면 점주님 포인트가 올라갑니다. <br> 원하는 시기에 포인트 환전이 가능합니다.</p>
	                        <div class="d-flex align-items-center"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Testimonial End -->

	<c:import url="./footer.jsp" />



<!-- gifthub-contact Start -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Check JavaScript -->
	<script>
		window.onload = function() {
		    if ('${msg}' != '') {
		        alert('${msg}');
		    }
		};
	</script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>