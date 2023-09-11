<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">

<script>
	window.onload = function() {
		if ('${loggedStoreId}'.trim() != '') {
			document.getElementById('logout').style.visibility = 'visible';
		}
	}
</script>

</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<!-- <div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-grow text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div> -->


		<!-- Spinner End -->

	
          
		<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0">
			<nav
				class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
				<a href="/" class="navbar-brand p-0">
					<h1 class="m-0">
						<img src="/img/icon.png" alt="Logo"> GiftHub
					</h1>

				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav mx-auto py-0">
						<a href="/" class="nav-item nav-link active">Home</a> 
						<div class="nav-item dropdown">
							<a href="about" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">기프티콘 관리</a>
							<div class="dropdown-menu m-0">
								<a href="/product" class="dropdown-item">상품등록</a> <a
									href="/gifticon/use" class="dropdown-item">기프티콘 사용</a><a
									href="/gifticon/useList" class="dropdown-item">기프티콘 사용내역</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="service" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">커뮤니티 관리</a>
							<div class="dropdown-menu m-0">
								<a href="sale" class="dropdown-item">게시글 등록</a> 
								<a href="calculate" class="dropdown-item">게시글 조회</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="list" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">내역 관리</a>
							<div class="dropdown-menu m-0">
								<a href="sale" class="dropdown-item">판매 내역</a> <a
									href="exchange" class="dropdown-item">정산 내역</a>
							</div>
						</div>
						<a href="/store/mypage/check_pwd" class="nav-item nav-link">마이페이지</a>
					</div>
					<a href="/logout"
						class="btn rounded-pill py-2 px-4 ms-3 d-none d-lg-block" id="logout" style="visibility: hidden;">LOGOUT</a>
				</div>
			</nav>


			<!-- Navbar & Hero End -->
