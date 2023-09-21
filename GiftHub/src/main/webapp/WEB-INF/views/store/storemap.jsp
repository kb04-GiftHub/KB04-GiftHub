<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>가맹점 찾기</title>
<style>
.page-link {
	color: #0058C6 !important;
}

.page-item.active .page-link {
	background-color: #0058C6 !important;
	border-color: #0058C6 !important;
	color: white !important;
}
}
</style>
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
			<div class="row justify-content-center">
				<!-- <div class="col-lg-5">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4"></p>
						<div>
						<img src="/img/store_korea.png" style="width:30px"> 한식
							<button onclick="changeMarker('all')">전체 마커 보기</button>
							<button onclick="changeMarker(1)">한식</button>
							<button onclick="changeMarker(2)">중식</button>
							<button onclick="changeMarker(3)">일식</button>
							<button onclick="changeMarker(4)">양식</button>
							<button onclick="changeMarker(5)">카페</button>
							<button onclick="changeMarker(6)">기타</button>
						</div>
					</div>
				</div> -->
				<section class="prod-main-section-top">
					<div class="prod-main-top">
						<div class="prod-main-desc" style="margin-left: 5%">
							<h1 class="text-center prod-main-title">FIND STORE</h1>
							<p class="text-center text-m">
								내 주변의 상품을 찾을 수 있습니다. <br> 지도를 움직이며 관심있는 상품을 둘러보세요!
							</p>
						</div>
					</div>
				</section>
				<!-- 카카오맵 지도 위치 -->
				<div class="map-box" class="d-flex jutify-content-center"
					style="height: 350px;border-radius:20px;">
					<div id="map" style="width: 80%;height: 100%; margin: auto;border-radius:20px;"></div>
				</div>
				<div class="row mt-4 mb-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="col-12 text-center">
						<ul class="list-inline mb-2" id="portfolio-flters">
							<li id="allC" class="mx-2 active"data-filter="*"><img src="/img/all.png" style="width:30px"> 전체</li>
							<li id="koreaC" class="mx-2" data-filter=".product-type-1"><img src="/img/store_korea.png" style="width:30px"> 한식</li>
							<li id="chinaC" class="mx-2" data-filter=".product-type-2"><img src="/img/store_china.png" style="width:30px"> 중식</li>
							<li id="japanC" class="mx-2" data-filter=".product-type-3"><img src="/img/store_japan.png" style="width:30px"> 일식</li>
							<li id="westernC" class="mx-2" data-filter=".product-type-4"><img src="/img/store_western.png" style="width:30px"> 양식</li>
							<li id="cafeC" class="mx-2" data-filter=".product-type-5"><img src="/img/store_cafe.png" style="width:30px"> 카페/디저트</li>
							<li id="etcC" class="mx-2" data-filter=".product-type-6"><img src="/img/store_etc.png" style="width:30px"> 기타</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-10">
				<div class="search">
					<div class="text-end input-group" >
						<input class="form-control" type="text" id="searchInput" placeholder="매장명을 입력하세요">
					</div>
				</div>
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
						<tbody id="categoryRow">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<c:import url="../footer.jsp" />
	<!-- <script>
		function searchFunction() {
			var searchText = document.getElementById('searchInput').value;
			console.log('검색어:', searchText);
			// 여기에 검색 기능을 구현하세요
		}
	</script> -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b45607c24e81b779e6418cf489de08&libraries=services"></script>
		
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
			        var locPosition = new kakao.maps.LatLng(lat, lon);
			        //마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
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
			allStores('0');
			$('#allC').click(function(){
				allStores('0');
				$(this).attr("class","mx-2 active");
				$('#koreaC').attr("class","mx-2");
				$('#chinaC').attr("class","mx-2");
				$('#japanC').attr("class","mx-2");
				$('#chinaC').attr("class","mx-2");
				$('#westernC').attr("class","mx-2");
				$('#cafeC').attr("class","mx-2");
				$('#etcC').attr("class","mx-2");
			})
			$('#koreaC').click(function(){
				allStores('1');
				$(this).attr("class","mx-2 active");
				$('#allC').attr("class","mx-2");
				$('#chinaC').attr("class","mx-2");
				$('#japanC').attr("class","mx-2");
				$('#chinaC').attr("class","mx-2");
				$('#westernC').attr("class","mx-2");
				$('#cafeC').attr("class","mx-2");
				$('#etcC').attr("class","mx-2");
			});
			$('#chinaC').click(function(){
				allStores('2');
				$(this).attr("class","mx-2 active");
				$('#allC').attr("class","mx-2");
				$('#koreaC').attr("class","mx-2");
				$('#japanC').attr("class","mx-2");
				$('#westernC').attr("class","mx-2");
				$('#cafeC').attr("class","mx-2");
				$('#etcC').attr("class","mx-2");
			})
			$('#japanC').click(function(){
				allStores('3');
				$(this).attr("class","mx-2 active");
				$('#chinaC').attr("class","mx-2");
				$('#westernC').attr("class","mx-2");
				$('#koreaC').attr("class","mx-2");
				$('#cafeC').attr("class","mx-2");
				$('#etcC').attr("class","mx-2");
			})
			$('#westernC').click(function(){
				allStores('4');
				$(this).attr("class","mx-2 active");
				$('#allC').attr("class","mx-2");
				$('#chinaC').attr("class","mx-2");
				$('#japanC').attr("class","mx-2");
				$('#koreaC').attr("class","mx-2");
				$('#cafeC').attr("class","mx-2");
				$('#etcC').attr("class","mx-2");
			})
			$('#cafeC').click(function(){
				allStores('5');
				$(this).attr("class","mx-2 active");
				$('#allC').attr("class","mx-2");
				$('#chinaC').attr("class","mx-2");
				$('#japanC').attr("class","mx-2");
				$('#westernC').attr("class","mx-2");
				$('#koreaC').attr("class","mx-2");
				$('#etcC').attr("class","mx-2");
			})
			$('#etcC').click(function(){
				allStores('6');
				$(this).attr("class","mx-2 active");
				$('#allC').attr("class","mx-2");
				$('#chinaC').attr("class","mx-2");
				$('#japanC').attr("class","mx-2");
				$('#westernC').attr("class","mx-2");
				$('#koreaC').attr("class","mx-2");
				$('#cafeC').attr("class","mx-2");
			})
			
		})
		
		$('#searchInput').on('keyup', function(){
			var inputValue = $(this).val();
			findStores(inputValue);
		})
		
		function findStores(value){
			$('#allC').click();
			if(value != ''){
				$.ajax({
					url:'/findStores?storeName='+value,
					type:'get',
					dataType:'json',
					async:false,
					cache:false,
					success:function(res){
						$('#categoryRow').html('');
						var str = '';
						$.each(res,function(i,data){
							str += '<tr>'
						 	str += '<th scope="row">'
						 	str += i+1
							str += '</th>'
							str += '<td>'
							str+=data.storeName
							str+='</td>'
							str += '<td>'
							str+=data.storeAdd2
							str+=data.storeAdd3
							str+='</td>'
							str += '<td>'
							if(data.categoryNo === 1){
								str+='한식';
							}else if(data.categoryNo === 2){
								str+='중식';
							}else if(data.categoryNo === 3){
								str+='일식';
							}else if(data.categoryNo === 4){
								str+='양식';
							}else if(data.categoryNo === 5){
								str+='카페 / 디저트';
							}else if(data.categoryNo === 6){
								str+='기타';
							}
							str+='</td>'
							str += '</tr>'
						});
						$('#categoryRow').html(str);
					},
					error:function(err){
						alert('error : '+err.status);
					}
				})
			}else if(value==""){
				allStores('0');
			}
		}
		function allStores(num){
			deleteMarkers(map);
			markers = []
			$.ajax({
				url:'/allStores?categoryNum='+num,
				type:'get',
				dataType:'json',
				async:false,
				cache:false,
				success:function(res){
					$('#categoryRow').html('');
					var str = '';
					$.each(res,function(i,data){
							str += '<tr>'
						 	str += '<th scope="row">'
						 	str += i+1
							str += '</th>'
							str += '<td>'
							str+=data.storeName
							str+='</td>'
							str += '<td>'
							str+=data.storeAdd2
							str+='</td>'
							str += '<td>'
							if(data.categoryNo === 1){
								str+='한식';
							}else if(data.categoryNo === 2){
								str+='중식';
							}else if(data.categoryNo === 3){
								str+='일식';
							}else if(data.categoryNo === 4){
								str+='양식';
							}else if(data.categoryNo === 5){
								str+='카페 / 디저트';
							}else if(data.categoryNo === 6){
								str+='기타';
							}
							str+='</td>'
							str += '</tr>'
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
									iwContent += '<br><span style="font-size:17px;font-weight:bold;">'+data.storeName+'</span><br>';
									iwContent += '<div><table class="table" style="text-align:center;">';
									iwContent += '<tr>';
									iwContent += '<th style="width:15px">';
									iwContent += '업종';
									iwContent += '</th>';
									iwContent += '<td style="width:30px">';
									if(data.categoryNo == 1){
										iwContent += '한식';
									}else if(data.categoryNo == 2){
										iwContent += '중식';
									}else if(data.categoryNo == 3){
										iwContent += '일식';
									}else if(data.categoryNo == 4){
										iwContent += '양식';
									}else if(data.categoryNo == 5){
										iwContent += '카페/디저트';
									}else if(data.categoryNo == 6){
										iwContent += '기타';
									}
									iwContent += '</td>';
									iwContent += '</tr>';
									iwContent += '<tr>';
									iwContent += '<th>';
									iwContent += '위치';
									iwContent += '</th>';
									iwContent += '<td>';
									iwContent += data.storeAdd2;
									iwContent += '</td>';
									iwContent += '</tr>';
									iwContent += '<tr>';
									iwContent += '<th>';
									iwContent += '연락처';
									iwContent += '</th>';
									iwContent += '<td>';
									iwContent += data.storeTel;
									iwContent += '</td>';
									iwContent += '</tr>';
									iwContent += '</table>';
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
								markers.push(marker);
							}
						});
						$('#categoryRow').html(str);
					}); 
				},
				error:function(err){
					alert('error : '+err.status);
				}
			})
		}
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];

		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function deleteMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(null);
		    }            
		}
</script>
</body>
</html>

