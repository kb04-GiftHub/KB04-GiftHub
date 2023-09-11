<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Store Map</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b45607c24e81b779e6418cf489de08&libraries=services"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 500px;"></div>

	<script>
		window.onload = function() {
			var map = new kakao.maps.Map(document.getElementById('map'), {
				center : new kakao.maps.LatLng(37.566826, 126.9786567),
				level : 3
			});

			function findLocation(postcode) {
				var geocoder = new kakao.maps.services.Geocoder();

				geocoder.addressSearch('우편번호 ' + postcode, function(result,
						status) {
					if (status === kakao.maps.services.Status.OK) {
						var coords = new kakao.maps.LatLng(result[0].y,
								result[0].x);

						var marker = new kakao.maps.Marker({
							map : map,
							position : coords
						});

						map.setCenter(coords);
					} else {
						console.error(
								'Error fetching coordinates for postcode: ',
								postcode);
					}
				});
			}

			<c:forEach var="store" items="${stores}">
			findLocation("${store.storeAdd1}");
			</c:forEach>
		}
	</script>
</body>
</html>
