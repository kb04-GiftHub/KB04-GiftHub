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
				<div style="position: absolute; top: 480px; left: 60px;">
					<button onclick="changeMarker('all')">전체 마커 보기</button>
					<button onclick="changeMarker(1)">한식</button>
					<button onclick="changeMarker(2)">중식</button>
					<button onclick="changeMarker(3)">일식</button>
					<button onclick="changeMarker(4)">양식</button>
					<button onclick="changeMarker(5)">카페</button>
					<button onclick="changeMarker(6)">기타</button>
				</div>
				<!-- 검색창과 검색 버튼 추가 -->
				<div style="position: absolute; top: 480px; right: 60px;">
					<input type="text" id="searchInput" placeholder="검색어를 입력하세요"
						style="width: 500px;">
					<button onclick="searchFunction()">검색</button>
				</div>
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
				<c:forEach var="pagedStore" items="${pagedStores}"
					varStatus="iterStat">
					<tr>
						<th scope="row">${iterStat.index + 1}</th>
						<td>${pagedStore.storeName}</td>
						<td>${pagedStore.storeAdd2}${pagedStore.storeAdd3}</td>
						<td><c:choose>
								<c:when test="${pagedStore.categoryNo.categoryNo == 1}">
                    한식
                </c:when>
								<c:when test="${pagedStore.categoryNo.categoryNo == 2}">
                    중식
                </c:when>
								<c:when test="${pagedStore.categoryNo.categoryNo == 3}">
                    일식
                </c:when>
								<c:when test="${pagedStore.categoryNo.categoryNo == 4}">
                    양식
                </c:when>
								<c:when test="${pagedStore.categoryNo.categoryNo == 5}">
                    카페/베이커리
                </c:when>
								<c:otherwise>
                    기타
                </c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-primary justify-content-center">
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
					class="page-link" href="?page=1"><<</a></li>
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a
					class="page-link" href="?page=${currentPage - 1}"><</a></li>
				<c:set var="startPage"
					value="${(currentGroup - 1) * pagesPerGroup + 1}" />
				<c:set var="endPage"
					value="${currentGroup * pagesPerGroup > totalPages ? totalPages : currentGroup * pagesPerGroup}" />
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a
						class="page-link" id="ggg" href="?page=${i}#tableSection"
						style="background: #0058C6; border: 1px solid #0058C6">${i}</a></li>
				</c:forEach>
				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}"><a
					class="page-link" href="?page=${currentPage + 1}">></a></li>
				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}"><a
					class="page-link" href="?page=${totalPages}">>></a></li>
			</ul>
		</nav>
	</div>
	<c:import url="../footer.jsp" />
	<script>
		function searchFunction() {
			var searchText = document.getElementById('searchInput').value;
			console.log('검색어:', searchText);
			// 여기에 검색 기능을 구현하세요
		}
	</script>
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

		// 카테고리 데이터 (서버에서 전달받은 JSON 데이터)
		var categoryData = {
			1 : [], // 한식
			2 : [], // 중식
			3 : [], // 일식
			4 : [], // 양식
			5 : [], // 카페
			6 : []
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
					var addresses = JSON.parse('${jsonStores}');
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
			// categoryNo 파라미터를 문자열로 변환합니다.
			categoryNo = categoryNo.toString();

			// markersByCategory 객체의 각 키(카테고리 번호)에 대해 반복합니다.
			for ( var key in markersByCategory) {

				// 현재 키가 markersByCategory 객체의 속성인지 확인합니다.
				if (markersByCategory.hasOwnProperty(key)) {

					// 현재 카테고리에 해당하는 마커 배열을 가져옵니다.
					var markers = markersByCategory[key];

					// 현재 카테고리에 해당하는 인포윈도우 배열을 가져옵니다.
					var infoWindows = infoWindowsByCategory[key];

					// mapValue 변수를 null로 초기화합니다.
					var mapValue = null;

					// categoryNo가 'all'이거나 현재 키와 일치하면 mapValue를 map 객체로 설정합니다.
					if (categoryNo === 'all' || key === categoryNo) {
						mapValue = map;
					}

					// 현재 카테고리의 모든 마커에 대해 반복합니다.
					for (var i = 0; i < markers.length; i++) {

						// 마커의 지도를 mapValue로 설정합니다. (null이면 지도에서 제거됩니다)
						markers[i].setMap(mapValue);

						// 인포윈도우를 닫습니다.
						infoWindows[i].close();
					}

					// mapValue가 null이 아니면 (즉, 'all' 또는 현재 카테고리가 선택된 경우)
					if (mapValue) {

						// 현재 카테고리의 모든 인포윈도우에 대해 반복합니다.
						for (var i = 0; i < infoWindows.length; i++) {

							// 인포윈도우를 해당 마커에 다시 엽니다.
							infoWindows[i].open(map, markers[i]);
						}
					}
				}
			}
			// 리스트 업데이트
			updateList(categoryNo);
		}
		
		function updateList(categoryNo) {
			var listContainer = document.querySelector('#tableSection tbody');
			listContainer.innerHTML = ''; // 리스트 초기화

			var dataToDisplay = categoryNo === 'all' ? Object.values(
					categoryData).flat() : categoryData[categoryNo];

			dataToDisplay.forEach(function(data) {
				var row = document.createElement('tr');

				// ... (데이터를 사용하여 행 생성)

				listContainer.appendChild(row);
			});
		}
	</script>
</body>
</html>

