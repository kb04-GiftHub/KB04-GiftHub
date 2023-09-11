<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>KakaoMap API Example</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b45607c24e81b779e6418cf489de08"></script>
	<script>
		var mapContainer = document.getElementById('map'), mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567),
			level : 3
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		<c:forEach var="store" items="${stores}">
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder
				.addressSearch(
						'<c:out value="${store.storeAdd2} ${store.storeAdd3}"/>',
						function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">우편번호: <c:out value="${store.storeAdd1}"/></div>'
										});
								infowindow.open(map, marker);
							}
						});
		</c:forEach>
	</script>
</body>
</html>

