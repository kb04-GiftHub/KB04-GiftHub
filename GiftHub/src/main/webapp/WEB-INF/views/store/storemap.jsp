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
<!-- 		// 검색 기능
	var searchBox = document.getElementById("search-box");
	var geocoder = new kakao.maps.services.Geocoder();

	searchBox.addEventListener("keydown", function (event) {
	  if (event.key === "Enter") {
	    searchAddress(searchBox.value);
	  }
	});

	// 주소 검색 함수
	function searchAddress(keyword) {
	  var ps = new kakao.maps.services.Places(map);
	  ps.keywordSearch(keyword, function (result, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	      showAddressList(result);
	    } else {
	      alert("검색 결과가 없습니다.");
	    }
	  });
	}

	// 주소 검색 결과 출력 함수
	function showAddressList(addresses) {
	  var searchResultWindow = window.open(
	    "",
	    "searchResultWindow",
	    "width=400,height=600"
	  );
	  searchResultWindow.document.write("<h2>주소 검색 결과</h2>");

	  // 스타일 태그 추가
	  var style = document.createElement("style");
	  style.innerHTML = `
	  body {
	    background-color: #f0f0f0;
	    font-family: Arial, sans-serif;
	  }

	  h2 {
	    color: #333;
	  }

	  ul {
	    list-style-type: none;
	    padding: 0;
	  }

	  li {
	    border: 1px solid #ddd;
	    margin: 10px 0;
	    padding: 10px;
	    border-radius: 5px;
	    transition: background-color 0.2s;
	  }

	  li:hover {
	    background-color: #ddd;
	  }
	  `;
	  searchResultWindow.document.head.appendChild(style);

	  var list = document.createElement("ul");
	  searchResultWindow.document.body.appendChild(list);

	  addresses.forEach(function (address) {
	    var li = document.createElement("li");
	    li.innerText = address.place_name + " - " + address.address_name;
	    li.onclick = function () {
	      addAddressMarker(address);
	      searchResultWindow.close();
	    };
	    list.appendChild(li);
	  });
	}

	// 주소에 마커 추가 함수
	function addAddressMarker(address) {
	  var latlng = new kakao.maps.LatLng(address.y, address.x);
	  var marker = new kakao.maps.Marker({ position: latlng });
	  marker.setMap(map);
	  markers.push(marker);

	  kakao.maps.event.addListener(marker, "click", function () {
	    displayInfowindow(marker, address.place_name);
	  });

	  var addressList = document.getElementById("address-list");
	  var li = document.createElement("li");

	  // addressList의 현재 아이템 수를 얻어서 번호를 만듭니다.
	  var number = addressList.getElementsByTagName("li").length + 1;

	  // 주소 앞에 번호를 붙여서 텍스트를 설정합니다.
	  li.innerText =
	    number + ". " + address.place_name + " - " + address.address_name;

	  li.addEventListener("click", function () {
	    var moveLatLng = new kakao.maps.LatLng(address.y, address.x);
	    map.panTo(moveLatLng);
	  });

	  addressList.appendChild(li);
	} -->
</body>
</html>

