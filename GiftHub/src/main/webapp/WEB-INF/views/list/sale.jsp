<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<meta charset="UTF-8">
<title>Line Chart Example</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
</style>
</head>
<body>
	<c:import url="../top.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">판매내역</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="dropdown">
		<button class="btn btn-primary dropdown-toggle" type="button"
			id="dropdownMenuButton1" data-bs-toggle="dropdown"
			aria-expanded="false">2023년</button>
		<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			<li><a class="dropdown-item" href="#">2023년</a></li>
			<li><a class="dropdown-item" href="#">2024년</a></li>
			<li><a class="dropdown-item" href="#">2025년</a></li>
			<li><a class="dropdown-item" href="#">2026년</a></li>
			<li><a class="dropdown-item" href="#">2027년</a></li>
			<li><a class="dropdown-item" href="#">2028년</a></li>
		</ul>
	</div>


	<canvas id="myChart" width="400" height="200"></canvas>

	<script>
    let myChart = null; // 그래프 객체를 저장할 전역 변수

    function updateChart() {
        // 이전 그래프 삭제
        if (myChart !== null) {
            myChart.destroy();
        }

        fetch(`/getMonthlyCount`)
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('myChart').getContext('2d');
                myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                        datasets: [{
                            label: '월별 판매 수',
                            data: Object.values(data), // 서버에서 반환된 월별 카운트 배열
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: '월'
                                }
                            },
                            y: {
                            	min: 0, // y축의 최소값 설정
                                max: 10, // y축의 최대값 설정
                                ticks: {
                                    stepSize: 1, // 눈금 간격 설정
                                },
                                title: {
                                    display: true,
                                    text: '판매 수'
                                }
                            }
                        }
                    }
                });
            });
    }
   

    window.onload = function() {
        updateChart();
    };

</script>
	<div class="container mt-5">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">상품명</th>
					<th scope="col">쿠폰번호</th>
					<th scope="col">금액</th>
					<th scope="col">사용일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${combinedViewData}"
					varStatus="iterStat">
					<tr>
						<th scope="row">${iterStat.index + 1}</th>
						<td>${data.productname}</td>
						<td>${data.giftno}</td>
						<td>${data.buyprice}</td>
						<td>${data.useddate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-primary justify-content-center">
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
					class="page-link" href="?page=1&storeId=${storeId}"><<</a></li>
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
					class="page-link"
					href="?page=${currentPage - 1}&storeId=${storeId}"><</a></li>

				<c:set var="startPage"
					value="${(currentGroup - 1) * pagesPerGroup + 1}" />
				<c:set var="endPage"
					value="${currentGroup * pagesPerGroup > totalPages ? totalPages : currentGroup * pagesPerGroup}" />
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a
						class="page-link" href="?page=${i}&storeId=${storeId}">${i}</a></li>
				</c:forEach>

				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
					<a class="page-link"
					href="?page=${currentPage + 1}&storeId=${storeId}">></a>
				</li>
				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
					<a class="page-link" href="?page=${totalPages}&storeId=${storeId}">>></a>
				</li>
			</ul>
		</nav>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	<c:import url="../footer.jsp" />
</body>
</html>
