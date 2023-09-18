<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
<style>
    /* 플레이스홀더 텍스트 대신 아래에 검정색 선을 표시합니다. */
    .form-floating input[type="text"].border-0,
    .form-floating input[type="password"].border-0 {
        border-bottom: 1px solid #000 !important;
        border-radius: 0 !important;
        box-shadow: none !important;
    }

    /* 포커스 시 선의 색상을 변경합니다. */
    .form-floating input[type="text"].border-0:focus,
    .form-floating input[type="password"].border-0:focus {
        border-bottom: 1px solid #000 !important;
        box-shadow: none !important;
    }
    

</style>
    
    
</head>
   
<body>       
	<c:import url="../top_customer.jsp" />
	    <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">GiftHub의 지역 나눔 프로젝트</h1>
                        <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    <!-- Navbar & Hero End -->




<div class="container-xxl py-5">
    <div class="container py-5 px-lg-5">
        <div class="wow fadeInUp" data-wow-delay="0.1s">
            <h4 class="section-title text-secondary justify-content-center"><span></span>기부게시판<span></span></h4>
            <h1 class="text-center mb-5">군포시 기부 단체</h1>
        </div>
        <div class="row g-4">
            <!-- Service 1 -->
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto" style="width: 250px; height: 250px; overflow: hidden;">
                        <img src="/img/donation/장애인.png" alt="" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <h5 class="mb-3">군포시 장애인종합복지관</h5>
                    <p class="m-0">장애가 있는 모든 사람들이 삶, 학습, 일 및 지역사회에 완전히 참여한다는 목표를 실현하기 위해 최선을 다하고 있습니다.</p>
                    <a class="btn btn-square" href="http://localhost:8080/donate"></a>
                </div>
            </div>
         <!-- Service 2 -->
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto" style="width: 250px; height: 250px; overflow: hidden;">
                        <img src="/img/donation/노인.png" alt="" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <h5 class="mb-3">군포시늘푸른노인복지관</h5>
                    <p class="m-0">지역사회와 함께 신노년문화를 만들어가는 늘푸른노인복지관</p>
                    <a class="btn btn-square" href="http://localhost:8080/donate"></a>
                </div>
            </div>
                  <!-- Service 3 -->
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto" style="width: 250px; height: 250px; overflow: hidden;">
                        <img src="/img/donation/청소년.png" alt="" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <h5 class="mb-3">군포시학교밖청소년지원센터</h5>
                    <p class="m-0">군포시청소년지원센터 꿈드림은 학교 밖 청소년의 특성을 고려한 맞춤형 서비스를 제공하여, 학교를 벗어난 청소년들이 당당하게 미래를 설계할 수 있도록 지원하는 학교 밖 청소년 지원센터입니다.</p>
                    <a class="btn btn-square" href="http://localhost:8080/donate"></a>
                </div>
            </div>

            <!-- Service 4 -->
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto" style="width: 250px; height: 250px; overflow: hidden;">
                        <img src="/img/donation/돌봄.png" alt="" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <h5 class="mb-3">군포시다함께돌봄센터</h5>
                    <p class="m-0">소규모 복지시설 지원을 통해 시설과 수혜자 간의 복지서비스 격차를 완화하고, 공공의 영역과 복지기관에서 행.재정적으로 수용하지 못하는 사각지대의 이웃들, 그리고 지역사회에서 필요로 하는 복지욕구에 귀기울이며 따뜻한 나눔을 성실하게 실천하겠습니다.</p>
                    <a class="btn btn-square" href="http://localhost:8080/donate"></a>
                </div>
            </div>

        <!-- Service 5 (한국 컴패션) -->
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto" style="width: 250px; height: 250px; overflow: hidden;">
                        <img src="/img/donation/환경.png" alt="" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <h5 class="mb-3 mt-4">안양군포의왕환경운동연합</h5>
                    <p class="m-0">우리를 위협하는 환경 파괴를 감시하고 우리의 생명을 지켜내겠습니다.</p>
                    <a class="btn btn-square" href="http://localhost:8080/donate"></a>
                </div>
            </div>

            <!-- Service 6 -->
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="service-item d-flex flex-column text-center rounded">
                    <div class="service-image flex-shrink-0 flex-shrink-0 rounded-circle mx-auto" style="width: 250px; height: 250px; overflow: hidden;">
                        <img src="/img/donation/고용.png" alt="" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <h5 class="mb-3">군포고용복지센터</h5>
                    <p class="m-0">우리 고용복지+센터는 주민 여러분께서 한 곳만 방문하면 다양한 고용과 복지서비스를 한 번에 제공받을 수 있도록 고용센터와 안양시 일자리센터, 안양시 복지지원, 안양 여성새로일하기센터, 서민금융지원센터가 함께 모여 서비스를 제공하고 있습니다.</p>
                    <a class="btn btn-square" href="http://localhost:8080/donate"></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
        <!-- Service End -->





















<!-- gifthub-contact Start -->
<div class="container-fluid bg-primary text-light footer wow fadeIn" data-wow-delay="0.1s">
    <div class="container">
        <div class="row g-5">
            <div class="col-md-12 col-lg-3">
                <div class="col text-center" style="text-align: center;"> <!-- inline style 추가 -->
                    <p class="section-title text-white h5 mb-4">GiftHub Contact<span></span></p>
                    <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                    <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                </div>
            </div>
            <div class="col-md-12 col-lg-3">
                <!-- 내용 -->
            </div>
        </div>
    </div>
</div>
<!-- gifthub-contact End -->

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

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
</html>