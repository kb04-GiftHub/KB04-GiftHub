<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<c:import url="../top.jsp" />
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

	<!-- 회원가입 폼 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">UPDATE MY INFO</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<form id="myForm" action="update_action" method="post">
							<div class="row g-3">
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="name"
											name="name" placeholder="이름" value="${storeDto.storeName}">
										<label for="name">가게이름</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="username"
											name="username" placeholder="아이디" value="${storeDto.storeId}" readonly>
										<label for="username">아이디</label>
									</div>
								</div>
								<div class="col-12">
									<p style="margin: 0;"> ✖️ 아이디는 수정이 불가합니다.</p>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="tel" class="form-control" id="phone"
											name="phone" placeholder="휴대폰번호" value="${storeDto.storeTel}">
										<label for="phone">휴대폰번호</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="이메일" value="${storeDto.storeEmail}">
										<label for="email">이메일</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_postcode5" id="address1"
											name="address1" placeholder="우편번호" value="${storeDto.storeAdd1}" readonly>
										<label for="address1">우편번호</label>
									</div>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="postcodify_search_button">검색</button>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_address" id="address2"
											name="address2" placeholder="도로명주소" value="${storeDto.storeAdd2}" readonly>
										<label for="address2">도로명주소</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="address3"
											name="address3" placeholder="상세주소" value="${storeDto.storeAdd3}">
										<label for="address3">상세주소</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<select name="category" id="category" class="form-control">
											<option>업종을 선택하세요.</option>
											<c:choose>
												<c:when test="${storeDto.categoryNo eq 1}">
													<option value="1" selected>Groceries</option>
													<option value="2">Electronics</option>
													<option value="3">Fashion</option>
												</c:when>
												<c:when test="${storeDto.categoryNo eq 2}">
													<option value="1">Groceries</option>
													<option value="2" selected>Electronics</option>
													<option value="3">Fashion</option>
												</c:when>
												<c:when test="${storeDto.categoryNo eq 3}">
													<option value="1">Groceries</option>
													<option value="2">Electronics</option>
													<option value="3" selected>Fashion</option>
												</c:when>
											</c:choose>
										</select>
									  	<label for="category">업종</label>
									</div>
								</div>
                                <div class="col-12">
									<button class="btn btn-primary w-100 py-3" id="submitBtn" type="submit">수정하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 폼 End -->

	<c:import url="../footer.jsp" />

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    
    <!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script>
	    $(function() {
	    	$('#postcodify_search_button').click(function(e) {
                e.preventDefault();
            });
	    	
	    	$("#postcodify_search_button").postcodifyPopUp();
	    	
	        // 모든 필수 입력 필드 유효성 검사
	        function validateFields() {
	            var name = $("#name").val();
	            var phone = $("#phone").val();
	            var email = $("#email").val();
	            var address1 = $("#address1").val();
	            var address2 = $("#address2").val();
	            var address3 = $("#address3").val();
	            var category = $("#category").val();

	            // 필드에 값이 없는 경우 유효하지 않음
	            if (
	                name.trim() === "" ||
	                phone.trim() === "" ||
	                email.trim() === "" ||
	                address1.trim() === "" ||
	                address2.trim() === "" ||
	                address3.trim() === "" ||
	                category.trim() === ""
	            ) {
	                return false;
	            }
	            
	            if (category === "업종을 선택하세요.") {
	                return false;
	            }

	            // 모든 필드가 유효한 경우 true 반환
	            return true;
	        }

	        // 필드 값이 변경될 때마다 유효성 검사 수행
	        $("select").on("input", function() {
	            if (validateFields()) {
	                $("#submitBtn").prop("disabled", false);
	            } else {
	                $("#submitBtn").prop("disabled", true);
	            }
	        });
	        
	        $("input").on("input", function() {
	            if (validateFields()) {
	                $("#submitBtn").prop("disabled", false);
	            } else {
	                $("#submitBtn").prop("disabled", true);
	            }
	        });
	    	
	    });
	</script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
