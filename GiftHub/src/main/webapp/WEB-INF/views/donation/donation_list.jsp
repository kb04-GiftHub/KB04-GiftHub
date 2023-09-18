<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>기부 내역</title>
</head>
<body>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">기 부 내 역</h1>
					<hr class="bg-white mx-auto mt-0" style="width: 90px;">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb justify-content-center">
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<hr style="margin-top: 3rem;">
	<div class="container mt-5" id="tableSection">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col" class="text-center">순번</th>
					<th scope="col" class="text-center">기부단체명</th>
					<th scope="col" class="text-center">기부금액</th>
					<th scope="col" class="text-center">기부날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="donation" items="${donations}" varStatus="status">
					<tr>
						<td scope="row" class="text-center">${status.index + 1}</td>
						<td class="text-center">${donation.donationOrg.orgName}</td>
						<td class="text-center">${donation.donationAmount}</td>
						<td class="text-center">${donation.donationDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr style="margin-top: 3rem;">
	<c:import url="../footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>