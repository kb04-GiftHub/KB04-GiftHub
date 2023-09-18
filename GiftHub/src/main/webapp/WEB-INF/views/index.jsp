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

<div class="container-xxl bg-primary index-header" style="display: flex; justify-content: center; align-items: center; margin: 0;">
<img class="img-fluid animated zoomIn" src="img/아저씨.png" alt="" style="width: 50%; margin-left: 15px;">
    <div class="container-xxl py-5">
        <div class="container py-5 px-lg-5">
            <div class="wow fadeInUp" data-wow-delay="0.1s">
                <h1 class="text-white mb-4 font-weight-bold" style="font-size: 2.5rem;">장사의 비밀, <br> GIFTHUB에 있습니다.</h1>
                <p class="text-white pb-3 animated slideInDown"> 아직도 기프티콘, 구매하시나요?<br> 직접 만드세요!<br> Gifthub는 소상공인을 위한, 골목 상권을 위한, 우리 가게를 위한 기프티콘 제작 플랫폼입니다.  </p>
                <div class="btn-group mb-3" role="group"> <!-- 이 부분에서 버튼 간격을 추가 -->
                    <a href="/store/login" class="btn btn-secondary py-2 px-4 rounded-pill animated slideInLeft" style="width: 270px;">가맹점 로그인</a>
                    <a href="/member/login" class="btn btn-light py-2 px-4 rounded-pill mx-2 animated slideInRight" style="width: 270px;">일반회원 로그인</a> <!-- 오른쪽 여백 추가 -->
                </div>
            </div>
        </div>
    </div>
</div>
 <div class="custom-background">
<!-- Service Start -->


<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container py-5 px-lg-5">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <p class="section-title text-secondary">
                    About Us<span></span>
                </p>
<h1 class="mb-4" style="white-space: nowrap;">왜 기프티콘을 제작해야 할까요?</h1>
                <h2 class="subtitle">끊임없이 성장하는 시장</h2>
                <p class="mb-4">기프티콘 시장은 연 평균 70%의 성장률을 보이며 끊임없이 성장하고 있어요.</p>
                <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="img/상승그래프.png">
            </div>
<div class="col-lg-6">
    <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="img/고객.png">
    <h2 class="subtitle">확실한 매장 방문 유도 솔루션</h2>
    <p class="mb-4">기프티콘은 배달과 달리, 손님이 매장을 찾아오게 해요.</p>
</div>
        </div>
    </div>
</div>
<!-- About End -->

<!-- Feature Start -->
<div class="container-xxl py-5">

<div class="container py-5 px-lg-5">
    <div class="row g-4">
        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
            <div class="feature-item bg-custom-color rounded text-center p-4">
                <i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>
                <h5 class="mb-3">이벤트 증정 상품</h5>
                <p class="m-0">프랜차이즈 기프티콘이나 백화점 상품권이 아닌
                우리 매장 기프티콘으로 이벤트 상품을 증정해요.</p>
            </div>
        </div>
<div class="col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
    <div class="feature-item bg-custom-color rounded text-center p-4">
        <i class="fa fa-3x fa-thumbs-up text-primary mb-4"></i>
        <h5 class="mb-3">시즌 & 신메뉴 프로모션</h5>
        <p class="m-0">기프티콘을 통해 시즌메뉴와 신메뉴를 홍보하고
        매장 발걸음까지 이어지도록 해요.</p>
    </div>
</div>

        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
            <div class="feature-item bg-custom-color rounded text-center p-4">
                <i class="fa fa-3x fa-heart text-primary mb-4"></i>
                <h5 class="mb-3">재방문 유도하기</h5>
                <p class="m-0">방문이 뜸했거나 기념할 일이 있는 고객에게
                기프티콘을 보내 센스있게 재방문을 유도해요.</p>
            </div>
        </div>
    </div>
