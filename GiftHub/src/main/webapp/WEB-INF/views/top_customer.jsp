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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

<style>
	a {
		text-align: center !important;
	}
	
	.dropdown-item:active{
		background-color:#0058C6 !important;
	}
</style>
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
			<nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
				<a href="/member/main" class="navbar-brand p-0">
					<h1 class="m-0">
						<img src="/img/icon.png" alt="Logo"> GiftHub
					</h1>
				</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse text-center" id="navbarCollapse">
					<div class="navbar-nav mx-auto py-0">
						<a href="/member/main" class="nav-item nav-link active">HOME</a> 
						<a href="/product/list" class="nav-item nav-link">구매하기</a>
						<a href="/showMap" class="nav-item nav-link">가맹점찾기</a>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">기부관리</a>
							<div class="dropdown-menu m-0">
								<a href="/donation/donateboard" class="dropdown-item">기부게시판</a>
								<a href="/donation/donate" class="dropdown-item">기부하기</a>
								<a href="/donation/donation_list" class="dropdown-item">기부내역</a>
							</div>
						</div>
						<a href="/promotion_member/promotionView_list" class="nav-item nav-link">커뮤니티</a>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
							<div class="dropdown-menu m-0">
								<a href="/member/mypage/check_pwd" class="dropdown-item">정보수정</a>
								<a href="/member/mypage/use_list" class="dropdown-item">나의 기프티콘</a>
								<a href="/member/mypage/jjim_list" class="dropdown-item">나의 찜</a>
							</div>
						</div>
					</div>
					<div class="navbar-nav py-0" id="loginInfo">
						<div class="nav-item dropdown">
							<img src="/img/user.png" style="width: 45px; border-radius: 50%; border: 3px solid #0058C6; margin-right: 10px;">
							<p class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="margin: 0 !important;
								padding: 0; display: inline;">${user.customerNickname}</p>
							<div class="dropdown-menu m-0">
								<a class="dropdown-item" href="/member/point_charge">
									<img src="/img/coin.png" style="width: 30px;"> 
									 <fmt:formatNumber value="${user.point}" type="currency" currencySymbol=""/> Point
								</a>
								<a href="/logout" class="dropdown-item">로그아웃</a>
							</div>
						</div>
					</div>
				</div>
			</nav>


			<!-- Navbar & Hero End -->
