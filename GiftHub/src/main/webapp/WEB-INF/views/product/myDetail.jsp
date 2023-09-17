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
									<img alt="" src="/upload_images/product/${dto.productImage}" style="margin: auto; display: block; width: 100%">
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
							<div class="col-12">
								
								<%-- <hr style="margin: 30px 0;">
								<div class="form-floating">
									<p class="mb-0">${object[7]}</p>
								</div> --%>
							</div>
							<!-- <div class="col-6">
								<button class="btn btn-primary w-100 py-3" id="backBtn" style="margin-top: 50px;" onclick="window.location.href = '/product'">삭제하기</button>
							</div> -->
							
							<!-- 추가 -->
    							<div class="col-6">
									<%-- <form action="/product/product_delete" method="post">
		    							<input type="hidden" name="productNo" value="${dto.productNo}" />
	        							<button type="submit" class="btn btn-primary w-100 py-3" id="deleteBtn" style="margin-top: 50px;" onclick="window.location.href = '/product/myList'">삭제하기</button>
									</form> --%>
	        							<button type="submit" class="btn btn-primary w-100 py-3" id="deleteBtn" style="margin-top: 50px;" onclick="window.location.href = '/product/myList'">삭제하기</button>
							    </div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="backBtn" style="margin-top: 50px;" onclick="window.location.href = '/product/myList'">목록 이동</button>
								</div>
							
							
							<!-- 끝 -->
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기프티콘 상세 End -->
	
	<c:import url="../footer.jsp" />  
   

</body>
</html>