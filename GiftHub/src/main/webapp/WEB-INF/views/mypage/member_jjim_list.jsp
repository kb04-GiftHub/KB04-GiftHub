<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script>
	function adjustImageSize(img) {
	    var imgElement = $(img);
	    var imgWidth = imgElement.width();
	    var imgHeight = imgElement.height();
	    
	    if (imgWidth > imgHeight) {
	        imgElement.css('width', '100%');
	        imgElement.css('height', 'auto');
	    } else {
	        imgElement.css('height', '100%');
	        imgElement.css('width', 'auto');
	    }
	}
</script>
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
    
    	<!-- Projects Start -->
		<c:choose>
			<c:when test="${list.size() == 0}">
				<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s" style="margin: 100px 0;">
					<div class="container px-lg-5 text-center">
						<div class="row justify-content-center">
							<div class="col-lg-6">
								<h1 class="mb-4">MY JJIMS</h1>
								<p class="mb-4">${msg}</p>
								<a class="btn btn-primary rounded-pill py-3 px-5" href="/product/list">기프티콘 구경하기</a>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${list.size() > 0}">
				<div class="container-xxl py-5">
					<div class="container py-5 px-lg-5">
						<div class="wow fadeInUp" data-wow-delay="0.1s">
							<h1 class="text-center mb-5">MY JJIMS</h1>
							<div class="row g-4 portfolio-container">
								<c:forEach items="${list}" var="list">
									<div class="col-lg-3 col-md-6 portfolio-item wow fadeInUp" data-wow-delay="0.1s">
										<div class="rounded overflow-hidden"
											style="border: 4px solid #FFEBEA">
											<div class="position-relative overflow-hidden"
												style="height: 200px; display: flex; justify-content: center; align-items: center;" onclick="window.location.href = '/product/detail?productNo=${list[2]}'">
												<img class="img-fluid" src="/resources/products/${list[6]}" alt="" id="img" onload="adjustImageSize(this)">
											</div>
											<div class="p-3" style="background: #FFEBEA; color: gray;">
												<table style="width: 100%;">
													<tr>
														<td style="width: 70%; font-size: 10pt;"><p class="mb-0">${list[7]}</p></td>
														<td rowspan="2" style="text-align: right;">
															<img id="${list[0]}" src="/img/jjimheartred.png" style="width: 35px;" onclick="toggleJjim(${list[0]})">
														</td>
													</tr>
													<tr>
														<td><h5 class="lh-base mb-1">${list[4]}</h5></td>
													</tr>
													<tr>
														<td colspan="2" style="text-align: right;">
															<p class="mb-0" style="font-size: 10pt; text-align: right;">판매종료 : <fmt:formatDate value="${list[5]}" pattern="yyyy년 MM월 dd일"/></p>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="col-lg-12 text-center">
								<hr style="margin: 50px 0;">
								<p class="mb-4">더 많은 기프티콘을 보고싶으신가요?</p>
								<a class="btn btn-primary rounded-pill py-3 px-5" href="/product/list">기프티콘 구경하기</a>
							</div>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	<!-- Projects End -->
        
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
    
    <script>
    var products = [];
    
    $(function() {
        <c:forEach items="${list}" var="list">
            var product = {
                jjimNo: ${list[0]},
                jjimProduct : ${list[2]},
                jjimStatus : true
            };
            
            products.push(product);
        </c:forEach>
    });
    
    function toggleJjim(jjimNo) {
    	// products 배열에서 해당 jjimNo를 가진 product 찾기
        var productToUpdate = null;
        for (var i = 0; i < products.length; i++) {
            if (products[i].jjimNo === jjimNo) {
                productToUpdate = products[i];
                break;
            }
        }

        if (productToUpdate) {
            // 현재 찜 상태를 토글 (true -> false, false -> true)
            productToUpdate.jjimStatus = !productToUpdate.jjimStatus;

            // 서버로 업데이트 요청 보내기
            $.ajax({
                type: "POST",
                url: "/member/mypage/update_jjim",
                data: { jjimNo: jjimNo, jjimStatus: productToUpdate.jjimStatus,  productNo : productToUpdate.jjimProduct },
                success: function (data) {
                    console.log("새로운 찜 상태: " + productToUpdate.jjimStatus);
					
                    var imgElement = $("#"+jjimNo);
                    
                    // 찜 아이콘 업데이트
                    var src = imgElement.attr("src");
                    if (src === "/img/jjimheartwhite.png") {
                    	imgElement.attr("src", "/img/jjimheartred.png");
                    } else {
                    	imgElement.attr("src", "/img/jjimheartwhite.png");
                    }
                },
                error: function (error) {
                    console.error("찜 상태 업데이트 실패: " + error);
                }
            });
        } else {
            console.error("찾을 수 없는 jjimNo: " + jjimNo);
        }
    }
	</script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
</body>
</html>
