<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>포인트충전</title>
</head>
<body>
	<c:import url="../top_customer.jsp" />
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">충전하기</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 충전 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">CHARGE POINT</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-12">
								<div class="form-floating">
									<select id="amount" class="form-control">
										<option>충전금액을 선택하세요.</option>
										   <option>100</option>
										   <option>200</option>
									  </select>
									  <label for="amount">충전금액</label>
								</div>
							</div>
							<div class="col-12">
								<button id="payBtn" class="btn btn-primary w-100 py-3">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 충전 End -->

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

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	$(document).ready(function(){
		$('#payBtn').click(function(){
			requestPay();
		})
	});
	
	var IMP = window.IMP;  
  	IMP.init("imp07481554");
  	
	function requestPay() {
		 if($('#amount').val() < 100){
			 alert('100원부터 결제 가능합니다')
			 return;
		 }
		 
	    IMP.request_pay({
	      pg: "html5_inicis.INIpayTest",
	      pay_method: "card",
	      merchant_uid: new Date().getTime(), // 결제번호
	      name: "기부앤테이크포인트", //회사이름
	      amount: $('#amount').val(),   // 숫자 타입
	      buyer_name: "${dto.customerName}",
	      buyer_tel: "${dto.customerTel}",
	      buyer_postcode : "${dto.customerAdd1}",
	      buyer_addr: "${dto.customerAdd2}"
	    }, function(rsp) {
		    if ( rsp.success ) {
		    	$.ajax({
		        	type: "POST",
	                url: "/member/point_charge_action",
	                data: { impUid: rsp.imp_uid, merchantUid: rsp.merchant_uid, chargeAmount : rsp.paid_amount },
		        }).done(function(data){
				    	var msg = '결제가 완료되었습니다.\n';
				        msg += '상점 거래ID : ' + rsp.merchant_uid+'\n';
				        msg += '결제 금액 : ' + rsp.paid_amount;
					    alert(msg);
					    history.go(0);
		        });
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
				    alert(msg);
		    }
	    });
	}
</script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
