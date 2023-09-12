<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기부내역</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 </head>
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
        <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
               <a href="" class="navbar-brand p-0">
                <h1 class="m-0">
                	<img src ="img/icon.png" alt="Logo">
                	GiftHub</h1>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav mx-auto py-0">
                    <a href="index.html" class="nav-item nav-link">이용안내</a>
                    <a href="about.html" class="nav-item nav-link">커뮤니티</a>
                    <a href="service.html" class="nav-item nav-link">우리동네가맹점찾기</a>
                    <a href="project.html" class="nav-item nav-link">구매하기</a>
                    <a href="project.html" class="nav-item nav-link">마이페이지</a>
                </div>
            </div>
        </nav>

        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">기부내역</h1>
                        <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar & Hero End -->

<style>
    .custom-h5 {
        font-size: 16px; /* 원하는 크기로 조정하세요 */
    }
</style>
<div class="container-xxl py-5">
    <div class="container py-5 px-lg-5">
        <div class="wow fadeInUp" data-wow-delay="0.1s">
            <p class="section-title text-secondary justify-content-center"><span></span>DONATIONS<span></span></p>
            <h1 class="text-center mb-5">기부내역</h1>
        </div>
        <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
            <div class="col-12 text-center mb-3">
                <button class="btn btn-primary mx-2" data-filter="all">모든 게시글</button>
                <button class="btn btn-primary mx-2" data-filter="last-month">최근 1개월</button>
                <button class="btn btn-primary mx-2" data-filter="last-week">최근 1주일</button>
            </div>
        </div>
        <div class="row g-4 portfolio-container">
            <div class="col-lg-4 col-md-6 portfolio-item" data-date="2023-09-10">
                <div class="rounded overflow-hidden">
                    <div class="position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="img/사랑의 열매.png" alt="">
                        <div class="portfolio-overlay">
                            <a class="btn btn-square btn-outline-light mx-1" href="img/기부증서.png" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                            <a class="btn btn-square btn-outline-light mx-1" href="https://chest.or.kr/base.do"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                    <div class="bg-light p-4">
                        <p class="text-primary fw-medium mb-2">사랑의 열매</p>
                        <h5 class="lh-base mb-0 custom-h5">사랑의 열매는 나와 가족을 사랑하는 마음으로 이웃에게 사랑을 전하자는 나눔의 의미를 담고 있습니다.</h5>
                    </div>
                </div>
            </div>
                   <div class="col-lg-4 col-md-6 portfolio-item" data-date="2023-09-09">
                        <div class="rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/유니세프.png" alt="">
                                <div class="portfolio-overlay">
                                    <a class="btn btn-square btn-outline-light mx-1" href="img/기부증서.png" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                    <a class="btn btn-square btn-outline-light mx-1" href="https://www.unicef.or.kr/?trackcode=g_kad&utm_source=google&utm_medium=cpc&utm_term=%EC%9C%A0%EB%8B%88%EC%84%B8%ED%94%84&utm_campaign=brand&mac_ad_key=2011231204&gad=1&gclid=Cj0KCQjw0vWnBhC6ARIsAJpJM6cK4zRMdLhLoKwKpbTY1XMq0jzhbdAzvaYbuYeKIZ7gPIKTrGpEHPUaApBjEALw_wcB"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                            <div class="bg-light p-4">
                                <p class="text-primary fw-medium mb-2">유니세프</p>
                                <h5 class="lh-base mb-0 custom-h5">월 30,000원 이면, 전 세계 어린이를 위해 연필 7,200 자루를 지원할 수 있습니다.</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 portfolio-item" data-date="2022-11-10">
                        <div class="rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/적십자.png" alt="">
                                <div class="portfolio-overlay">
                                    <a class="btn btn-square btn-outline-light mx-1" href="img/기부증서.png" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                    <a class="btn btn-square btn-outline-light mx-1" href="https://www.redcross.or.kr/main/main.do"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                            <div class="bg-light p-4">
                                <p class="text-primary fw-medium mb-2">대한 적십자사</p>
                                <h5 class="lh-base mb-0 custom-h5">모든 활동을 투명하게 공개합니다.</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 portfolio-item" data-date="2023-08-29">
                        <div class="rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/월드비전.png" alt="">
                                <div class="portfolio-overlay">
                                    <a class="btn btn-square btn-outline-light mx-1" href="img/기부증서.png" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                    <a class="btn btn-square btn-outline-light mx-1" href="https://www.worldvision.or.kr/campaign/2023/yongil/index.asp?&utm_source=google&utm_medium=searchad&utm_campaign=searchad&utm_term=%EC%9B%94%EB%93%9C%EB%B9%84%EC%A0%84&mcode=2836&gclid=Cj0KCQjw0vWnBhC6ARIsAJpJM6cKzLlWsTkjMNUybL2150Gls4C743CKhFWNs1bR3hrZnTrl2ePf3b8aAq_yEALw_wcB"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                            <div class="bg-light p-4">
                                <p class="text-primary fw-medium mb-2">월드비전</p>
                                <h5 class="lh-base mb-0 custom-h5">오늘도 아픈 가족을 돌보기 위해 택배를 나르는 16살 용일이에게 따뜻한 관심을 가져주세요.</a>
                            </div>
                        </div>
                    </div>
                   <div class="col-lg-4 col-md-6 portfolio-item" data-date="2023-07-30">
                        <div class="rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/한국컴패션.png" alt="">
                                <div class="portfolio-overlay">
                                    <a class="btn btn-square btn-outline-light mx-1" href="img/기부증서.png" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                    <a class="btn btn-square btn-outline-light mx-1" href="https://www.compassion.or.kr/"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                            <div class="bg-light p-4">
                                <p class="text-primary fw-medium mb-2">한국 컴패션</p>
                                <h5 class="lh-base mb-0 custom-h5">정직하고 효율적인 후원금 사용으로 어린이 양육에 집중합니다</a>
                            </div>
                        </div>
                    </div>
                   <div class="col-lg-4 col-md-6 portfolio-item" data-date="2022-03-03">
                        <div class="rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/세이브더칠드런.png" alt="">
                                <div class="portfolio-overlay">
                                    <a class="btn btn-square btn-outline-light mx-1" href="img/기부증서.png" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                    <a class="btn btn-square btn-outline-light mx-1" href="https://www.sc.or.kr/"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                            <div class="bg-light p-4">
                                <p class="text-primary fw-medium mb-2">세이브더칠드런</p>
                                <h5 class="lh-base mb-0 custom-h5">오직 아동만을 위해 100년간 활동 중인 투명한 국제NGO. SAVEONE 긴급구호 팔찌. 저소득가정 반찬 지원. 아동 정기후원.</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Projects End -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
<script>
    // 버튼 클릭 이벤트 핸들러 등록
    $("button").click(function () {
        var filter = $(this).data("filter");
        filterPosts(filter);
    });

    // 필터링을 수행하는 함수
    function filterPosts(filter) {
        $(".portfolio-item").each(function () {
            var postDate = new Date($(this).data("date"));
            var currentDate = new Date();

            if (filter === "all" ||
                (filter === "last-month" && postDate >= new Date(currentDate.getFullYear(), currentDate.getMonth() - 1, currentDate.getDate())) ||
                (filter === "last-week" && postDate >= new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() - 7))) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }

    // 초기에 모든 게시글 보기
    filterPosts("all");
</script>




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