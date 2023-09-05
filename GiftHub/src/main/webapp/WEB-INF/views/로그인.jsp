<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="m-0">GiftHub</h1>
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
                </div>
            </nav>

            <div class="container-xxl py-5 bg-primary hero-header">
                <div class="container my-5 py-5 px-lg-5">
                    <div class="row g-5 py-5">
                        <div class="col-12 text-center">
                            <h1 class="text-white animated slideInDown">로그인</h1>
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


        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
              
                            <form>
          									 <div class="d-flex pt-2">
                            <a class="btn btn-primary w-30 py-3 btn-social" href="">Facebook으로 로그인<i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-primary w-30 py-3 btn-social" href="">Instagram으로 로그인<i class="fab fa-instagram"></i></a>
                            <a class="btn btn-primary w-30 py-3 btn-social" href="">Google로 로그인<i class="fab fa-google"></i></a>
                            <a class="btn btn-primary w-30 py-3 btn-social" href="">Naver로 로그인<i class="fab fa-naver"></i></a><br>
                            <a class="btn btn-outline-light" href=""ID<i class="fab fa-naver"></i></a>
                        </div>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            ID : <input type="text" class="form-control" id="name" placeholder="Your Name">
                                            Password : <label for="name"></label>
                                        </div>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Your Password"><br>
                                            <label for="name"></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating"> <br>

		<br><br><br><br><br><br><br>
		 <div class="row g-3">
         <div class="col-md-6">
		<input type="checkbox" name="cb" value=""> 아이디 저장 <br>
		<button>고객 로그인</button>
		 <button>가맹점주 로그인</button><br>
   		 <button>아이디 찾기</button>
   		 <button>비밀번호 찾기</button><br>
   		   </div>
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="wow fadeInUp" data-wow-delay="0.3s">
                            <p class="text-center mb-4">아직 GiftHub 회원이 아니신가요? <br>
                            <a href="https://htmlcodex.com/contact-form">회원가입</a></p>
   		


		<%
		session.setAttribute("id", "");
		%>
		
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">로그인</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <div class="container-fluid bg-primary text-light footer wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5 px-lg-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">GiftHub Contact<span></span></p>
                        <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                       
                    </div>
                    <div class="col-md-6 col-lg-3">
                        	
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

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</body>
</html>