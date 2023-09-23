<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>기부 내역</title>
<style>
.page-link {
	color: #0058C6 !important;
}

.page-item.active .page-link {
	background-color: #0058C6 !important;
	border-color: #0058C6 !important;
	color: white !important;
}
</style>
</head>
<body>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">이만큼 기부하셨어요!</h1>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">CHECK YOUR DONATION</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4"></p>
						<div class="container mt-5" id="tableSection">
							<table class="table table-striped"
								style="text-align: center; margin-bottom: 3rem;">
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">기부단체명</th>
										<th scope="col">기부금액</th>
										<th scope="col">기부날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pagedStores" items="${pagedStores}"
										varStatus="status">
										<tr>
											<td scope="row" class="text-center">${status.index + 1}</td>
											<td class="text-center">${pagedStores.donationOrg.orgName}</td>
											<td class="text-center"><fmt:formatNumber value="${pagedStores.donationAmount}" type="currency" currencySymbol=""/>원</td>
											<td class="text-center"><fmt:formatDate value="${pagedStores.donationDate}" pattern="yyyy년 MM월 dd일"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
										class="page-link" href="?page=1&storeId=${storeId}"><< </a></li>
									<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
										class="page-link" href="?page=${currentPage - 1}"><</a></li>

									<c:set var="startPage"
										value="${(currentGroup - 1) * pagesPerGroup + 1}" />
									<c:set var="endPage"
										value="${currentGroup * pagesPerGroup > totalPages ? totalPages : currentGroup * pagesPerGroup}" />
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<li class="page-item ${i == currentPage ? 'active' : ''}"><a
											class="page-link" id="ggg" href="?page=${i}&#tableSection">${i}</a></li>
									</c:forEach>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link" href="?page=${currentPage + 1}">></a>
									</li>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link" href="?page=${totalPages}">>></a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달창 -->
	<div id="modalImage" class="modal fade" tabindex="-1">
	    <div class="modal-dialog modal-dialog-centered" style="width: 50%;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 id="title" class="modal-title"></h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	            </div>
	            <div class="modal-body">
	                <img src="/img/donation_certificate.png" style="width: 100%;">
	            </div>
	        </div>
	    </div>
	</div>

	<c:import url="../footer.jsp" />

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/counterup/counterup.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="/lib/lightbox/js/lightbox.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
	
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    var tableRows = document.querySelectorAll("tbody tr");
	    var modal = new bootstrap.Modal(document.getElementById("modalImage"));
	
	    tableRows.forEach(function(row) {
	        row.addEventListener("click", function() {
	            modal.show();
	        });
	    });
	});
	</script>
</body>
</html>