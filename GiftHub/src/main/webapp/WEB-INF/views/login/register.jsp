<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
            <a href="index" class="navbar-brand p-0">
                <h1 class="m-0"><img src="/img/icon.png" alt="Logo"> GiftHub</h1>
            </a>
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
                        <h1 class="text-white animated slideInDown">회원가입</h1>
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

<!-- 회원가입 폼 Start -->

    <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
            <form>
            <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" placeholder="Your Name">
                        </div>
                        <div class="form-group">
                            <label for="username">아이디</label>
                            <input type="text" class="form-control" id="username" placeholder="Your Username">
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호 입력</label>
                            <input type="password" class="form-control" id="password" placeholder="Your Password">
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">비밀번호 확인</label>
                            <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
                        </div>
                        <div class="form-group">
                            <label for="phone">휴대폰 번호</label>
                            <input type="tel" class="form-control" id="phone" placeholder="Your Phone Number">
                        </div>
                        <div class="form-group">
                            <label for="email">이메일</label>
                            <input type="email" class="form-control" id="email" placeholder="Your Email">
                        </div>
                    </div>
                </div>
                    </div>
                   <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="form-group">
                            <label for="address1">상세주소1</label>
                            <input type="text" class="form-control" id="address1" placeholder="Address Line 1">
                        </div>
                        <div class="form-group">
                            <label for="address2">상세주소2</label>
                            <input type="text" class="form-control" id="address2" placeholder="Address Line 2">
                        </div>
                        <div class="form-group">
                            <label for="address3">상세주소3</label><br>
                            <input type="text" class="form-control" id="address3" placeholder="Address Line 3">
                        </div>
                    </div>
              <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="form-group">
                            <label for="privacyPolicy">개인정보 제공 동의약관</label><br>
                            <textarea class="form-control" id="privacyPolicy" rows="6">동의약관 내용을 여기에 입력하세요.</textarea>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="privacyCheck">
                                <label class="form-check-label" for="privacyCheck">동의합니다.</label><br>
                            </div>
                        </div>
                <div class="row">
                    <div class="col text-center">
                        <div class="d-grid gap-2 d-md-block">
                            <div class="row">
                                <div class="col-6">
                                    <button type="button" class="btn btn-warning btn-sm w-100">고객 회원가입</button>
                                </div>
                                <div class="col-6">
                                    <button type="button" class="btn btn-warning btn-sm w-100">가맹점주 회원가입</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 회원가입 폼 End -->



    
</div>


<style>
    /* 진한 파란색 버튼 스타일 */
    .btn-primary {
        background-color: #0056b3; /* 배경색을 더 진한 파랑색으로 설정 */
        border-color: #0056b3; /* 테두리 색을 더 진한 파랑색으로 설정 */
        color: #fff; /* 텍스트 색을 흰색으로 설정 */
    }

    /* 진한 파란색 소셜 로그인 링크 스타일 */
    .btn-social.btn-primary {
        background-color: #0056b3; /* 배경색을 더 진한 파랑색으로 설정 */
        border-color: #0056b3; /* 테두리 색을 더 진한 파랑색으로 설정 */
        color: #fff; /* 텍스트 색을 흰색으로 설정 */
    }
</style>

<!-- 소셜 가입 버튼 Start -->
<style>
    .btn-social {
        margin-right: 10px; /* 오른쪽 간격 조정 */
    }
</style>
<div class="container-xxl p-0">
    <div class="wow fadeInUp" data-wow-delay="0.1s">
        <div class="d-flex pt-3 justify-content-center"> <!-- 중앙 정렬로 변경 -->
            <a class="btn btn-outline-primary w-25 py-4 btn-social mb-3" href="" style="border-color: #0000FF;">
                <i class="fab fa-facebook-f"></i>
                Facebook으로 가입
            </a>

            <a class="btn btn-outline-primary w-25 py-4 btn-social mb-3" href="" style="border-color: #0000FF;">
                <i class="fab fa-instagram"></i>
                Instagram으로 가입
            </a>

            <a class="btn btn-outline-primary w-25 py-4 btn-social mb-3" href="" style="border-color: #0000FF;">
                <i class="fab fa-google"></i>
                Google로 가입
            </a>

            <a class="btn btn-outline-primary w-25 py-4 btn-social mb-3" href="" style="border-color: #0000FF;">
                <i class="fab fa-naver"></i>
                Naver로 가입
            </a>
        </div>
    </div>
</div>
<!-- 소셜 회원가입 버튼 End -->













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
