<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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

	<!-- 마이페이지 폼 Start -->
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
											name="name" placeholder="이름" value="${customerDto.customerName}">
										<label for="name">이름</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="nickname"
										name="nickname" placeholder="닉네임" value="${customerDto.customerNickname}">
										<label for="nickname">닉네임</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="username"
											name="username" placeholder="아이디" value="${customerDto.customerId}" readonly>
										<label for="username">아이디</label>
									</div>
								</div>
								<div class="col-12">
									<p style="margin: 0;"> ✖️ 아이디는 수정이 불가합니다.</p>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<select name="gender" id="gender" class="form-control">
											<option>성별을 선택하세요.</option>
											<c:choose>
												<c:when test="${customerDto.customerGender eq '남자'}">
													<option selected>남자</option>
													<option>여자</option>
												</c:when>
												<c:when test="${customerDto.customerGender eq '여자'}">
													<option>남자</option>
													<option selected>여자</option>
												</c:when>
											</c:choose>
									  	</select>
									  	<label for="gender">성별</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="tel" class="form-control" id="birth"
										name="birth" placeholder="생년월일" value="${customerDto.customerBirth}">
										<label for="birth">생년월일</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="tel" class="form-control" id="phone"
											name="phone" placeholder="휴대폰번호" value="${customerDto.customerTel}">
										<label for="phone">휴대폰번호</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="이메일" value="${customerDto.customerEmail}">
										<label for="email">이메일</label>
									</div>
								</div>
								<div class="col-6">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_postcode5" id="address1"
											name="address1" placeholder="우편번호" value="${customerDto.customerAdd1}" readonly>
										<label for="address1">우편번호</label>
									</div>
								</div>
								<div class="col-6">
									<button class="btn btn-primary w-100 py-3" id="postcodify_search_button">검색</button>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control postcodify_address" id="address2"
											name="address2" placeholder="도로명주소" value="${customerDto.customerAdd2}" readonly>
										<label for="address2">도로명주소</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="address3"
											name="address3" placeholder="상세주소" value="${customerDto.customerAdd3}">
										<label for="address3">상세주소</label>
									</div>
								</div>
                                <div class="col-12">
									<button class="btn btn-primary w-100 py-3" id="submitBtn" type="submit">수정하기</button>
								</div>
								<div class="col-12">
									<hr style="margin-top: 30px; margin-bottom: 0px;">
								</div>
								<div class="col-12">
									<p style="margin: 0; text-align: center; margin-top: 30px;">수정할 정보가 없으신가요?</p>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" id="idexBtn">메인페이지로 돌아가기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 마이페이지 폼 End -->

	<c:import url="../footer.jsp" />

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
    
    <!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script>
	    $(function() {
	    	$('#postcodify_search_button').click(function(e) {
                e.preventDefault();
            });
	    	
	    	$("#postcodify_search_button").postcodifyPopUp();
	    	$("#submitBtn").prop("disabled", true);
	    		    	
	        // 모든 필수 입력 필드 유효성 검사
	        function validateFields() {
	        	var name = $("#name").val();
	            var nickname = $("#nickname").val();
	            var gender = $("#gender").val();
	            var birth = $("#birth").val();
	            var phone = $("#phone").val();
	            var email = $("#email").val();
	            var address1 = $("#address1").val();
	            var address2 = $("#address2").val();
	            var address3 = $("#address3").val();

	            // 필드에 값이 바뀌지 않은 경우 유효하지 않음
	            if (
	                name == '${customerDto.customerName}' &&
	                nickname == '${customerDto.customerNickname}' &&
	                gender == '${customerDto.customerGender}' &&
	                birth == '${customerDto.customerBirth}' &&
	                phone == '${customerDto.customerTel}' &&
	                email == '${customerDto.customerEmail}' &&
	                address1 == '${customerDto.customerAdd1}' &&
	                address2 == '${customerDto.customerAdd2}' &&
	                address3 == '${customerDto.customerAdd3}'
	            ) {
	                return false;
	            }
	            
	            // 필드에 값이 없는 경우 유효하지 않음
	            if (
	            		name.trim() === "" ||
		                nickname.trim() === "" ||
		                gender.trim() === "" ||
		                birth.trim() === "" ||
		                phone.trim() === "" ||
		                email.trim() === "" ||
		                address1.trim() === "" ||
		                address2.trim() === "" ||
		                address3.trim() === ""
	            ) {
	                return false;
	            }
	            
	            if (gender === "성별을 선택하세요.") {
	                return false;
	            }

	            // 모든 필드가 유효한 경우 true 반환
	            return true;
	        }
	        
	        function checkChange() {
	        	var name = $("#name").val();
	            var nickname = $("#nickname").val();
	            var gender = $("#gender").val();
	            var birth = $("#birth").val();
	            var phone = $("#phone").val();
	            var email = $("#email").val();
	            var address1 = $("#address1").val();
	            var address2 = $("#address2").val();
	            var address3 = $("#address3").val();

	            // 필드에 값이 바뀐 경우 표시
	            if(name.trim() == '') {
	            	$("#name").css("border-color", "#e00000");
	            	$("#name").css("border-width", "3px");
	            } else if (name != '${customerDto.customerName}') {
	            	$("#name").css("border-color", "#0058C6");
	            	$("#name").css("border-width", "3px");
	            } else {
	            	$("#name").css("border-color", "#ced4da");
	            	$("#name").css("border-width", "1px");
	            }
	            
	            if(nickname.trim() == '') {
	            	$("#nickname").css("border-color", "#e00000");
	            	$("#nickname").css("border-width", "3px");
	            } else if (nickname != '${customerDto.customerNickname}') {
	            	$("#nickname").css("border-color", "#0058C6");
	            	$("#nickname").css("border-width", "3px");
	            } else {
	            	$("#nickname").css("border-color", "#ced4da");
	            	$("#nickname").css("border-width", "1px");
	            }
	            
	            if(gender === "성별을 선택하세요.") {
	            	$("#gender").css("border-color", "#e00000");
	            	$("#gender").css("border-width", "3px");
	            } else if (gender != '${customerDto.customerGender}') {
	            	$("#gender").css("border-color", "#0058C6");
	            	$("#gender").css("border-width", "3px");
	            } else {
	            	$("#gender").css("border-color", "#ced4da");
	            	$("#gender").css("border-width", "1px");
	            }
	            
	            if(birth.trim() == '') {
	            	$("#birth").css("border-color", "#e00000");
	            	$("#birth").css("border-width", "3px");
	            } else if (birth != '${customerDto.customerBirth}') {
	            	$("#birth").css("border-color", "#0058C6");
	            	$("#birth").css("border-width", "3px");
	            } else {
	            	$("#birth").css("border-color", "#ced4da");
	            	$("#birth").css("border-width", "1px");
	            }
	            
	            if(phone.trim() == '') {
	            	$("#phone").css("border-color", "#e00000");
	            	$("#phone").css("border-width", "3px");
	            } else if (phone != '${customerDto.customerTel}') {
	            	$("#phone").css("border-color", "#0058C6");
	            	$("#phone").css("border-width", "3px");
	            } else {
	            	$("#phone").css("border-color", "#ced4da");
	            	$("#phone").css("border-width", "1px");
	            }
	            
	            if(email.trim() == '') {
	            	$("#email").css("border-color", "#e00000");
	            	$("#email").css("border-width", "3px");
	            } else if (email != '${customerDto.customerEmail}') {
	            	$("#email").css("border-color", "#0058C6");
	            	$("#email").css("border-width", "3px");
	            } else {
	            	$("#email").css("border-color", "#ced4da");
	            	$("#email").css("border-width", "1px");
	            }
	            
	            if (address1 != '${customerDto.customerAdd1}') {
	            	$("#address1").css("border-color", "#0058C6");
	            	$("#address1").css("border-width", "3px");
	            } else {
	            	$("#address1").css("border-color", "#ced4da");
	            	$("#address1").css("border-width", "1px");
	            }
	            
	            if (address2 != '${customerDto.customerAdd2}') {
	            	$("#address2").css("border-color", "#0058C6");
	            	$("#address2").css("border-width", "3px");
	            } else {
	            	$("#address2").css("border-color", "#ced4da");
	            	$("#address2").css("border-width", "1px");
	            }
	            
	            if(address3.trim() == '') {
	            	$("#address3").css("border-color", "#e00000");
	            	$("#address3").css("border-width", "3px");
	            } else if (address3 != '${customerDto.customerAdd3}') {
	            	$("#address3").css("border-color", "#0058C6");
	            	$("#address3").css("border-width", "3px");
	            } else {
	            	$("#address3").css("border-color", "#ced4da");
	            	$("#address3").css("border-width", "1px");
	            }
	        }

	        // 필드 값이 변경될 때마다 실행
	        $("select").on("input", function() {
	        	checkChange();
	            if (validateFields()) {
	                $("#submitBtn").prop("disabled", false);
	            } else {
	                $("#submitBtn").prop("disabled", true);
	            }
	        });
	        
	        $("input").on("input", function() {
	        	checkChange();
	            if (validateFields()) {
	                $("#submitBtn").prop("disabled", false);
	            } else {
	                $("#submitBtn").prop("disabled", true);
	            }
	        });
	        
	        $("#idexBtn").click(function(e) {
	        	e.preventDefault();
	            var url = "/member/main";
	            window.location.href = url;
	        });
	    });
	</script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>
