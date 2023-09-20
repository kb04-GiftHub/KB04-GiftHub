<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 사용내역</title>
<style>
	#wrap2{
	height:38px;
	display:flex;
	flex-direction:row;
	flex-wrap: nowrap;
	justify-content:center;
	align-items: stretch;
	}
</style>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
<c:import url="../top.jsp" />

<div class="container-xxl py-5 bg-primary hero-header">
	<div class="container my-5 py-5 px-lg-5">
		<div class="row g-5 py-5">
			<div class="col-12 text-center">
				<h1 class="text-white animated slideInDown">기프티콘 관리</h1>
			</div>
		</div>
	</div>
</div>

<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">기프티콘 사용내역</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-12" id="tableSection">
								<table class="table table-striped" style="text-align: center;">
									<thead>
										<tr>
											<th scope="col">순번</th>
											<th scope="col">기프티콘 번호</th>
											<th scope="col">기프티콘 이름</th>
											<th scope="col">사용자 ID</th>
											<th scope="col">사용 날짜</th>
										</tr>
									</thead>
									<tbody id="gifticonUsedList">
										<c:forEach var="usage" items="${pagedList}" varStatus="status">
											<tr>
												<td scope="row" class="text-center">${(currentPage*10)+status.index -9}</td>
												<td class="text-center">${usage[2]}</td>
												<td class="text-center">${usage[4]}</td>
												<td class="text-center">${usage[3]}</td>
												<fmt:formatDate value="${usage[1]}" pattern="yyyy년 MM월 dd일 HH시 mm분" var="dateFormat"/>
												<td class="text-center">${dateFormat}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
										class="page-link" href="?page=1&storeId=${storeId}"><< </a></li>
									<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
										class="page-link" href="?page=${currentPage - 1}&storeId=${storeId}"><</a></li>

									<c:set var="startPage"
										value="${(currentGroup - 1) * pagesPerGroup + 1}" />
									<c:set var="endPage"
										value="${currentGroup * pagesPerGroup > totalPages ? totalPages : currentGroup * pagesPerGroup}" />
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<li class="page-item ${i == currentPage ? 'active' : ''}"><a
											class="page-link" id="ggg" href="?page=${i}&storeId=${storeId}&#tableSection">${i}</a></li>
									</c:forEach>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link" href="?page=${currentPage + 1}&storeId=${storeId}">></a>
									</li>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link" href="?page=${totalPages}&storeId=${storeId}">>></a>
									</li>
								</ul>
							</nav>
							</div>
							<div class="col-lg-12 text-center">
								<hr style="margin: 50px 0;">
								<p class="mb-4">판매내역을 그래프로 한눈에 확인 가능합니다!</p>
								<a class="btn btn-primary rounded-pill py-3 px-5" href="/sale?storeId=${loggedStoreId}">판매내역 확인하기</a>
							</div>
							<%-- <div id="wrap2">
								<ul id="paging" class="pagination">
									<li class="page-item"><a class="page-link" href="noticeList?cpage=${cpage-1}">«</a></li>
									<c:forEach var="i" begin="1" end="${pageCount}">
										<li class="page-item">
											<a style="<c:if test="${i eq cpage}">background-color:gainsboro;</c:if>" class="page-link" href="useList?cpage=${i}">${i}</a>
										</li>
									</c:forEach>
									<li class="page-item"><a class="page-link" href="useList?cpage=${cpage+1}">»</a></li>
								</ul>
							<div> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="../footer.jsp" />

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/lib/wow/wow.min.js"></script>
<script src="/lib/easing/easing.min.js"></script>
<script src="/lib/waypoints/waypoints.min.js"></script>
<script src="/lib/counterup/counterup.min.js"></script>
<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/lib/isotope/isotope.pkgd.min.js"></script>
<script src="/lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="/js/main.js"></script>
</body>
</html>