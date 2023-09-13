<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>가맹점 찾기</title>
</head>
<body>
	<c:import url="../top_customer.jsp" />
	<div class="container-xxl py-5 bg-primary hero-header">
		<div class="container my-5 py-5 px-lg-5">
			<div class="row g-5 py-5">
				<div class="col-12 text-center">
					<h1 class="text-white animated slideInDown">가맹점 찾기</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<button onclick="changeMarker('all')">전체 마커 보기</button>
				<button onclick="changeMarker(1)">한식</button>
				<button onclick="changeMarker(2)">중식</button>
				<button onclick="changeMarker(3)">일식</button>
				<button onclick="changeMarker(4)">양식</button>
				<button onclick="changeMarker(5)">카페</button>
				<button onclick="changeMarker(6)">기타</button>
				<div id="map" style="width: 1200px; height: 440px;"></div>
			</div>
		</div>
	</div>
	<div class="container mt-5" id="tableSection">
		<table class="table table-striped"
			style="text-align: center; margin-bottom: 3rem;">
			<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">매장명</th>
					<th scope="col">주소</th>
					<th scope="col">업종</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="store" items="${storeDetailsList}"
					varStatus="iterStat">
					<tr>
						<th scope="row">${iterStat.index + 1}</th>
						<td>${store.storeName}</td>
						<td>${store.storeAdd2}${store.storeAdd3}</td>
						<td>${store.categoryNo}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-primary justify-content-center">
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
					class="page-link" href="?page=1&storeId=${storeId}"><<</a></li>
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
					class="page-link"
					href="?page=${currentPage - 1}&storeId=${storeId}"><</a></li>

				<c:set var="startPage"
					value="${(currentGroup - 1) * pagesPerGroup + 1}" />
				<c:set var="endPage"
					value="${currentGroup * pagesPerGroup > totalPages ? totalPages : currentGroup * pagesPerGroup}" />
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a
						class="page-link" id="ggg"
						href="?page=${i}&storeId=${storeId}#tableSection"
						style="background: #0058C6; border: 1px solid #0058C6">${i}</a></li>
				</c:forEach>
				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
					<a class="page-link"
					href="?page=${currentPage + 1}&storeId=${storeId}">></a>
				</li>
				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
					<a class="page-link" href="?page=${totalPages}&storeId=${storeId}">>></a>
				</li>
			</ul>
		</nav>
	</div>
	<c:import url="../footer.jsp" />
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

		/* 		// 사용자의 현재 위치를 얻어와 지도의 중심을 설정하는 코드
		 if (navigator.geolocation) {
		 navigator.geolocation.getCurrentPosition(function(position) {
		 var lat = position.coords.latitude, // 위도
		 lon = position.coords.longitude; // 경도

		 var locPosition = new kakao.maps.LatLng(lat, lon);
		 map.setCenter(locPosition); // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
		 console.log(locPosition);
		 }, function() {
		 console.error('Geolocation access denied.'); // 위치 정보를 얻을 수 없는 경우
		 });
		 } else {
		 console.error('Geolocation not supported in this browser.'); // 브라우저가 Geolocation을 지원하지 않는 경우
		 } */

		// 카테고리 별 마커 배열을 저장할 객체
		var markersByCategory = {
			1 : [], // 한식
			2 : [], // 중식
			3 : [], // 일식
			4 : [], // 양식
			5 : [], // 카페
			6 : []
		// 기타
		};

		var infoWindowsByCategory = {
			"1" : [], // 한식
			"2" : [], // 중식
			"3" : [], // 일식
			"4" : [], // 양식
			"5" : [], // 카페
			"6" : []
		// 기타
		};

		// 음식점 마커 할당
		var koreaMarkerImage = new kakao.maps.MarkerImage(
				'/img/store_korea.png', new kakao.maps.Size(24, 24));

		var chinaMarkerImage = new kakao.maps.MarkerImage(
				'/img/store_china.png', new kakao.maps.Size(24, 24));

		var japanMarkerImage = new kakao.maps.MarkerImage(
				'/img/store_japan.png', new kakao.maps.Size(24, 24));

		var westernMarkerImage = new kakao.maps.MarkerImage(
				'/img/store_western.png', new kakao.maps.Size(24, 24));

		var cafeMarkerImage = new kakao.maps.MarkerImage('/img/store_cafe.png',
				new kakao.maps.Size(24, 24));

		var etcMarkerImage = new kakao.maps.MarkerImage('/img/store_etc.png-',
				new kakao.maps.Size(24, 24));

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		kakao.maps
				.load(function() {
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					// 모든 주소와 카테고리 정보를 가져옵니다
					var addresses = JSON.parse('${stores}');
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
														// categoryno에 따라 마커 이미지를 선택합니다
														var markerImage;
														switch (address.categoryNo.categoryNo) {
														case 1:
															markerImage = koreaMarkerImage;
															break;
														case 2:
															markerImage = chinaMarkerImage;
															break;
														case 3:
															markerImage = japanMarkerImage;
															break;
														case 4:
															markerImage = westernMarkerImage;
															break;
														case 5:
															markerImage = cafeMarkerImage;
															break;
														default:
															// 기본 마커 이미지 (옵션)
															markerImage = new kakao.maps.MarkerImage(
																	'/img/store_etc.png',
																	new kakao.maps.Size(
																			24,
																			24));
														}
														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new kakao.maps.Marker(
																{
																	map : map,
																	position : coords,
																	image : markerImage
																// 선택된 마커 이미지를 사용
																});
														// 카테고리 별 마커 배열에 마커 추가
														markersByCategory[address.categoryNo.categoryNo]
																.push(marker);
														// 인포윈도우로 장소에 대한 설명을 표시합니다
														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																			+ address.storeName
																			+ '</div>'
																});
														infoWindowsByCategory[address.categoryNo.categoryNo]
																.push(infowindow);
														infowindow.open(map,
																marker);
													}
												});
							});
				});
		function changeMarker(categoryNo) {
			categoryNo = categoryNo.toString();
			for ( var key in markersByCategory) {
				if (markersByCategory.hasOwnProperty(key)) {
					var markers = markersByCategory[key];
					var infoWindows = infoWindowsByCategory[key];
					var mapValue = null;

					if (categoryNo === 'all' || key === categoryNo) {
						mapValue = map;
					}

					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(mapValue);
						infoWindows[i].close();
					}

					if (mapValue) {
						for (var i = 0; i < infoWindows.length; i++) {
							infoWindows[i].open(map, markers[i]);
						}
					}
				}
			}
		}
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

