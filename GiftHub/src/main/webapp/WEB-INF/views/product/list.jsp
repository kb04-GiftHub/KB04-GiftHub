<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51d9fff62677f5402eca46f516b03148&libraries=services"></script>
<!-- body -->
<c:import url="../top_customer.jsp" />
<div class="container-xxl py-5 bg-primary hero-header">
	<div class="container my-5 py-5 px-lg-5">
		<div class="wow fadeInUp" data-wow-delay="0.1s">
			<h1 class="text-center mb-5" style="color: white;">상품 목록</h1>
			<!-- <p class="text-center text-m text-white">
					내 주변의 상품을 찾을 수 있습니다. <br> 지도를 움직이며 관심있는 상품을 둘러보세요!
				</p> -->
		</div>
	</div>
</div>
<!-- Contact Start -->
<div class="container-xxl py-5">
<!-- 	<section class="prod-main-section-top">
		<div class="prod-main-top">
			<div class="prod-main-desc" style="margin-left: 5%">
				<h1 class="text-center prod-main-title">상품 목록</h1>

				<p class="text-center text-m">
					내 주변의 상품을 찾을 수 있습니다. <br> 지도를 움직이며 관심있는 상품을 둘러보세요!
				</p>
			</div>
		</div>
	</section> -->
	<!-- 카카오맵 지도 위치 -->
	<!-- <div class="map-box" class="d-flex jutify-content-center"
		style="height: 350px;border-radius:20px;">
		<div id="map" style="width: 80%;height: 100%; margin: auto;border-radius:20px;"></div>
	</div> -->
	<!-- 필터 버튼 생성 -->
	<div class="row mt-4 mb-4 wow fadeInUp" data-wow-delay="0.3s">
		<div class="col-12 text-center">
			<ul class="list-inline mb-2" id="portfolio-flters">
				<li class="mx-2 active" data-filter="*"><img src="/img/all.png" style="width:30px"> 전체</li>
				<li class="mx-2" data-filter=".product-type-1"><img src="/img/store_korea.png" style="width:30px"> 한식</li>
				<li class="mx-2" data-filter=".product-type-2"><img src="/img/store_china.png" style="width:30px"> 중식</li>
				<li class="mx-2" data-filter=".product-type-3"><img src="/img/store_japan.png" style="width:30px"> 일식</li>
				<li class="mx-2" data-filter=".product-type-4"><img src="/img/store_western.png" style="width:30px"> 양식</li>
				<li class="mx-2" data-filter=".product-type-5"><img src="/img/store_cafe.png" style="width:30px"> 카페/디저트</li>
				<li class="mx-2" data-filter=".product-type-6"><img src="/img/store_etc.png" style="width:30px"> 기타</li>
			</ul>
		</div>
	</div>
	
	
	
	<!-- 0 productNO
		1 productPrice
		2 productName
		3 productMemo
		4 productExp
		5 productImage
		6 storeId
		7 categoryNo \
		8 storeName
		-->
	<!-- Projects Start -->
	<div class="container-xl py-1">
		<!-- 게시물 나열 -->
		<div class="row g-2 portfolio-container">
			<c:forEach items="${productList}" var="product">
				<!-- promotionType에 따라 필터링 -->
				<c:choose>
					<c:when test="${product[7] eq 1}">
						<c:set var="productTypeClass" value="product-type-1" />
						<c:set var="productTypeName" value="한식" />
					</c:when>
					<c:when test="${product[7] eq 2}">
						<c:set var="productTypeClass" value="product-type-2" />
						<c:set var="productTypeName" value="중식" />
					</c:when>
					<c:when test="${product[7] eq 3}">
						<c:set var="productTypeClass" value="product-type-3" />
						<c:set var="productTypeName" value="일식" />
					</c:when>
					<c:when test="${product[7] eq 4}">
						<c:set var="productTypeClass" value="product-type-3" />
						<c:set var="productTypeName" value="양식" />
					</c:when>
					<c:when test="${product[7] eq 5}">
						<c:set var="productTypeClass" value="product-type-3" />
						<c:set var="productTypeName" value="카페/디저트" />
					</c:when>
					<c:when test="${product[7] eq 6}">
						<c:set var="productTypeClass" value="product-type-3" />
						<c:set var="productTypeName" value="기타" />
					</c:when>
				</c:choose>
				<div
					class="col-lg-4 col-md-6 portfolio-item ${productTypeClass} wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="rounded overflow-hidden">
						<div class="position-relative overflow-hidden text-center">
							<img class="img-fluid" style="height: 200px;"
								src="/resources/products/${product[5]}" alt="">
							<div class="portfolio-overlay">
								<a class="btn btn-square btn-outline-light mx-1"
									href="/product/detail?productNo=${product[0]}" data-lightbox="portfolio">
								<i class="fa fa-eye"></i></a> 
								<a class="btn btn-square btn-outline-light mx-1" 
									href="https://m.place.naver.com/rest/v1/search?query=${product[8] }" target="_blank">
								<i class="fa fa-link"></i></a>
							</div>
						</div>
						<div class="bg-light p-3">
							<table style="width: 100%;">
								<tr>
									<td style="width: 70%; font-size: 10pt;"><p class="mb-0">${productTypeName}</p></td>
									<td rowspan="2" style="text-align: right;">
										<%-- <c:if test="${product[9] eq 1 }">
											<img id="${product[0] }" class="imgHeart" src="/img/jjimheartred.png" style="width: 35px;">
										</c:if>
										<c:if test="${product[9] eq 2 }">
											<img id="${product[0]}" class="imgHeart" src="/img/jjimheartgray.png" style="width: 35px;">
										</c:if>
										<c:if test="${product[9] eq 0}">
											<img id="${product[0]}" class="imgHeart" src="/img/jjimheartgray1.png" style="width: 35px;">
										</c:if> --%>
									</td>
								</tr>
								<tr>
									<td><h5 class="lh-base mb-1">${product[2]}</h5></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: right;">
										<p class="mb-0" style="font-size: 10pt; text-align: right;">판매종료 : <fmt:formatDate value="${product[4]}" pattern="yyyy년 MM월 dd일"/></p>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- Projects End -->

