<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<meta charset="UTF-8">
<title>정산 내역</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	<c:import url="../top.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">정산 내역</h1>
				</div>
			</div>
		</div>
	</div>
	</div>

	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">CHECK YOUR EXCHANGE</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4"></p>
						<div class="dropdown"
							style="display: flex; justify-content: right; align-items: center; margin-right: 15px; margin-bottom: 20px;">
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

						<hr style="margin-top: 3rem;">
						<div class="container mt-5" id="tableSection">
							<table class="table table-striped"
								style="text-align: center; margin-bottom: 3rem;">
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">정산 계좌</th>
										<th scope="col">정산 금액</th>
										<th scope="col">정산 일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="exchange" items="${pagedStores}"
										varStatus="iterStat">
										<tr>
											<th scope="row">${iterStat.index + 1}</th>
											<td>${exchange.exchangeBank}-
												${exchange.exchangeAccount}</td>
											<td>${exchange.exchangeMoney}</td>
											<td>${exchange.exchangeDate}</td>
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
											class="page-link" id="ggg"
											href="?page=${i}&storeId=${storeId}#tableSection">${i}</a></li>
									</c:forEach>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link"
										href="?page=${currentPage + 1}&storeId=${storeId}">></a>
									</li>
									<li
										class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<a class="page-link"
										href="?page=${totalPages}&storeId=${storeId}">>></a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    let myChart = null; // 그래프 객체를 저장할 전역 변수

    function updateChart() {
        // 이전 그래프 삭제
        if (myChart !== null) {
            myChart.destroy();
        }

        fetch(`/getMonthlyExchange`)
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('myChart').getContext('2d');
                myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                        datasets: [{
                            label: '월별 정산 금액',
                            data: Object.values(data), // 서버에서 반환된 월별 카운트 배열
                            borderColor: 'rgba(0, 88, 198, 1)',
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
                                max: 100000, // y축의 최대값 설정
                                ticks: {
                                    stepSize: 10000, // 눈금 간격 설정
                                },
                                title: {
                                    display: true,
                                    text: '정산 금액'
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
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	<c:import url="../footer.jsp" />
</body>
</html>
