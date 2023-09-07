<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Line Chart Example</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
	<select id="monthSelector">
		<option value="1">1월</option>
		<option value="2">2월</option>
		<option value="3">3월</option>
		<option value="4">4월</option>
		<option value="5">5월</option>
		<option value="6">6월</option>
		<option value="7">7월</option>
		<option value="8">8월</option>
		<option value="9">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>

	<canvas id="myChart" width="400" height="200"></canvas>

	<script>
	let myChart = null; // 그래프 객체를 저장할 전역 변수
    function updateChart(month)	 {
        const selectedMonth = parseInt(month);
        const lastDay = new Date(2023, selectedMonth, 0).getDate();
        // 이전 그래프 삭제
        if (myChart !== null) {
            myChart.destroy();
        }
        fetch(`/getCountByMonth?month=`+selectedMonth)
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('myChart').getContext('2d');
                myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: [selectedMonth+`월 1일`, selectedMonth+`월`+ lastDay+`일`],
                        datasets: [{
                            label: 'Gift Used Count',
                            data: [0, data.count], 
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: 'Date'
                                }
                            },
                            y: {
                                title: {
                                    display: true,
                                    text: 'Count'
                                }
                            }
                        }
                    }
                });
            });
    }

    document.getElementById('monthSelector').addEventListener('change', function() {
        updateChart(this.value);
    });

    window.onload = function() {
        const currentMonth = new Date().getMonth() + 1;
        document.getElementById('monthSelector').value = currentMonth;
        updateChart(currentMonth);
    };
</script>



</body>
</html>
