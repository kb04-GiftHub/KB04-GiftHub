<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정산하기</title>
</head>
<body>
	<c:import url="../top.jsp" />
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
                <div class="row g-5 py-5">
                    <div class="col-12 text-center">
                        <h1 class="text-white animated slideInDown">정산하기</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 정산 Start -->
	<div class="container-xxl py-5">
		<div class="container py-5 px-lg-5">
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<h1 class="text-center mb-5">EXCHANGE POINT</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-center mb-4"></p>
						<div class="row g-3">
							<div class="col-12">
								<div class="form-floating">
									<h3 style="text-align: center;">MY POINT : <fmt:formatNumber value="${dto.storePoint}" type="currency" currencySymbol=""/>P</h3>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<input type="text" class="form-control" id="bank" name="bank" placeholder="은행명">
									<label for="bank">은행명</label>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<input type="text" class="form-control" id="account" name="account" placeholder="계좌번호">
									<label for="account">계좌번호</label>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<input type="number" class="form-control" id="amount" name="amount" placeholder="환전금액">
									<label for="amount">환전금액</label>
								</div>
							</div>
							<div class="col-12">
								<button id="exchangeBtn" class="btn btn-primary w-100 py-3">정산하기</button>
							</div>
							<div class="col-lg-12 text-center">
								<hr style="margin: 50px 0;">
								<p class="mb-4">정산내역을 그래프로 한눈에 확인 가능합니다!</p>
								<a class="btn btn-primary rounded-pill py-3 px-5" href="/exchange?storeId=${loggedStoreId}">정산내역 확인하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 정산 End -->

	<c:import url="../footer.jsp" />
	
	<div id="result" class="modal fade" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 id="title" class="modal-title"></h5>
	        <button type="button" class="btn-close" onclick="history.go(0);"></button>
	      </div>
	      <div class="modal-body">
	        <p id="content1" style="margin: 0"></p>
	        <p id="content2" style="margin: 0"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="history.go(0);">확인</button>
	      </div>
	    </div>
	  </div>
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
		$(document).ready(function(){
			$('#exchangeBtn').click(function(){
				requestExchange();
			})
		});
		
		function requestExchange() {
			var point = ${dto.storePoint};
			var exchangeBank = $('#bank').val();
			var exchangeAccount = $('#account').val();
			var exchangeMoney = $('#amount').val();
			
			if(point >= exchangeMoney) {
				$.ajax({
	                type: "POST",
	                url: "/store/point_exchange_action",
	                data: { exchangeBank: exchangeBank, exchangeAccount: exchangeAccount,  exchangeMoney : exchangeMoney },
	                success: function (data) {
	                	var msg1 = '정산이 완료되었습니다.';
				    	
	                	var exchangedAmount = Number(exchangeMoney);
				    	var formattedAmount = exchangedAmount.toLocaleString('ko-KR', {
				    	});
				    	console.log(formattedAmount);
				    	var msg2 = formattedAmount + ' 포인트가 정산되었습니다.';
				    	
				    	$('#title').text('포인트 정산 완료');
				        $('#content1').text(msg1);
				        $('#content2').text(msg2);
						$('#result').modal('show');
	                },
	                error: function (error) {
	                	var msg1 = '정산에 실패하였습니다.';
	                	var msg2 = '다시 시도해주세요.';
	                	$('#title').text('포인트 정산 실패');
	                	$('#content1').text(msg1);
	                	$('#content2').text(msg2);
	                	$('#result').modal('show');
	                }
	            });
			} else {
				var msg1 = '정산에 실패하였습니다.';
            	var msg2 = '포인트가 부족합니다.';
            	$('#title').text('포인트 정산 실패');
            	$('#content1').text(msg1);
            	$('#content2').text(msg2);
            	$('#result').modal('show');
			}
			
		}
	</script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>
