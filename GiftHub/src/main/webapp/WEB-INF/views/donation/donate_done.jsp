<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 완료</title>
<style>
	.py-3 {padding-top: 3rem !important; padding-bottom: 1rem !important}
</style>
</head>
<body>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">기부가 완료되었어요!</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s" style="margin: 100px 0;">
		<div class="container px-lg-5 text-center">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<img src="/img/check.png" style="width: 20%; margin-bottom: 20px;">
					<h1 class="mb-4" style="margin-top: 30px;">MY POINT : <fmt:formatNumber value="${point}" type="currency" currencySymbol=""/>P</h1>
					<p class="mb-4">기부가 완료되었습니다. 감사합니다.</p>
					<hr style="margin: 50px 0;">
					<h4 class="mb-4">${orgDto.orgName}에 이만큼 모였어요!</h4>
					<h1><fmt:formatNumber value="${orgDto.orgTotal}" type="currency" currencySymbol=""/>원</h1>
					<a class="btn btn-primary rounded-pill py-3 px-5" href="/donation/donation_list" style="margin-top: 30px;">기부내역 확인하기</a>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="../footer.jsp" />
</body>
</html>