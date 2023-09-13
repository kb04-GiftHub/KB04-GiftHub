<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DGital - Digital Agency HTML Template</title>
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
    background-color: #ffc107; /* 배경색을 노란색으로 설정 */
    color: white; /* 텍스트 색상을 하얀색으로 설정 */
    padding: 10px 190px; /* 내부 여백 설정 (상하 10px, 좌우 20px) */
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
     <c:import url="top.jsp" />

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
                    <p class="section-title text-secondary justify-content-center"><span></span>커뮤니티<span></span></p>
                    <h1 class="text-center mb-5 ">게시물 상세보기</h1>
                </div>
                
                
            <div class="row justify-content-center">
            
            <div class="row ">
    <!-- 왼쪽 컬럼: promotionImage -->
    <div class="col-lg-5" style="background-color: #C8DFFD; border-radius: 10px; padding: 20px;">
        <div class="wow fadeInUp" data-wow-delay="0.3s">
            <img src="${pageContext.request.contextPath}/upload_images/promotion/${promotion[3]}" width="100%">
        </div>
    </div>

    <!-- 오른쪽 컬럼: promotionTitle, storeName, promotionDate, promotionContent -->
    <div class="col-lg-7" style="background-color: #C8DFFD; border-radius: 10px; padding: 20px;">
        <div class="wow fadeInUp" data-wow-delay="0.3s">
            <h6 class="text-center" style="color: #434242">
                <br>
                <c:choose>
                    <c:when test="${promotion[5] == 1}">-----홍보-----<span></span>
                    </c:when>
                    <c:when test="${promotion[5] == 2}">-----이벤트-----<span></span>
                    </c:when>
                </c:choose>
            </h6>
            <h5 class="text-center" style="color: #434242">
                <span>&#9733;</span> <!-- 별 이모티콘 (★) -->
                ${promotion[6]} <!-- 텍스트 -->
                <span>&#9733;</span> <!-- 별 이모티콘 (★) -->
            </h5>
            <h3 class="text-center"  style="color: #434242">${promotion[1]}</h3>
            
            <h5 class="text-center" style="color: #434242; background : white;"><br><br>${promotion[2]}<br><br><br></h5>
            
            <h6 class="text-center" style="color: #696969">**해당 화면을 캡처하여 가게 사장님께 보여주세요**</h6>
            
        </div>
    </div>
</div>
               <div class="text-center" style="background-color: #FFE9B4; border-radius: 10px; padding: 10px;margin-top: 20px;">
               <!--주소 -->
                <div class="text-center">
                <br>
                	<h4 style="color:#434242;">매장 위치</h4>
                	<h6 style="color:#434242;">${promotion[7]}</h6>
	            </div>
                        <!-- 지도 -->
                        <div>
                        	<div id="map" style="width: 1200px; height: 440px;"></div>  
                         </div>
                         <!-- 지도 끝-->
                         </div>
                        </div>
                        
                        <br>
                         <div class="col-12 text-center">
                       		<a href="/promotionView_list" class="list-button" >게시물 목록으로 이동</a>
                		</div> 
                    </div>
                </div>
        <!-- Contact End -->
        

        <!-- Footer Start -->
        <div class="container-fluid bg-primary text-light footer wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5 px-lg-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Address<span></span></p>
                        <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Quick Link<span></span></p>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                        <a class="btn btn-link" href="">Career</a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Gallery<span></span></p>
                        <div class="row g-2">
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-1.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-2.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-3.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-4.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-5.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-6.jpg" alt="Image">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Newsletter<span></span></p>
                        <p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulpu</p>
                        <div class="position-relative w-100 mt-3">
                            <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text" placeholder="Your Email" style="height: 48px;">
                            <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i class="fa fa-paper-plane text-primary fs-4"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container px-lg-5">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br> 
                            Distributed By a <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

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
