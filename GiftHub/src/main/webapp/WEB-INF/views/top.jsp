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
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap"
	rel="stylesheet">

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
	<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0">
			<nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
				<a href='/sale?storeId=${loggedStoreId}' class="navbar-brand p-0">
					<h1 class="m-0"> <img src="/img/icon.png" alt="Logo"> GiftHub </h1>
				</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav mx-auto py-0">
						<a href="/sale?storeId=${loggedStoreId}" class="nav-item nav-link active">HOME</a> 
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">기프티콘관리</a>
							<div class="dropdown-menu m-0">
								<a href="/product" class="dropdown-item">상품등록</a> 
								<a href="/product/myList" class="dropdown-item">내 상품</a> 
								<a href="/gifticon/use?storeId=${loggedStoreId}" class="dropdown-item">기프티콘 사용</a>
								<a href="/gifticon/useList?storeId=${loggedStoreId}" class="dropdown-item">기프티콘 사용내역</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
							<div class="dropdown-menu m-0">
								<a href="/promotion_store/promotion_insert_form" class="dropdown-item">게시글 등록</a>
								<a href="/promotion_store/promotion_list" class="dropdown-item">게시글 조회</a>
								<a href="/promotion_store/promotionMarket_list" class="dropdown-item">전통시장 살리기</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">내역조회</a>
							<div class="dropdown-menu m-0">
								<a href="/sale?storeId=${loggedStoreId}" class="dropdown-item">판매내역</a>
								<a href="/exchange?storeId=${loggedStoreId}" class="dropdown-item">정산내역</a>
							</div>
						</div>
						<a href="/store/mypage/check_pwd" class="nav-item nav-link">마이페이지</a>
					</div>
					<div class="navbar-nav py-0" id="loginInfo">
						<div class="nav-item dropdown">
							<img src="/img/user.png" style="width: 45px; border-radius: 50%; border: 3px solid #0058C6; margin-right: 10px;">
							<p class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="margin: 0 !important;
								padding: 0; display: inline;">${storeUser.storeName}</p>
							<div class="dropdown-menu m-0">
								<a class="dropdown-item" href="/store/point_exchange">
									<img src="/img/coin.png" style="width: 30px;">
									 <fmt:formatNumber value="${storeUser.storePoint}" type="currency" currencySymbol=""/> Point
								</a>
								<a href="/logout" class="dropdown-item">로그아웃</a>
							</div>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar & Hero End -->