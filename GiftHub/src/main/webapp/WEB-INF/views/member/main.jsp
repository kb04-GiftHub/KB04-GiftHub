<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<style>
.event-square {
	width: 20px; /* 네모 박스의 가로 크기를 조절하세요. */
	height: 20px; /* 네모 박스의 세로 크기를 조절하세요. */
	background-color: blue; /* 네모 박스의 배경색을 설정하세요. */
	position: absolute; /* 절대 위치로 배치합니다. */
	top: 2px; /* 원하는 위치로 조절하세요. */
	left: 2px; /* 원하는 위치로 조절하세요. */
}
</style>

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

	</div>

	<!-- end -->
	<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="eventModalLabel">기프티콘 상세 정보</h5>
            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button> -->
         </div>
         <!-- modal 폼 -->
         <div class="modal-body">
            <p><strong>제목:</strong> <span id="eventTitle"></span></p>
            <!-- <p><strong>시작 시간:</strong> <span id="eventStart"></span></p>
            <p><strong>종료 시간:</strong> <span id="eventEnd"></span></p> -->
            <p><strong>상태:</strong> <span id="eventStatus"></span></p>
            <p><strong>기프티콘 번호:</strong> <span id="eventGiftNo"></span></p>
            <p><strong>바코드 번호:</strong> <span id="eventBarcode"></span></p>
            
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modalClose">닫기</button>
         </div>
      </div>
   </div>
</div>




	<script>
      document.addEventListener('DOMContentLoaded', function() {
      
         var calendarEl = document.getElementById('calendar');
         var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView : 'dayGridMonth', // 달력 초기 뷰 설정
            events : [
            	<c:forEach var="gift" items="${list}">
            		<c:set var="formattedStart" value="${fn:substring(gift[1], 0, 10)}" />
            		<c:set var="formattedEnd" value="${fn:substring(gift[1], 0, 10)}" />
                {
                	id: 1,
                    title: '<c:out value="[${gift[11]}] ${gift[8]}" />',
                    start: '<c:out value="${formattedStart}" />',
                    end: '<c:out value="${formattedEnd}" />',
                    giftStatus: ${gift[3]}, // giftStatus 값을 이벤트 객체에 저장
                    giftNo: ${gift[0]}, // giftNo
                    giftBarcode: '${gift[2]}'
                    /* start: '<c:out value="${gift[1]}" />',
                    end: '<c:out value="${gift[1]}" />' */
                },
            </c:forEach>
           /*  {
        		id: 1,
        		title: 'Test1',
        		start: '2023-09-22',
        		end: '2023-09-22'
        	} */
            ],
            /* eventColor: '#378006', */
            eventRender: function(info) {
                var element = info.el;
               /*  element.innerHTML = '<div class="event-square"></div>'; // 네모 박스로 대체 */
               
               var giftStatus = info.event.extendedProps.giftStatus;

                // giftStatus에 따라 배경색 설정
                if (giftStatus == 1) {
                    element.style.backgroundColor = 'blue';
                } else if (giftStatus == 2) {
                    element.style.backgroundColor = 'red';
                }
            },
         
         eventClick: function(info) {
             // 클릭한 이벤트의 정보를 모달에 채웁니다.
             document.getElementById('eventTitle').textContent = info.event.title;
             /* document.getElementById('eventStart').textContent = info.event.startStr;
             document.getElementById('eventEnd').textContent = info.event.endStr; */
             document.getElementById('eventStatus').textContent = info.event.extendedProps.giftStatus;
			 document.getElementById('eventGiftNo').textContent = info.event.extendedProps.giftNo;
			 document.getElementById('eventBarcode').textContent = info.event.extendedProps.giftBarcode;
             // 모달을 열기 위한 Bootstrap 모달 메서드 호출
             
             /* console.log('이벤트를 클릭했습니다.');
    		 console.log('제목:', info.event.title);
    		 console.log('시작 시간:', info.event.startStr);
    		 console.log('종료 시간:', info.event.endStr);
    		 console.log('상태:', info.event.extendedProps.giftStatus);
    		 console.log('기프티콘 번호:', info.event.extendedProps.giftNo);
    		 console.log('바코드 번호:', info.event.extendedProps.giftBarcode); */
             $('#eventModal').modal('show');
             
             $('#modalClose').click(function(){
	             $('#eventModal').modal('hide');
             });
          },
         });
         calendar.render();
      });
   </script>


	<c:import url="../footer.jsp" />

	<!-- 		<!-- JavaScript Libraries -->
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
	-->
</body>
</html>