</div>

		
    <div class="container py-5 px-lg-5">
    
        <div class="wow fadeInUp" data-wow-delay="0.1s">
            <p class="section-title text-secondary justify-content-center"><span></span>이용 안내<span></span></p>
            <h1 class="text-center mb-5">How To Use GiftHub?</h1>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-icon">
                        <img class="rounded-circle mb-4" src="img/store%202.jpg" alt="" style="width: 160px; height: 160px; ">
                    </div>
                    <h5 class="mb-3 " style="margin-top: 20px;">입점 신청</h5>
                    <p class="m-0" style="margin-top: 20px;">입점 신청 버튼을 통해 <br>
                    GiftHub 입점을 신청해요.</p>
                    <a class="btn btn-square" href="" style="margin-top: 20px;"><i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-icon">
                        <img class=" rounded-circle mb-4" src="img/스크린샷%202023-08-30%20오후%205.01%201@2x.png" alt="" style="width: 160px; height: 160px;">
                    </div>
                    <h5 class="mb-3" style="margin-top: 20px;">가맹 계약</h5>
                    <p class="m-0" style="margin-top: 20px;">승인 심사 후 <br>가맹을 계약하세요.</p>
                    <a class="btn btn-square" href="" style="margin-top: 20px;"><i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-icon">
                        <img class="rounded-circle mb-4" src="img/image%2052.png" alt="" style="width: 160px; height: 160px;">
                    </div>
                    <h5 class="mb-3" style="margin-top: 20px;">가게 OPEN</h5>
                    <p class="m-0" style="margin-top: 20px;">GiftHub에 사장님 <br> 
                    가게가 등록되어요.</p>
                    <a class="btn btn-square" href="" style="margin-top: 20px;"><i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
</div>

<div class="container-xl py-5">
    <!-- Facts Start -->
    <div class="container-xxl bg-primary fact py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container py-5 px-lg-5">
<h1 class="text-center text-white mb-2">GiftHub 이용 가게의 도입 효과를 확인해보세요!</h1><br>
            <div class="row g-4">
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.1s">
						<i class="fa fa-certificate fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">13,000,000</h1>
						<p class="text-white mb-0">월평균 매출 상승</p>
					</div>
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.3s">
						<i class="fa fa-users-cog fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">300</h1>
						<p class="text-white mb-0">신규 가맹점 증가량</p>
					</div>
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.5s">
						<i class="fa fa-users fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">650</h1>
						<p class="text-white mb-0">월간 방문자 증가량</p>
					</div>
					<div class="col-md-6 col-lg-3 text-center wow fadeIn"
						data-wow-delay="0.7s">
						<i class="fa fa-check fa-3x text-secondary mb-3"></i>
						<h1 class="text-white mb-2" data-toggle="counter-up">100</h1>
						<p class="text-white mb-0">기프티콘 재구매율</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Facts End -->


        <!-- Testimonial Start -->
        <div class="container-xxl py-5  wow fadeInUp" data-wow-delay="0.1s">

``

           
            <div class="container py-5 px-lg-5">
                <p class="section-title text-secondary justify-content-center"><span></span>자주 하는 질문<span></span></p>
                <h1 class="text-center mb-5">Q & A</h1>
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item bg-light rounded my-4">                    
          
                        <p class="fs-5"><i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3"></i>프랜차이즈도 입점 가능한가요?</h3>
                    <p>네 가능합니다. 본사와 협의 필요시 협의 후 신청서를 제출해주세요.</p>
                        <div class="d-flex align-items-center">
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded my-4">
                        <p class="fs-5"><i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3"></i>수수료가 있나요?</h3>
                    <p>서비스 중개수수료는 무료입니다. 결제 수수료는 결제 대행 카드 수수료 3.2%(VAT별도)가 부가됩니다.</p>
                        <div class="d-flex align-items-center">
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded my-4">
                        <p class="fs-5"><i class="fa fa-quote-left fa-4x text-primary mt-n4 me-3"></i>정산일과 정산주기는 언제인가요?</h3>
                    <p>GiftHub 정산일은 매주 월요일, 목요일입니다.</p>
                        </div>
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