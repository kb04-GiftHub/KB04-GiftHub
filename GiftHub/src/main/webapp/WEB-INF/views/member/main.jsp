<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 메인페이지</title>
<style>

.status-blue {
    background-color: #006699 !important;
    border: 2px solid #006699;
}
.status-red {
    background-color: #666666 !important;
    border: 2px solid #666666;
    color: #006699 !important;
    
}
</style>
<link
   href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.css'
   />
<!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.js'></script> -->
<script
   src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
   
<!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/locales/ko.js'></script>
 -->

</head>
<body>
   <%-- <c:import url="../top.jsp" /> --%>
   <c:import url="../top_customer.jsp" />
   <c:set var="imagePath" value="${pageContext.request.contextPath}/resources/products/${list[10]}" />

	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">MY GIFTICON</h1>
				</div>
			</div>
		</div>
	</div>

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
   <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="eventModalLabel">기프티콘 상세 정보</h5>
            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button> -->
         </div>
         <!-- modal 폼 -->
         <div class="modal-body text-center">
            <p><strong>제목:</strong> <span id="eventTitle"></span></p>
            <!-- <p><strong>시작 시간:</strong> <span id="eventStart"></span></p>
            <p><strong>종료 시간:</strong> <span id="eventEnd"></span></p> -->
            <p><strong>상태:</strong> <span id="eventStatus"></span></p>
            <!-- <p><strong>기프티콘 번호:</strong> <span id="eventGiftNo"></span></p>
            <img src="" id="eventImage" alt="이미지" /> -->
            <!-- <p><strong>바코드 번호:</strong> <span id="eventBarcode"></span></p> 실제 기프티콘 이미지 -->
            <img src="" id="eventImage" alt="이미지" />
            
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
            locale: 'ko', // 한글 적용
            initialView : 'dayGridMonth', // 달력 초기 뷰 설정
            
         // dayCellContent 콜백 함수 추가
            dayCellContent: function (info) {
              var number = document.createElement("a");
              number.classList.add("fc-daygrid-day-number");
              // "일"과 "日"을 제거하고 날짜를 설정
              number.innerHTML = info.dayNumberText.replace("일", '').replace("日", '');
              if (info.view.type === "dayGridMonth") {
                return {
                  html: number.outerHTML
                };
              }
              return {
                domNodes: []
              };
            },
            
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
                    giftBarcode: '${gift[2]}',
                    //giftNo: ${gift[0]}, // giftNo
                },
            </c:forEach>
            ],
            eventClassNames: function(arg) {
                var classNames = [];
                var giftStatus = arg.event.extendedProps.giftStatus;
                if (giftStatus == 1) {
                    classNames.push('status-blue');
                } else if (giftStatus == 2 || giftStatus == 3) {
                    classNames.push('status-red');
                }
                return classNames;
            },
            eventRender: function(info) {
                var element = info.el;
               
               var giftStatus = info.event.extendedProps.giftStatus;
            },
         
         eventClick: function(info) {
            
            var eventStatus = info.event.extendedProps.giftStatus;
            var statusText = '';
            
           // eventStatus에 따라 상태 텍스트 설정
               switch (eventStatus) {
                   case 1:
                       statusText = '사용가능';
                       break;
                   case 2:
                       statusText = '사용완료';
                       break;
                   case 3:
                       statusText = '기간만료';
                       break;
                   default:
                       statusText = '알 수 없음';
               }
           
             // 클릭한 이벤트의 정보를 모달에 채웁니다.
             document.getElementById('eventTitle').textContent = info.event.title;
             /* document.getElementById('eventStart').textContent = info.event.startStr;
             document.getElementById('eventEnd').textContent = info.event.endStr; */
             /* document.getElementById('eventStatus').textContent = info.event.extendedProps.giftStatus; */
             document.getElementById('eventStatus').textContent = statusText;
             
 //         document.getElementById('eventGiftNo').textContent = info.event.extendedProps.giftNo;
 //         document.getElementById('eventBarcode').textContent = info.event.extendedProps.giftBarcode;
//        document.getElementById('eventImage').src = "/upload_images/gifticon/" + info.event.extendedProps.giftBarcode;
          document.getElementById('eventImage').src = "/resources/Gifticon/" + info.event.extendedProps.giftBarcode;
          //document.getElementById('eventImage').src = "/resources/Gifticon/2d16ac91-fcfa-41a1-9f5c-a936b7818bc8_gifticon.jpg";
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

   <!--       <!-- JavaScript Libraries -->
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