<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51d9fff62677f5402eca46f516b03148&libraries=services"></script>
<script>	$(document).ready(function(){
	  $("#sendGift").modal();
	  $("#buyGift").modal();
	if('${msg}'!==''){
		  alert("${msg}")
	}	
});

</script>
<c:import url="../top_customer.jsp" />
<div class="container-xxl py-5 bg-primary hero-header">
	<div class="container my-5 py-5 px-lg-5">
		<div class="col-12 text-center">
				<h1 class="text-white animated slideInDown">상품 보기</h1>
		</div>
	</div>
</div>

<!-- 상품 상세 Start -->
<div class="container-xxl py-2">
	<div class="container py-1 px-lg-3 w-100 p-3">
		<div class="wow fadeInUp" data-wow-delay="0.1s">
			<h1 class="text-center mb-5">상품 정보</h1>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-7" style="width: 80%;min-width:200px">
				<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
					<div class="row  align-middle">
						<div class="col-6 align-middle" style="margin:auto auto;">
							<div class="form-floating" style="margin:auto auto;text-align:center;vertical-align: middle;">
								<img alt="" class="align-middle"
									src="/upload_images/product/${product.productImage}"
									style="width: 100%;max-height:300px;max-width:300px; smargin-bottom: 20px;">
								<p class="mb-0"
									style="text-align: center; letter-spacing: 4px; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="col-6" style="padding-left: 30px;">
							<div class="form-floating "">
								<h4 class="mb-3">${product.productName}</h4>
								<hr>
								<table class="rightTable w-100">
									<tr>
										<td style="width: 5rem">상품가격</td>

										<td class="d-flex justify-content-end" style="color: black">
											<fmt:formatNumber value="${product.productPrice}"
												pattern="#,###" /> <strong>원</strong>
										</td>
									</tr>
									<tr>
										<td>가게이름</td>
										<td id="tableAuc" class="d-flex justify-content-end"
											style="color: black">${store.storeName }</td>
									</tr>
									<tr>
										<td>가게주소</td>
										<td class="d-flex justify-content-end"
											style="font-size: 0.9em;text-align:right; color: black;">
											${store.storeAdd2 }</td>
									</tr>
									<tr>
										<td style="padding-right: 3%;">전화번호</td>
										<td class="d-flex justify-content-end"
											style="color: black;">
											${store.storeTel }
										</td>
									</tr>
									<tr>
										<td style="padding-right: 3%;">유효기간</td>
										<td class="d-flex justify-content-end"
											style="color: black; vertical-align: middle;"><fmt:formatDate
												value="${product.productExp }" pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr>
										<td colspan="2" class="text-center">
										<br>
										<div style="margin-bottom:5px;">
										<a type="button" style="width:99%;" class="btn btn-danger" data-toggle="modal" data-target="#sendGift">선물하기</a>
										<!-- <a class="btn btn-danger" id="sendGifticon" type="submit" href="/product/gift">선물하기</a> -->
										</div>
										<div style="margin-bottom:5px;">
										<a type="button" style="width:99%;" class="btn btn-primary" data-toggle="modal" data-target="#buyGift">구매하기</a>
										</div>
										
										<div style="margin-bottom:5px;">
										<a href="/product/list" type="button" style="width:99%;" class="btn btn-secondary" >목록으로가기</a>
										</div>
										</td>
									</tr>
								</table>
							</div>
						</div>

						<div class="col-12">
							<hr style="margin: 30px 0;">
							<div class="form-floating">
								<p class="mb-10" style="font-size: 18px; text-align: center;">
									<strong>상품정보</strong>
								</p>
								<p class="mb-0" style="color: black;">${product.productMemo}</p>
							</div>
							<hr style="margin: 30px 0;">
						</div>
						
						<!-- 카카오맵 지도 위치 -->
						<div class="map-box" class="d-flex jutify-content-center"
							style="height: 300px; border-radius: 20px;">
							<div id="map"
								style="width: 80%; height: 90%; margin: auto; border-radius: 20px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

   <!-- 구매하기1 Modal -->
   <div class="modal fade" id="buyGift" tabindex="-1">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="text-center modal-header">
           <h4 class="modal-title">기프티콘 구매하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <div class="modal-body text-center">
          	가게이름 : <a class="btn"> ${store.storeName }</a> <br>
          	상품이름 : <a class="btn">${product.productName}</a> <br>
          	상품가격 : <a class="btn">${product.productPrice }</a> <br>
          	<div>------------------------------------------------------</div>
          	현재 상품을 구매하시겠습니까?
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>      
			   <button type="button" id="recharge-list" class="btn btn-primary"
                                data-toggle="modal" data-target="#buyGiftTel" data-dismiss="modal">구매하기</button>   
         </div>
       </div>
     </div>
   </div><!-- End 구매하기1 Modal-->
   
   <!-- 구매하기2 Modal -->
   <div class="modal fade" id="buyGiftTel" tabindex="-1">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="text-center modal-header">
           <h4 class="modal-title">기프티콘 구매하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
        <form action="/gifticon/buy" method="post">
         <div class="modal-body">
         	 쿠폰을 받으실 전화번호를 입력하세요
         	 <br>
         	 [휴대폰 번호는 '-' 없이 번호로만 적어주세요 (예:010-xxxx-xxxx)]
         	 <input type="text" name="sendTel" class="form-control" placeholder="예:010xxxxxxxxx" id="recharge-point" value="${user.customerTel }">
         	 <input type="hidden" name="productNo" value="${product.productNo }">
         	 <input type="hidden" name="customerId" value="${user.customerId }">
             </div>
             <div class="modal-footer">
               <a type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</a>   
               <button type="submit" class="btn btn-primary">구매하기</button>   
         	</div>
  		</form>  
       </div>
     </div>
   </div><!-- End 구매하기2 Modal-->
   
   <!-- 선물하기 Modal -->
   <div class="modal fade" id="sendGift" tabindex="-1">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="text-center modal-header">
           <h4 class="modal-title">기프티콘 선물하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <div class="modal-body text-center">
          	 <button style="width: 49%;" type="button"  class="btn btn-danger" data-toggle="modal" data-target="#sendGiftTel2" data-dismiss="modal">ID로 선물하기</button> 
          	 <button style="width: 49%;" type="button"  class="btn btn-danger" data-toggle="modal" data-target="#sendGiftTel" data-dismiss="modal">휴대폰번호로 선물하기</button> 
         </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>      
			   <%-- <a class="btn btn-primary" id="buyGifticon" type="submit" href="/product/buy?productNo=${product.productNo}&customerId=${user.customerId}">구매하기</a> --%>
         </div>
       </div>
     </div>
   </div><!-- End 선물하기 Modal-->
   
   <!-- 선물하기 Modal -->
   <div class="modal fade" id="sendGiftTel" tabindex="-1">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="text-center modal-header">
           <h4 class="modal-title">기프티콘 선물하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <form action="/gifticon/buy" method="post">
         <div class="modal-body">
         	 선물하실 분의 휴대폰 번호를 입력하세요
         	 <br>
         	 [휴대폰 번호는 '-' 없이 번호로만 적어주세요 (예:010-xxxx-xxxx)]
         	 <input type="text" name="sendTel" class="form-control" id="recharge-point" placeholder="예:01012341234">
         	 <input type="hidden" name="productNo" value="${product.productNo }">
         	 <input type="hidden" name="customerId" value="${user.customerId }">
             </div>
             <div class="modal-footer">
               <a type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</a>   
               <button type="submit" class="btn btn-danger">선물하기</button>   
         	</div>
  		</form>  
       </div>
     </div>
   </div><!-- End 선물하기 Modal-->
   
   <!-- 선물하기2 Modal -->
   <div class="modal fade" id="sendGiftTel2" tabindex="-1">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="text-center modal-header">
           <h4 class="modal-title">기프티콘 선물하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <form action="/gifticon/buy" method="post">
         <div class="modal-body">
         	 선물하실 분의 ID를 입력하세요
         	 <br>
         	 [휴대폰 번호는 '-' 없이 번호로만 적어주세요 (예:010-xxxx-xxxx)]
         	 <input type="text" name="sendTel" class="form-control" id="recharge-point" placeholder="예:01012341234">
         	 <input type="hidden" name="productNo" value="${product.productNo }">
         	 <input type="hidden" name="customerId" value="${user.customerId }">
             </div>
             <div class="modal-footer">
               <a type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</a>   
               <button type="submit" class="btn btn-danger">선물하기</button>   
         	</div>
  		</form>  
       </div>
     </div>
   </div><!-- End 선물하기 Modal-->
	
