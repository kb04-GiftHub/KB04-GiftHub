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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
<!-- Contact Start -->
<div class="container-xxl py-5">
	<h1 class="text-center text-black animated slideInDown">기프티콘 사용내역</h1>
	<div class="container py-5 px-lg-5" id="image_used">
		<div class="row justify-content-center">
			<div class="col-lg-7">
				<div class="wow">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>기프티콘 번호</th>
								<th>기프티콘 이름</th>
								<th>사용자 ID</th>
								<th>사용 날짜</th>
							</tr>
						</thead>
						<tbody id="gifticonUsedList">
							<c:forEach var="usage" items="${gifticonUsedList}">
								<tr>
									<td>${usage[2]}</td>
									<td>${usage[4]}</td>
									<td>${usage[3]}</td>
									<fmt:formatDate value="${usage[1]}" pattern="yyyy년 MM월 dd일 HH시 mm분" var="dateFormat"/>
									<td>${dateFormat}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
	<!-- Contact End -->

	<c:import url="../footer.jsp" />

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
</div>

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
</body>
</html>