<script>

function change_gray(id){
	$.ajax({
		type:'get',
		url:'/product/jjimPlus?productNo='+id+'&customerId=${user.customerId}&jjimStatus=1',
		dataType:'json',
		success:function(res){
			
		}
	})
}

function change_red(id){
	$.ajax({
		type:'get',
		url:'/product/jjimPlus?productNo='+id+'&customerId=${user.customerId}&jjimStatus=2',
		dataType:'json',
		success:function(res){
			
		}
	})
}
function change_red2(id){
	$.ajax({
		type:'get',
		url:'/product/jjimPlus?productNo='+id+'&customerId=${user.customerId}&jjimStatus=3',
		dataType:'json',
		success:function(res){
			
		}
	})
}


$(document).ready(function(){
	$('.imgHeart').click(function(){
		var id = $(this).attr("id");
        var src = $(this).attr("src");
        if (src === "/img/jjimheartgray.png") {
        	$(this).attr("src", "/img/jjimheartred.png");
        	change_red(id)
        } else if(src === "/img/jjimheartgray1.png"){
        	$(this).attr("src", "/img/jjimheartred.png");
        	change_red2(id)
        } else {
        	$(this).attr("src", "/img/jjimheartgray.png");
        	change_gray(id)
        }
	})
})

		/* var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.5666805, 126.9784147),
			level : 3
		};
		
		var map = new kakao.maps.Map(container, options);
		
		if(${user eq null} || ${user.customerAdd2 eq null}){
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        var lat = position.coords.latitude; // 위도
			        var lon = position.coords.longitude; // 경도
			        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			    	 // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);
			    });
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    // 지도 중심좌표를 접속위치로 변경합니다
				map.setCenter(new kakao.maps.LatLng(37.566535, 126.9779692));
			}
		}

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//회원정보중 주소가 있다면
		if(${user ne null} && ${user.customerAdd2 ne null}){
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${user.customerAdd2}', function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					
					var imageSrc = '/img/myLoc.png'; // 마커이미지의 주소입니다    
				    var imageSize = new kakao.maps.Size(40, 40); // 마커이미지의 크기입니다
				    var imageOption = {offset: new kakao.maps.Point(20, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					// 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image:markerImage
			        });
			        
			        //지도 중심 이동
					map.setCenter(coords);
				}
			});		
		} 
		$(function(){
			$.ajax({
				url:'/allProduct',
				type:'get',
				dataType:'json',
				async:false,
				cache:false,
				success:function(res){
					$.each(res,function(i,data){
						//주소 -> 좌표 변환
						geocoder.addressSearch(data.storeAdd2, function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								
								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
								if(data.categoryNo == 1){
									imageSrc = "/img/store_korea.png";
								}else if(data.categoryNo == 2){
									imageSrc = "/img/store_china.png";
								}else if(data.categoryNo == 3){
									imageSrc = "/img/store_japan.png";
								}else if(data.categoryNo == 4){
									imageSrc = "/img/store_western.png";
								}else if(data.categoryNo == 5){
									imageSrc = "/img/store_cafe.png";
								}else if(data.categoryNo == 6){
									imageSrc = "/img/store_etc.png";
								}
									    
								// 마커 이미지의 이미지 크기 입니다
								var imageSize = new kakao.maps.Size(30, 30); 
									    
								// 마커 이미지를 생성합니다    
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									    
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								        map: map, // 마커를 표시할 지도
								        position:new kakao.maps.LatLng(result[0].y, result[0].x),// 마커를 표시할 위치
								        title : data.storeName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								        image : markerImage // 마커 이미지 
								});
								
								 // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
								 var iwContent = '<div style="width:150px;padding:5px; height:200px; text-align:center; font-size:0.5em; overflow-x:hidden; overflow-y:auto;">';
									if(data[5]==null){
										iwContent += '<img width="80" height="80" src="/img/noImage.jpg">';
									}else if(data[5] != null){
										iwContent += '<img width="80" height="80" src="${pageContext.request.contextPath}/resources/Product_Image/'+data.productImage+'">';
									}
									iwContent += '<br><span style="font-size:17px;font-weight:bold;">'+data.storeName+'</span><br>';
									iwContent += "<div class='";
									if(data.avgPoint >=4.0){
										iwContent+="badge bg-success";
									}else if(data.avgPoint <4.0 && data.avgPoint >=2.5){
										iwContent+="badge bg-warning text-black";
									}else if(data.avgPoing<2.5){
										iwContent+="badge bg-danger";
									}
									iwContent += "'>평점</div><br>";
									if(${user ne null}){
										iwContent += "<a href='product/list' style='color:blue;'>상세페이지</a>";
									}
									iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});

								// 마커에 클릭이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, marker);  
								});
							}
						});			
					}); 
				},
				error:function(err){
					alert('error : '+err.status);
				}
			})
		})
		 */
</script>


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

<!-- Template Javascript -->
<script src="/js/main.js"></script>
</body>
</html>