<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>가맹점 찾기</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b45607c24e81b779e6418cf489de08&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		kakao.maps
				.load(function() {
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					var addresses = JSON.parse('${stores}'); // 모든 주소를 가져옵니다

					addresses
							.forEach(function(address) {
								// 주소로 좌표를 검색합니다
								geocoder
										.addressSearch(
												address.storeAdd2,
												function(result, status) {
													console.log("검색어: ",
															address.storeAdd2); // 검색어 출력
													console.log("검색 결과: ",
															result); // 검색 결과 출력
													console.log("검색 상태: ",
															status); // 검색 상태 출력

													// 정상적으로 검색이 완료됐으면
													if (status === kakao.maps.services.Status.OK) {
														var coords = new kakao.maps.LatLng(
																result[0].y,
																result[0].x);

														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new kakao.maps.Marker(
																{
																	map : map,
																	position : coords
																});

														// 인포윈도우로 장소에 대한 설명을 표시합니다
														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																			+ address.storeAdd2
																			+ '</div>'
																});
														infowindow.open(map,
																marker);
													}
												});
							});
				});
	</script>
</body>
</html>

