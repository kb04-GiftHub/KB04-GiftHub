<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>

	<c:import url="../top.jsp" />
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">상품정보</h1>
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
									<img alt="" src="/resources/products/${dto.productImage}" style="margin: auto; display: block; width: 100%">
 									<%-- <img alt="" src="/upload_images/product/${dto.productImage}" style="margin: auto; display: block; width: 100%"> --%>
								</div>
							</div>
							<div class="col-7" style="padding-left: 50px;">
								<div class="form-floating">
									<p class="mb-10" style="text-align: center;">상품정보</p>
									<hr>
									<table style="width: 100%; border-collapse: collapse;">
										<tr>
											<td style="width: 40%;">상품이름</td>
											<td style="width: 60%;">${dto.productName}</td>
										</tr>
										<tr>
											<td>쿠폰상태</td>
											<td style="font-weight: 800;">
							                    <jsp:useBean id="now" class="java.util.Date" />
							                    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
												<c:choose>
													<c:when test="${dto.productExp >= today}">
														판매중
													</c:when>
													<c:when test="${dto.productExp < today}">
														판매종료
													</c:when>
													
													
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>판매종료 날짜</td>
											<td><fmt:formatDate value="${dto.productExp}" pattern="yyyy년 MM월 dd일"/></td>
										</tr>
										<tr>
											<td>판매금액</td>
											<td><fmt:formatNumber value="${dto.productPrice}" type="currency" currencySymbol=""/>원</td>
										</tr>
										
									</table>
								</div>
							</div>
							<!-- 추가 -->
								<div class="col-6">
									<form action="/product/delete/${productNo}" method="post">
										<button type="button" class="btn btn-primary w-100 py-3"
											id="deleteBtn" style="margin-top: 50px;" onclick="deleteproduct(${dto.productNo})">삭제하기</button>
									</form>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="backBtn"
										style="margin-top: 50px;"
										onclick="window.location.href = '/product/myList'">목록
										이동</button>
								</div>
							<!-- 끝 -->
							
							
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기프티콘 상세 End -->
	
	<!-- 삭제 버튼 선택시 status 0으로 변경 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function deleteproduct(productNo) {
	    if (confirm("정말로 삭제하시겠습니까?")) {
	        $.ajax({
	            type: "POST",
	            url: "/product/delete/" +  productNo, // 삭제 요청을 보낼 URL
	            data: {productNo: productNo},
	            success: function (response) {
	            	console.log("응답 성공 : " + productNo);
	            	alert("상품이 삭제되었습니다.");
                    window.location.href = '/product/myList'; // 삭제 후 목록 페이지로 이동
	               /*  if (response === "success") {
	                    alert("상품이 삭제되었습니다.");
	                    window.location.href = '/product/myList'; // 삭제 후 목록 페이지로 이동
	                } else {
	                    alert("상품 삭제에 실패했습니다.");
	                } */
	            },
	            error: function () {
	                alert("상품 삭제에 실패했습니다.");
	                console.log("응답 실패 : " + productNo);
	            }
	        });
	    }
	}
	</script>
	
	
	<c:import url="../footer.jsp" />  
   

</body>
</html>