<!-- 상품 상세 End -->
<c:import url="../footer.jsp" />
<script>
var container = document.getElementById('map');
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
	var geocoder1 = new kakao.maps.services.Geocoder();
	var geocoder2 = new kakao.maps.services.Geocoder();

	//회원정보중 주소가 있다면
	if(${user ne null} && ${user.customerAdd2 ne null}){
		// 주소로 좌표를 검색합니다
		geocoder1.addressSearch('${user.customerAdd2}', function(result, status) {
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
	
	if(${store ne null} && ${store.storeAdd2 ne null}){
		// 주소로 좌표를 검색합니다
		geocoder2.addressSearch('${store.storeAdd2}', function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
				var imageSrc = '/img/myLoc.png'; // 마커이미지의 주소입니다
				
				if(${store.categoryNo} == 1){
					imageSrc = "/img/store_korea.png";
				}else if(${store.categoryNo} == 2){
					imageSrc = "/img/store_china.png";
				}else if(${store.categoryNo} == 3){
					imageSrc = "/img/store_japan.png";
				}else if(${store.categoryNo} == 4){
					imageSrc = "/img/store_western.png";
				}else if(${store.categoryNo} == 5){
					imageSrc = "/img/store_cafe.png";
				}else if(${store.categoryNo} == 6){
					imageSrc = "/img/store_etc.png";
				}
				
			    var imageSize = new kakao.maps.Size(40, 40); // 마커이미지의 크기입니다
			    var imageOption = {offset: new kakao.maps.Point(20, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				// 결과값으로 받은 위치를 마커로 표시합니다
		        var marker2 = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image:markerImage
		        });
		        
		        //지도 중심 이동
				map.setCenter(coords);
			}
		});		
	}
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
<script src="/lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="/js/main.js"></script>
</body>

</html>