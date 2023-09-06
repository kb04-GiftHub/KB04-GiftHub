<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Line Chart Example</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

	<canvas id="myChart" width="400" height="200"></canvas>

	<script>
    fetch('/data')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: data.x,
                    datasets: [{
                        label: 'Sample Data',
                        data: data.y,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        x: {
                            beginAtZero: true
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
</script>

</body>
</html>
