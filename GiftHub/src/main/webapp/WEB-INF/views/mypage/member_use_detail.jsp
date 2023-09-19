<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	td {
		padding: 5px 0;
	}
</style>
</head>
<body>
	<c:import url="../top_customer.jsp" />
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">마이페이지</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<!-- 기프티콘 상세 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">GIFTICON INFO</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-5">
								<div class="form-floating">
									<img alt="" src="/resources/Gifticon/${object[2]}" style="margin: auto; display: block; width: 100%">
									<p class="mb-10" style="text-align: center; margin-top: 15px;">가맹점에 제시해주세요.</p>
								</div>
							</div>
							<div class="col-7" style="padding-left: 50px;">
								<div class="form-floating">
									<p class="mb-10" style="text-align: center;">상품정보</p>
									<hr>
									<table style="width: 100%; border-collapse: collapse;">
										<tr>
											<td style="width: 25%;">상품이름</td>
											<td style="width: 75%;">${object[6]}</td>
										</tr>
										<tr>
											<td>쿠폰상태</td>
											<td style="font-weight: 800;">
												<c:choose>
													<c:when test="${object[3] eq 1}">
														사용가능
													</c:when>
													<c:when test="${object[3] eq 2}">
														사용완료
													</c:when>
													<c:when test="${object[3] eq 3}">
														기간만료
													</c:when>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>구매일자</td>
											<td><fmt:formatDate value="${object[4]}" pattern="yyyy년 MM월 dd일"/></td>
										</tr>
										<tr>
											<td>결제금액</td>
											<td><fmt:formatNumber value="${object[5]}" type="currency" currencySymbol=""/>원</td>
										</tr>
										<tr>
											<td>가게이름</td>
											<td>${object[9]}</td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${object[10]}</td>
										</tr>
										<tr>
											<td>가게위치</td>
											<td>${object[11]}</td>
										</tr>
										<tr>
											<td colspan="2">
												<div id="map" style="width: 100%; height: 250px;"></div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-12">
								
								<hr style="margin: 30px 0;">
								<div class="form-floating">
									<p class="mb-0">${object[7]}</p>
								</div>
							</div>
							<div class="col-12">
								<button class="btn btn-primary w-100 py-3" id="backBtn" style="margin-top: 50px;" onclick="window.location.href = '/member/mypage/use_list'">이전으로 돌아가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기프티콘 상세 End -->
	
	<c:import url="../footer.jsp" />
	
	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="/lib/lightbox/js/lightbox.min.js"></script>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b45607c24e81b779e6418cf489de08&libraries=services"></script>

	<script>
		var objectData = JSON.parse('${jsonObject}');
		var address = objectData[11];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
			// 정상적으로 검색이 완료됐으면
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});
				/* // 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow(
						{
							content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
						});
				infowindow.open(map, marker); */
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	</script>

	<!-- Template Javascript -->
    <script src="/js/main.js"></script>
</body>

</html>