<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.css'
	rel='stylesheet' />
<!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.js'></script> -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>



</head>
<body>
	<%-- <c:import url="../top.jsp" /> --%>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s"></div>

		</div>
	</div>
	<div class="row">


		<!-- start -->
		<div class="container-xxl py-5">
			<div class="container py-5 px-lg-5">
				<div class="row justify-content-center">
					<div class="col-lg-10">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>



		<!-- end -->




		<script>
      document.addEventListener('DOMContentLoaded', function() {
      
         var calendarEl = document.getElementById('calendar');
         var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView : 'dayGridMonth', // 달력 초기 뷰 설정
            events : [
            	<c:forEach var="gift" items="${list}">
                {
                    title: '<c:out value="${gift.giftNo}" />',
                    start: '<c:out value="${gift.giftExp}" />',
                    end: '<c:out value="${gift.giftExp}" />'
                },
            </c:forEach>
            ],
         });
         calendar.render();
      });
   </script>


		<c:import url="../footer.jsp" />

		<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="lib/wow/wow.min.js"></script>
		<script src="lib/easing/easing.min.js"></script>
		<script src="lib/waypoints/waypoints.min.js"></script>
		<script src="lib/counterup/counterup.min.js"></script>
		<script src="lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="lib/isotope/isotope.pkgd.min.js"></script>
		<script src="lib/lightbox/js/lightbox.min.js"></script>
</body>
</html>