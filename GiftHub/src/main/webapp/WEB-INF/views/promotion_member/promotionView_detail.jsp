<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>커뮤니티</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b45607c24e81b779e6418cf489de08&libraries=services"></script>
</head>
<style>
/* 목록이동 버튼 스타일 */
.list-button {
    background-color:#0058C6; /* 배경색을 노란색으로 설정 */
    color: white; /* 텍스트 색상을 하얀색으로 설정 */
    padding: 10px 90px; /* 내부 여백 설정 (상하 10px, 좌우 20px) */
    border: none; /* 테두리 없음 */
    border-radius: 5px; /* 버튼 모서리를 둥글게 만듭니다. */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 클릭 가능한 버튼임을 나타냅니다. */
}
    /* 이미지 스타일 */
    .promotion-image {
        width: 100%;
        height: auto; /* 이미지의 높이를 자동으로 조정하여 원래 비율을 유지 */
    }

    /* 오른쪽 글자박스 스타일 */
    .text-box {
        position: absolute;
        top: 0; /* 위쪽에 위치 */
        right: 0; /* 오른쪽에 위치 */
        background-color: #C3DBF8;
        border-radius: 10px;
        padding: 20px;
        z-index: 1; /* 글자박스를 이미지 위에 배치 */
        max-width: 50%; /* 최대 너비 설정 */
    }
</style>
<body>
     <c:import url="../top_customer.jsp" />

	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">커뮤니티</h1>
				</div>
			</div>
		</div>
	</div>

        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
            
    <div class="wow fadeInUp" data-wow-delay="0.1s">
       <span></span>
	        <h3 class="text-center mb-5 section-title text-secondary justify-content-center">
                    <c:choose>
                    	<c:when test="${promotion[5] == 1}"><span></span>홍보<span></span>
                    	</c:when>
                    	<c:when test="${promotion[5] == 2}"><span></span>이벤트<span></span>
                    	</c:when>
                	</c:choose>
            </h3>
	   <span></span>   
    </div>   
            
    <div class="container border border-5 rounded p-4 text-center">            
    <div class="row">
      
    <div class="container">
    <div class="row">
        <!-- 첫 번째 열에 promotionImage 배치 -->
        <div class="col-md-6 wow fadeInUp text-center" data-wow-delay="0.3s">
            <img src="/resources/promotion_img/${promotion[3]}" width="100%" height="auto">
            <br>
            <br>
        </div>
        
        <!-- 두 번째 열에 가게 이름과 제목 배치
        제목과 내용 하나의 열에 배치 -->
        <div class="col-md-6">
                <div class="text-center col-md-12" style="color: white; position: relative; display: inline-block;">
                    <span style="background-color:#0058C6; padding: 10px;border-radius: 30px;font-size: 25px;">
                        ${promotion[6]}
                    </span><br><br>
                </div>
                
                <div class="col-md-12">
                    <h4 style="margin-top: 3px;color: #434242;">${promotion[1]}</h4>
                </div>
                
            <hr>
            <!-- promotionContent를 두 번째 열과 동일한 열에 배치 -->
            <div class="row" style="justify-content: center;">
                <div class="col-md-12 text-center" style="background-color: #D6E8FF; width:90%;height: 250px; display: flex; align-items: center; justify-content: center;border-radius: 15px">
                    <div class="wow fadeInUp" data-wow-delay="0.3s">
                        <p class="text-center" style="color: #434242; white-space: pre-line;font-size:30px;">
                            ${promotion[2]}
                        </p>
                        <br>
                        
                    </div>
                </div>
            </div>
            
        </div>
        
    </div>
</div>
    <br>
    <hr>
    
    <!-- 지도 시작-->
    <div class="text-center" style="width: 100%; height: auto;">
    
    <!--주소 -->
    <div class="col">
    	<div class="text-center" style="position: relative; display: inline-block;justify-content: center;">
             <span style="background-color:#FFE7AC;color:#434242;border-radius: 30px;font-size: 25px;padding:10px;">
    				매장 위치
    		</span>	
    	</div><br><br>
    	
    	<div>
          <h5 style="color:#434242;">${promotion[7]}</h5>
        </div>
	</div>
	
    <!-- 지도 -->
    <div>
         <div id="map" style="width: 100%; height: 440px;"></div>  
    </div>
    
    </div>
    
   
    
    
    
     </div>
     </div>
      <!-- 게시물 이동 버튼 -->
    
    <div class="col-12 text-center">
	    <br>
         <a href="/promotion_member/promotionView_list" class="list-button" style="font-size: 20px" >게시물 목록으로 이동</a>
    </div>
               
    </div>
    </div>
        <!-- Contact End -->
        

        <!-- Footer Start -->
        <c:import url="../footer.jsp" />


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
   

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    
    <!-- 지도 -->
    <script>
    var objectData = JSON.parse('${stores}');
	var address = objectData[7];
	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level : 3
    // 지도의 확대 레벨
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch('${promotion[7]}', function(result, status) {
		// 정상적으로 검색이 완료됐으면
		if (status === kakao.maps.services.Status.OK) {
			
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	      
	        //마커 표시
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});  
	        //지도 중심 이동
			map.setCenter(coords);
		}
    });
   
        // 주소-좌표 변환 객체를 생성합니다
        
        /*var addresses = JSON.parse('${stores}'); // 변수 이름을 'address'에서 'addresses'로 변경
        
        addresses
                .forEach(function(address) {
                    // 주소로 좌표를 검색합니다
                    geocoder
                            .addressSearch(
                                    address.storeAdd2,
                                    function(result, status) {
                                        // 정상적으로 검색이 완료됐으면
                                        if (status === kakao.maps.services.Status.OK) {
                                            var coords = new kakao.maps.LatLng(
                                                    result[0].y,
                                                    result[0].x);
                                            // 결과값으로 받은 위치를 마커로 표시합니다
                                            var marker = new kakao.maps.Marker(
                                                    {
                                                        map : map,
                                                        position : coords,
                                                        // image : markerImage // 'markerImage' 변수가 정의되지 않았으므로 주석 처리
                                                    });
                                        }
                                    });
                });*/
    
</script>
</body>
</html>
