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
                        <h1 class="text-white animated slideInDown">이용안내</h1>
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

<style>
    /* 수정된 가로 박스 스타일 */
    .container-xxl h2 {
        font-size: 24px;
    }

    /* 수정된 가로 박스 스타일 */
    .info-box {
        background-color: rgba(173, 216, 230, 0.4); 
        padding: 10px 20px; /* 위아래 여백 줄임 */
        border-radius: 3px;
        margin-top: 20px; /* 상단 여백 조절 */
        margin-bottom: 20px; /* 하단 여백 조절 */
    }

    .info-box img {
        max-width: 100%;
        height: auto;
    }

    /* 각 박스의 텍스트 스타일 수정 */
    .info-box h2 {
        font-weight: bold; /* 글꼴 두껍게 */
        font-size: 18px; /* 글꼴 크기 */
        color: #333; /* 진한 회색 텍스트 색상 */
        margin-bottom: 8px; /* 텍스트 아래 여백 조절 */
    }

    /* Q&A 스타일 */
    .container-xxl h3 {
        font-size: 20px;
        margin-top: 20px;
    }

    /* Q&A 섹션의 질문과 답변을 위 아래로 배치 */
    .container-xxl .col-md-6 {
        margin-bottom: 20px;
    }
</style>




<div class="container-xxl py-5">
    <!-- 입점신청, 가맹계약, 가게오픈 투명 연하늘색 박스 -->
    <div class="row justify-content-center">
        <div class="col-md-4 info-box text-left"> <!-- 입점신청 - 왼쪽 정렬 -->
            <h2 class="text-center">입점신청</h2>
        </div>
        <div class="col-md-4 info-box text-center"> <!-- 가맹계약 - 가운데 정렬 -->
            <h2 class="text-center">가맹계약</h2>
        </div>
        <div class="col-md-4 info-box text-right"> <!-- 가게오픈 - 오른쪽 정렬 -->
            <h2 class="text-center">가게오픈</h2>
        </div>
    </div>
    <div class="row mt-4">
        <!-- 왼쪽 블록 (Step 1) -->
 <div class="col-md-4 text-center">
    <h3>STEP 1</h3>
    <img class="img-fluid" src="img/store%202.jpg" alt="Step 1 이미지" style="width: 80%; height: auto;">
    <p>입점 신청 버튼을 통해 <br>
    GiftHub 입점을 신청해요.</p>
</div>

        <!-- 가운데 블록 (Step 2) -->
         <div class="col-md-4 text-center">
            <h3>STEP 2</h3>
            <img class="img-fluid" src="img/스크린샷%202023-08-30%20오후%205.01%201@2x.png" alt="Step 1 이미지">
            <p>승인 심사 후 가맹을 계약하세요.</p>
        </div>
        <!-- 오른쪽 블록 (Step 3) -->
        <div class="col-md-4 text-center">
            <h3>STEP 3</h3>
            <img class="img-fluid" src="img/image%2052.png" alt="Step 1 이미지">
            <p>GiftHub에 사장님 <br> 
가게가 등록되어요.</p>
        </div>
    </div>
</div>


<div class="container-xxl py-5">
    <!-- Q&A 섹션 -->
    <div class="row">
        <div class="col-12 text-center">
            <h2>Q&A</h2>
        </div>
    </div>

    
    <div class="row justify-content-center mt-5">
        <div class="col-md-8" style="background-color: rgba(135, 206, 235, 0.2); padding: 20px; border-radius: 5px; ">
            <!-- Q&A 섹션 -->
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <h3 class="text-center">Q. 프랜차이즈도 입점 가능한가요?</h3>
                    <p>네 가능합니다. 본사와 협의 필요시 협의 후 신청서를 제출해주세요.</p>
                    <hr style="border-top: 1px solid #000;">
                </div>
                <div class="col-md-12">
                    <h3 class="text-center">Q. 수수료가 있나요?</h3>
                    <p>서비스 중개수수료는 무료입니다. 결제 수수료는 결제 대행 카드 수수료 3.2%(VAT별도)가 부가됩니다.</p>
                    <hr style="border-top: 1px solid #000;">
                </div>
                <div class="col-md-12">
                    <h3 class="text-center">Q. 정산일과 정산주기는 언제인가요?</h3>
                    <p>GiftHub 정산일은 매주 월요일, 목요일입니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>

        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>Q & A<span></span></p>
                    <h1 class="text-center mb-5">질문 등록하기</h1>
                </div>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Your Name">
                                            <label for="name">성함</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="email" placeholder="Your Email">
                                            <label for="email">연락받을 이메일</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="subject" placeholder="Subject">
                                            <label for="subject">제목</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px"></textarea>
                                            <label for="message">내용</label>
                                        </div>
<div class="col-12">
    <button class="btn btn-primary w-100 py-3" type="submit" onclick="reloadPage()">질문 등록</button>
</div>

<script>
    function reloadPage() {
        location.reload(); // 현재 페이지를 리로드합니다.
    }
</script>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->



<style>
    /* 진한 파란색 버튼 스타일 */
    .btn-primary {
        background-color: #0056b3; /* 배경색을 더 진한 파랑색으로 설정 */
        border-color: #0056b3; /* 테두리 색을 더 진한 파랑색으로 설정 */
        color: #fff; /* 텍스트 색을 흰색으로 설정 */
    }
</style>



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

</body>
</html>